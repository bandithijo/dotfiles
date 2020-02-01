#!/bin/env sh

killall conky

sed -i "s/xftalpha =.*$/xftalpha = 0.5,/g" \
    ~/.config/conky/conkyrc-dark-bspwm
sed -i "s/own_window_argb_value =.*$/own_window_argb_value = 0,/g" \
    ~/.config/conky/conkyrc-dark-bspwm
conky -c $HOME/.config/conky/conkyrc-dark-bspwm &

sleep 0.8

sed -i "s/own_window_argb_visual =.*$/own_window_argb_visual = true,/g" \
    ~/.config/conky/conkyrc-dark-bg
conky -c $HOME/.config/conky/conkyrc-dark-bg &

sed -i "s/own_window_argb_visual =.*$/own_window_argb_visual = true,/g" \
    ~/.config/conky/conkyrc-logo
conky -c $HOME/.config/conky/conkyrc-logo &
