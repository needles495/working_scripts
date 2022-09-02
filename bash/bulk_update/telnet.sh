#!/bin/bash

while read IP
do
    export IP
    ./enableint.sh $IP
#done < cd.ip.list
done < IP-list
