#!/bin/sh

state=$(cat /sys/devices/platform/smapi/BAT0/state)

if [ $state = "charging" ]; then
    echo " CHARGING "
elif [ $state = "discharging" ]; then
    echo " DISCHARGE "
elif [ $state = "idle" ]; then
    echo " IDLE "
else
    echo " UNKNOWN "
fi
