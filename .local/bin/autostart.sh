#!/usr/bin/env bash

sanitizer
pkill -f "slstatus"; slstatus &
pkill -f "sxhkd"; sxhkd -c ~/.config/sxhkd/dwm-sxhkdrc &
pkill -f "dunst"; dunst -config ~/.config/dunst/dunstrc &
xsetroot -solid "#1E1E1E"
feh --bg-fill -Z $WALLPAPER1
xinput set-button-map "TPPS/2 IBM TrackPoint" 1 0 3
pkill -f "unclutter"; unclutter --timeout 3 &
pkill -f "notify-hightemp"; notify-hightemp &
pkill -f "bash /usr/bin/clipmenud"; pkill -f "clipnotify"; /usr/bin/clipmenud &
/usr/bin/flameshot &
pkill -f "xcompmgr"; xcompmgr &
pkill -f "lxpolkit"; lxpolkit &

# I'm not use this anymore
#pkill -f "xautolock"; xautolock -time 60 -locker "/usr/bin/slimlock" &
#pkill -f picom; picom --config ~/.config/picom/picom.conf --no-use-damage &
#$HOME/.config/polybar/launch.sh
#xfce4-power-manager &
#killall notify-listener; # notify-listener.py &
#$HOME/.config/conky/conky-launch.sh &
#xsetroot -cursor_name left_ptr
