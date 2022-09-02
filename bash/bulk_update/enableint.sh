#!/usr/bin/expect -f

set timeout 10
set IP [lindex $argv 0]
set Username "admin"
set Password "pass"
#spawn telnet 10.1.255.254
spawn telnet $IP
expect "Username:"
send "admin\r"
expect "Password:"
send "pass\r"

# Wait for a prompt. Adjust as needed to match the expected prompt.
expect "#"
send "terminal length 0\r"
expect "#"
#send "end\r"
#expect "#"
#send "wr\r"
#send "sh int trun\r"
#send "show spanning-tree blockedports\r"
send "sh mac address-table | i 227b\r"
#send "sh run | i prior\r"
#send "sh int status | i 199\r"
#send "sh interfaces trunk\r"

#send "clear counters\r"
#send "\r"

#send "sh int | i broad|Giga\r"
#send "sh int status | i connecte\r"

#send "sh cdp neighbors\r"
#send "sh spanning-tree summary\r"
#CreateVLAN
#expect "#"
#send "conf t\r"
#expect "(config)#"
#send "vlan 8\r"
#expect "(config-vlan)#"
#send "name iLo-mgmt\r"
#expect "(config-vlan)#"
#send "end\r"
#expect "#"
#send "wr\r"
expect "#"
send "exit\r"
