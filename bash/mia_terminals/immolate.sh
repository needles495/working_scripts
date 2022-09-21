#!/bin/bash
#Created by puppet
PATH=/home/mia-asus1/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
export DISPLAY=:0

#a=$(ps aux | grep "google-chrome" | grep -v root | wc -l)
a=$(ps aux | grep [s]imulate-outdated | wc -l)
#b=$(ps aux | grep "/usr/bin/google-chrome" | grep ^mia | wc -l)
if [[ "$a" -ne 1 ]]; then
    pkill chrome
#    /usr/bin/google-chrome --kiosk --incognito --disable-pinch --simulate-outdated-no-au='Tue, 31 Dec 2099 23:59:59 GMT' --no-first-run --no-default-browser-check --disable-features=TranslateUI http://109.73.14.199:22082
    /usr/bin/google-chrome --kiosk --incognito --disable-pinch --simulate-outdated-no-au='Tue, 31 Dec 2099 23:59:59 GMT' --no-first-run --no-default-browser-check --disable-features=TranslateUI https://tech.workeat.com:22443/terminal-interface/
fi
