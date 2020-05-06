#!/usr/bin/env bash

sanitizer
pkill -f "bash /home/bandithijo/bin/dwmstatus"; dwmstatus &
killall dunst; dunst -config ~/.config/dunst/dunstrc &
xsetroot -solid "#222222"
xsetroot -cursor_name left_ptr
xinput set-button-map "TPPS/2 IBM TrackPoint" 1 0 3
killall unclutter; unclutter --timeout 3
pkill -f "notify-hightemp"; notify-hightemp &
pkill -f "bash /usr/bin/clipmenud";killall clipnotify; clipmenud &
killall flameshot; flameshot &
killall lxpolkit; lxpolkit &
feh --bg-fill -Z $WALLPAPER2
xcompmgr &


# Not used anymore
#killall xautolock; xautolock -time 60 -locker "~/bin/lock-dark" &
#$HOME/.config/polybar/launch.sh
#killall picom; picom --config ~/.config/picom/picom.conf --no-use-damage &
#xfce4-power-manager &
#killall notify-listener; # notify-listener.py &
#$HOME/.config/conky/conky-launch.sh &
