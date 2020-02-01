#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Mengambil variabel WM untuk dipakai di bawah
wm=$(neofetch grep "wm" | cut -c5-)

# For multimonitor
#if type "xrandr"; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#       MONITOR=$m polybar --reload bar$wm &
#   done
#else
#   MONITOR=$m
#   polybar --reload bar$wm &
#fi

# Untuk menjalankan Polybar sesuai WM yang sedang digunakan (i3 atau bspwm)
if [ $wm == "i3" ]; then
    polybar bar$wm -r &
elif [ $wm  = "bspwm" ]; then
    polybar bar$wm -r &
    polybar barbottom$wm -r &
fi
