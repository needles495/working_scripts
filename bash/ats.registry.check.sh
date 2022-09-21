#!/bin/bash

PATH=/usr/lib64/qt-3.3/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
CMD=`rasterisk -x "sip show registry" | egrep -i "No Authentication|Unregistered|Request Sent|Rejected" | wc -l`
$MAIL_TO=admin@example.com
$MAIL_FROM=asterisk@example.com

if [ $CMD -ne 0 ]; then
    if [ -f /tmp/registry.check.tmp ]; then
        echo $CMD > /tmp/registry.check
    else
        echo $CMD > /tmp/registry.check.tmp
    fi
else
    [ -f /tmp/registry.check ] && rm /tmp/registry.check
    [ -f /tmp/registry.check.tmp ] && rm /tmp/registry.check.tmp
fi


#Отправка e-mail
#if [ $CMD -ne 0 ]; then
#
#    echo "From: $MAIL_FROM " > /tmp/email_alert
#    echo "Subject: Отвалилась регистрация у провайдера телефонии" >> /tmp/email_alert
#    echo "" >> /tmp/email_alert
#    rasterisk -x "sip show registry" | grep -v Registered >> /tmp/email_alert
#    sendmail $MAIL_TO < /tmp/email_alert
#
#fi
