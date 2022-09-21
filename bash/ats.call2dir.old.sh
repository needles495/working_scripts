#!/bin/bash

cat /tmp/ip | awk -F "." '{print 2 $3 1}' > /tmp/kassa_phone
cat /tmp/ip2 | awk -F "." '{print 2 $3 2}' > /tmp/dir_phone
#Не работает для новых магазинов:
#sed -i 's/192.168./2/g; s/.[0-9][0-9][0-9]/2/g' /tmp/ip
#sed -i 's/192.168./2/g; s/.[0-9][0-9][0-9]/1/g' /tmp/ip2
PHONENUMBER=`cat /tmp/kassa_phone`
PHONENUMBER2=`cat /tmp/dir_phone`
#PHONENUMBER3=`cat /tmp/ip3`
echo "$PHONENUMBER2" >> /tmp/log.call
echo "$PHONENUMBER" >> /tmp/log.call
echo `/usr/sbin/asterisk -rx "channel originate SIP/"$PHONENUMBER" application Playback /var/lib/asterisk/sounds/ru/custom/camera_not_work"` >> /tmp/log.call
/usr/sbin/asterisk -rx "channel originate SIP/"$PHONENUMBER" application Playback /var/lib/asterisk/sounds/ru/custom/camera_not_work" && echo ok >> /tmp/log.call
/usr/sbin/asterisk -rx "channel originate SIP/"$PHONENUMBER2" application Playback /var/lib/asterisk/sounds/ru/custom/camera_not_work" || echo notok >> /tmp/log.call
#/usr/sbin/asterisk -rx "channel originate SIP/"$PHONENUMBER3" application Playback /var/lib/asterisk/sounds/custom/camera"
