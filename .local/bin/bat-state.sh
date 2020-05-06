#!/usr/bin/env bash

# FreeBSD
#state=$(sysctl -n hw.acpi.battery.state)
#if [ $state = "2" ]; then
#    echo " " # charging
#elif [ $state = "1" ]; then
#    echo ""  # discharging
#elif [ $state = "0" ]; then
#    echo " " # idle
#else
#    echo ""  # unknown
#fi

# GNU/Linux
state=$(cat /sys/devices/platform/smapi/BAT0/state)
if [ $state = "charging" ]; then
    echo " " # charging
elif [ $state = "discharging" ]; then
    echo " " # discharging
elif [ $state = "idle" ]; then
    echo " " # idle
else
    echo " " # unknown
fi
