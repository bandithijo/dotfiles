#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Call bar inside config
polybar bartop -r &
polybar barbottom -r &
