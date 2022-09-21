#!/bin/bash

ip=$(cat /tmp/unifi_ip)

if [[ $ip == 10\.3\.\2.* ]]; then
        echo "sklad $ip" >> /tmp/sklad
fi

if [[ $ip == 10\.3\.* ]]; then
    SHP_ID=$(echo $ip | awk -F "." '{print $3}')
    phone1=$(echo $ip | awk -F "." '{print $1 "." $2 "." $3 ".240"}')
    PHONENUMBER1=$(sudo rasterisk -x "sip show peers" | grep $phone1 | head -n 1 | awk -F " " '{print $1}' | awk -F "/" '{print $1}')
    phone2=$(echo $ip | awk -F "." '{print $1 "." $2 "." $3 ".241"}')
    PHONENUMBER2=$(sudo rasterisk -x "sip show peers" | grep $phone2 | head -n 1 | awk -F " " '{print $1}' | awk -F "/" '{print $1}')
    sed "s/INSERT_PHONE_NUMBER/$PHONENUMBER1/g" /home/scripts/zabbix_call/unifi_not_work.call > /tmp/unifi_not_work_phone1.call
    sed "s/INSERT_PHONE_NUMBER/$PHONENUMBER2/g" /home/scripts/zabbix_call/unifi_not_work.call > /tmp/unifi_not_work_phone2.call
    cp /tmp/unifi_not_work_phone* /var/spool/asterisk/outgoing/
fi

if [[ $ip == 10\.1\.* ]]; then
    SHP_ID=$(echo $ip | awk -F "." '{print $3}')
    phone1=$(echo $ip | awk -F "." '{print $1 "." $2 "." $3 ".240"}')
    PHONENUMBER1=$(sudo rasterisk -x "sip show peers" | grep $phone1 | head -n 1 | awk -F " " '{print $1}' | awk -F "/" '{print $1}')
    phone2=$(echo $ip | awk -F "." '{print $1 "." $2 "." $3 ".241"}')
    PHONENUMBER2=$(sudo rasterisk -x "sip show peers" | grep $phone2 | head -n 1 | awk -F " " '{print $1}' | awk -F "/" '{print $1}')
    sed "s/INSERT_PHONE_NUMBER/$PHONENUMBER1/g" /home/scripts/zabbix_call/unifi_not_work.call > /tmp/unifi_not_work_phone1.call
    sed "s/INSERT_PHONE_NUMBER/$PHONENUMBER2/g" /home/scripts/zabbix_call/unifi_not_work.call > /tmp/unifi_not_work_phone2.call
    cp /tmp/unifi_not_work_phone* /var/spool/asterisk/outgoing/
fi

if [[ $ip == 192\.168\.* ]]; then
    SHP_ID=$(echo $ip | awk -F "." '{print $3}')
    phone1=$(echo $ip | awk -F "." '{print $1 "." $2 "." $3 ".240"}')
    PHONENUMBER1=$(sudo rasterisk -x "sip show peers" | grep $phone1 | head -n 1 | awk -F " " '{print $1}' | awk -F "/" '{print $1}')
    phone2=$(echo $ip | awk -F "." '{print $1 "." $2 "." $3 ".241"}')
    PHONENUMBER2=$(sudo rasterisk -x "sip show peers" | grep $phone2 | head -n 1 | awk -F " " '{print $1}' | awk -F "/" '{print $1}')
    sed "s/INSERT_PHONE_NUMBER/$PHONENUMBER1/g" /home/scripts/zabbix_call/unifi_not_work.call > /tmp/unifi_not_work_phone1.call
    sed "s/INSERT_PHONE_NUMBER/$PHONENUMBER2/g" /home/scripts/zabbix_call/unifi_not_work.call > /tmp/unifi_not_work_phone2.call
    cp /tmp/unifi_not_work_phone* /var/spool/asterisk/outgoing/
fi

if [[ $ip == 10.??.9* ]]; then
    SHP_ID=$(echo $ip | awk -F "." '{print $2}')
    phone1=$(echo $ip | awk -F "." '{print $1 "." $2 "." $3 ".240"}')
    PHONENUMBER1=$(sudo rasterisk -x "sip show peers" | grep $phone1 | head -n 1 | awk -F " " '{print $1}' | awk -F "/" '{print $1}')
    phone2=$(echo $ip | awk -F "." '{print $1 "." $2 "." $3 ".241"}')
    PHONENUMBER2=$(sudo rasterisk -x "sip show peers" | grep $phone2 | head -n 1 | awk -F " " '{print $1}' | awk -F "/" '{print $1}')
    sed "s/INSERT_PHONE_NUMBER/$PHONENUMBER1/g" /home/scripts/zabbix_call/unifi_not_work.call > /tmp/unifi_not_work_phone1.call
    sed "s/INSERT_PHONE_NUMBER/$PHONENUMBER2/g" /home/scripts/zabbix_call/unifi_not_work.call > /tmp/unifi_not_work_phone2.call
    cp /tmp/unifi_not_work_phone* /var/spool/asterisk/outgoing/
fi
