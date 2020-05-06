#!/bin/sh

state=$(sysctl -n hw.acpi.battery.state)

if [ $state = "2" ]; then
    echo " " # charging
elif [ $state = "1" ]; then
    echo ""  # discharging
elif [ $state = "0" ]; then
    echo " " # idle
else
    echo ""  # unknown
fi
