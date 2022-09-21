#!/bin/bash

ipaddress=$(/sbin/ifconfig | grep '\.100 ' | awk '{print $2}' | sed -e s/.*://)
arpa=$(printf 'arpa.in-addr.%s.' "$ipaddress" | tac -s.)
#fqdn=$(hostname -f).
fqdn=$(grep ora /etc/hosts | awk -F " " '{print $2}').
#mydnsserver=$(nslookup -type=soa $(hostname -d) | grep origin | awk -F'= ' '{print $2}')
mydnsserver="pdc.mega-pol.ru"
echo "server $mydnsserver
update add $fqdn 3600 IN A $ipaddress
send
update add $arpa 3600 IN PTR $fqdn
send
quit
" | nsupdate -d
