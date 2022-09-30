#!/bin/bash

disk="/dev/$1"

function find_device {
    if [[ -b $disk  ]]; then
        echo "You select device: $disk"
    else
        echo "No disk found"
        exit 1
    fi
}

#Проверяем корректность указанного диска:
find_device

#Создаем файл для разметки нового диска
cat << EOF > disk.part
label: gpt
label-id: E4CE9292-666D-458F-B489-DD0344D45C3C
device: /dev/sda
unit: sectors
first-lba: 34
last-lba: 250069646

/dev/sda1 : start=        2048, size=     1048576, type=C12A7328-F81F-11D2-BA4B-00A0C93EC93B, uuid=07680E76-D074-40F6-8AD1-342ED37271A9, name="EFI System Partition"
/dev/sda2 : start=     1050624, size=   249019023, type=0FC63DAF-8483-4772-8E79-3D69D8477DE4, uuid=750243BC-DEDC-4F71-81BB-3A27C0B8FB42
EOF

#Размечаем диск и создаем файловые системы
cat disk.part | sfdisk $disk

mkfs.vfat $disk\1
mkfs.ext4 $disk\2


#Ищем UUID дисков и генерим загрузочный fstab
BOOT_UUID=$(blkid | grep $disk | grep -P -o "UUID=.*\" " | sed 's/\ TYPE=.*//g' | sed 's/"//g' | head -1)
ROOT_UUID=$(blkid | grep $disk | grep -P -o "UUID=.*\" " | sed 's/\ TYPE=.*//g' | sed 's/"//g' | tail -1)

cat << EOF > fstab.new
$ROOT_UUID /               ext4    errors=remount-ro 0       1
$BOOT_UUID  /boot/efi       vfat    umask=0077      0       1
/swapfile                                 none            swap    sw              0       0
EOF

#sed -i.fstab.work "s/ROOT_UUID/$ROOT_UUID/g" fstab.template
#sed -i.fstab.work "s/BOOT_UUID/$BOOT_UUID/g" fstab.template

mount $disk\2 /mnt
rm -rf /mnt/*
mkdir -p /mnt/boot/efi/
mount $disk\1 /mnt/boot/efi/

#get_obraz_usb_folder
USB_ID_PATH=$(lsblk -o mountpoint | grep media | grep ubuntu)

rsync -avz $USB_ID_PATH/obraz/* /mnt/
#rsync -avz /media/ubuntu/$USB_ID_PATH/obraz/* /mnt/

cp fstab.new /mnt/etc/fstab

mkdir /mnt/proc ; mkdir /mnt/dev ; mkdir /mnt/sys
chroot /mnt/
mount none -t proc /proc/ ; mount none -t sysfs /sys/ ; mount none -t devtmpfs /dev/ ; mount none -t devpts /dev/pts/

grub-install $disk
update-grub2

umount /proc ; umount /sys ; umount /dev/pts ; umount /dev
exit
