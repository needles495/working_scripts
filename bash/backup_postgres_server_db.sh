#!/bin/bash

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
#расположение директории backup
DIR="/var/lib/postgresql/backup"
TIMENAME=`date +%d.%m.%Y`
#Список баз:
BASES=$(psql -l | grep server | awk '{print $1}')


for BASE in $BASES; do
    pg_dump -w -Fc $BASE > "$DIR/$BASE"_"$TIMENAME.dump"
done
