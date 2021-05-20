#!/bin/sh

# Terminate already running bar instances
killall -q polybar

monitors=$(xrandr --listmonitors | grep 'Monitors:' | tr -d "Monitors: ")
current=$(xrandr --query | grep "current" | cut -d " " -f 8,9,10 | tr -d ",")

if type "xrandr"; then
    if [ $monitors = 2 ] || [ $current = "10x24 x 768" ]; then
        polybar bartop -r &
        polybar barbottom -r &
        notify-send "hello"
    else
        for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
            # MONITOR=$m polybar bartop -r & polybar barbottom -r &
            MONITOR=$m polybar bartop -r &
        done
        polybar barbottom -r &
    fi
else
    # Call bar inside config
    polybar bartop -r &
    polybar barbottom -r &
fi
