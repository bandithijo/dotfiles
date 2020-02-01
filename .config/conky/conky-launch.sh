#!/bin/env sh

killall conky

sed -i "s/xftalpha =.*$/xftalpha = 1.0,/g" \
    ~/.config/conky/conkyrc-dark-bspwm
sed -i "s/own_window_argb_value =.*$/own_window_argb_value = 255,/g" \
    ~/.config/conky/conkyrc-dark-bspwm
conky -c $HOME/.config/conky/conkyrc-dark-bspwm &

sleep 0.8

sed -i "s/own_window_argb_visual =.*$/own_window_argb_visual = false,/g" \
    ~/.config/conky/conkyrc-dark-bg
conky -c $HOME/.config/conky/conkyrc-dark-bg &

sed -i "s/own_window_argb_visual =.*$/own_window_argb_visual = false,/g" \
    ~/.config/conky/conkyrc-logo
conky -c $HOME/.config/conky/conkyrc-logo &
