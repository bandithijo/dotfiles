#!/usr/bin/env bash

# FreeBSD
#cap=$(sysctl -n hw.acpi.battery.life)
#if [ $cap -ge 0 ] && [ $cap -le 20 ]; then
#    echo "" $cap
#elif [ $cap -ge 21 ] && [ $cap -le 40 ]; then
#    echo "" $cap
#elif [ $cap -ge 41 ] && [ $cap -le 60 ]; then
#    echo "" $cap
#elif [ $cap -ge 61 ] && [ $cap -le 90 ]; then
#    echo "" $cap
#elif [ $cap -ge 91 ] && [ $cap -le 100 ]; then
#    echo "" $cap
#else
#    echo "UNKNOWN"
#fi

# GNU/Linux
cap=$(cat /sys/devices/platform/smapi/BAT0/remaining_percent)
if [ $cap -ge 0 ] && [ $cap -le 20 ]; then
    echo "" $cap"%"
elif [ $cap -ge 21 ] && [ $cap -le 40 ]; then
    echo "" $cap"%"
elif [ $cap -ge 41 ] && [ $cap -le 60 ]; then
    echo "" $cap"%"
elif [ $cap -ge 61 ] && [ $cap -le 90 ]; then
    echo "" $cap"%"
elif [ $cap -ge 91 ] && [ $cap -le 100 ]; then
    echo "" $cap"%"
else
    echo "UNKNWN"
fi
