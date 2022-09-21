#!/bin/bash

USB_FIRST_ARG=`lsusb  | grep PAX | cut -d' ' -f2`
USB_SECOND_ARG=`lsusb  | grep PAX | cut -d' ' -f4 | cut -d':' -f1`

usbreset /dev/bus/usb/$USB_FIRST_ARG/$USB_SECOND_ARG && /opt/croc/sber/PC_STUB/Linux/sb_pilot 26
