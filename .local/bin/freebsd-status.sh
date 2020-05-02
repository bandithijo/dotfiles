#!/usr/local/bin/bash

# while true; do
date="$(date "+%a %d-%m-%Y %H:%M:::%Z")"
volume="$(mixer | grep 'pcm' | awk '{print $7}')"
cputemp="$(sysctl -a | grep 'dev.cpu.5.temperature' | awk '{print $2}')"
memusage="$(freecolor -m -o | grep 'Mem' | awk '{print $4}')"
memtotal="$(freecolor -m -o | grep 'Mem' | awk '{print $2}')"
ipaddress="$(ifconfig wlan0 | grep 'inet' | awk '{print $2}')"
download="$(ifstat -i wlan0 1 3 | awk 'NR%5==0 {print $1}')"
upload="$(ifstat -i wlan0 1 3 | awk 'NR%5==0 {print $2}')"

echo ${download}KB/s ${upload}KB/s ${memusage}MB/${memtotal}MB ${cputemp} $ipaddress $volume $date
# sleep 1
# done
