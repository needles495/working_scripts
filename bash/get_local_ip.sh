#!/bin/bash

ip a | grep -P "((\d|\d{2}|1\d{2}|2[0-4]\d|25[0-5])\.){3}(\d|\d{2}|1\d{2}|2[0-4]\d|25[0-5])*" | awk -F " " '{print $2}'