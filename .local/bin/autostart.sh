#!/usr/bin/env bash

pkill -f "bash ./autostart.sh"
killall dunst; dunst -config ~/.config/dunst/dunstrc &
killall xautolock; xautolock -time 60 -locker "/usr/local/bin/lock-dark" &
xsetroot -solid "#262626" &
xsetroot -cursor_name left_ptr &
xmodmap -e "pointer = 1 0 3 4 5 6 7 8 9 10 11 12"
xinput set-button-map "TPPS/2 IBM TrackPoint" 1 0 3 &
sanitizer &
pkill -f "ruby:\ notify-hightemp"; notify-hightemp &
pkill -f "bash /usr/local/bin/clipmenud";killall clipnotify; clipmenud &
feh --bg-fill -Z $HOME/pic/Wallpaper/archWallpaper/Arch-Wallpaper-11-dark.png
sudo dnscrypt-proxy -config /usr/local/etc/dnscrypt-proxy/dnscrypt-proxy.toml &
dwmstatus &


# Not used anymore
#xcompmgr &
#$HOME/.config/polybar/launch.sh
#killall picom; picom --config ~/.config/picom/picom.conf --no-use-damage &
#xfce4-power-manager &
#killall lxpolkit; lxpolkit &
#killall notify-listener; # notify-listener.py &
#$HOME/.config/conky/conky-launch.sh &
