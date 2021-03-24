#!/bin/sh

## Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
export SSH_AUTH_SOCK

# Keychain
#eval $(keychain --agents ssh,gpg --eval --quiet ~/.ssh/bandithijodotcom)

# ASKPASS
export SUDO_ASKPASS="$HOME/bin/dmenu-sudo"

# Aliasing git to hub
eval "$(hub alias -s)"

# Executed by startx (run your window manager from here)
xrdb -load ~/.Xresources

# Load .profile
[ -f ~/.profile ] && . ~/.profile

# Load systemd-user.sh
[ -f /etc/X11/xinit/xinitrc.d/50-systemd-user.sh ] && . /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# Autostart (STATIC)
xsetroot -solid "#1E1E1E"
feh --bg-fill -Z $WALLPAPER3
xinput set-button-map "TPPS/2 IBM TrackPoint" 1 0 3
xmodmap ~/.xmodmap
xcape -e 'Mode_switch=Escape'

# Autostart (DYNAMIC)
sanitizer
sxhkd -c ~/.config/sxhkd/sxhkdrc &
dunst -config ~/.config/dunst/dunstrc &
unclutter --timeout 3 &
flameshot &
clipmenud &
polkit-mate-authentication-agent-1 &

# Lunch dbus-launch, this is important for some app
if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
    eval `dbus-launch --sh-syntax --exit-with-session`
fi

# For dwm
while true; do
   # Log stderror to a file
   /usr/local/bin/dwm 2> ~/.dwm.log
done
