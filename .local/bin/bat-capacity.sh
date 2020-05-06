#!/bin/sh

cap=$(sysctl -n hw.acpi.battery.life)
if [ $cap -ge 0 ] && [ $cap -le 20 ]; then
    echo "" $cap
elif [ $cap -ge 21 ] && [ $cap -le 40 ]; then
    echo "" $cap
elif [ $cap -ge 41 ] && [ $cap -le 60 ]; then
    echo "" $cap
elif [ $cap -ge 61 ] && [ $cap -le 90 ]; then
    echo "" $cap
elif [ $cap -ge 91 ] && [ $cap -le 100 ]; then
    echo "" $cap
else
    echo "UNKNOWN"
fi
