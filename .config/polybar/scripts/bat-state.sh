#!/bin/sh

state=$(sysctl -n hw.acpi.battery.state)

if [ $state = "2" ]; then
    echo " CHARGING"
elif [ $state = "1" ]; then
    echo " DISCHARGE"
elif [ $state = "0" ]; then
    echo " IDLE"
else
    echo " UNKNOWN"
fi
