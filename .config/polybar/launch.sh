#!/bin/sh

# Terminate already running bar instances
killall -q polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar bartop -r & polybar barbottom -r &
  done
else
  # Call bar inside config
  polybar bartop -r &
  polybar barbottom -r &
fi
