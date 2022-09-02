#!/bin/bash

#расположение директории с dump'ами
#PGPASSWORD="postgres"
DIR="/backups/Archive"
TIMENAME=`date +%d.%m.%Y`
BASES=$(psql -l | grep postgres | awk '{print $1}' | egrep -v "postgres|template|\|")
ARCHIVE_BASES=`find /backups/Archive/ | egrep "_01"`

for BASE in $BASES; do
    pg_dump -w -Fc $BASE > "$DIR/$BASE"_"$TIMENAME.dump"
done

for ARCHIVE_BASE in $ARCHIVE_BASES; do
    mv $ARCHIVE_BASE $DIR/monthly_backups/
done

#Очистка старых бэкапов
#Архивируются срезы за 9е число каждого месяца, и перемещаются в папку  /backups/Archive/monthly_backups/
#Потом очищается все,что старше 30 дней (43200 минут)
find /backups/Archive -maxdepth 1 -type f -mmin +43200 -delete
