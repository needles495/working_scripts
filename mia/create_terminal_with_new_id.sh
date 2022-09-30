#!/bin/bash

ID=$1


rm -rf /etc/openvpn/*
scp 195.133.11.24:/root/easy-rsa/configs/id$ID/* /etc/openvpn/
sed -i "s/^Hostname=10.1.255.*$/Hostname=10.1.255.$ID/g" /etc/zabbix/zabbix_agentd.conf
sed -i "s/^certname.*$/certname = id$ID/g" /etc/puppetlabs/puppet/puppet.conf
echo NEW$ID > /etc/hostname

systemctl unmask puppet.service
systemctl enable puppet.service
systemctl start puppet.service
puppet agent --enable
puppet agent --test
