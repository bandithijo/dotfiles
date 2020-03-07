#!/usr/bin/env sh

#  ██████                           ██ ██   ██   ██      ██ ██    ██
# ░█░░░░██                         ░██░░   ░██  ░██     ░██░░    ░░
# ░█   ░██   ██████   ███████      ░██ ██ ██████░██     ░██ ██    ██  ██████
# ░██████   ░░░░░░██ ░░██░░░██  ██████░██░░░██░ ░██████████░██   ░██ ██░░░░██
# ░█░░░░ ██  ███████  ░██  ░██ ██░░░██░██  ░██  ░██░░░░░░██░██   ░██░██   ░██
# ░█    ░██ ██░░░░██  ░██  ░██░██  ░██░██  ░██  ░██     ░██░██ ██░██░██   ░██
# ░███████ ░░████████ ███  ░██░░██████░██  ░░██ ░██     ░██░██░░███ ░░██████
# ░░░░░░░   ░░░░░░░░ ░░░   ░░  ░░░░░░ ░░    ░░  ░░      ░░ ░░  ░░░   ░░░░░░

#  ██     ██ ██          ██   ██
# ░░██   ██ ░░          ░░   ░██
#  ░░██ ██   ██ ███████  ██ ██████ ██████  █████
#   ░░███   ░██░░██░░░██░██░░░██░ ░░██░░█ ██░░░██
#    ██░██  ░██ ░██  ░██░██  ░██   ░██ ░ ░██  ░░
#   ██ ░░██ ░██ ░██  ░██░██  ░██   ░██   ░██   ██
#  ██   ░░██░██ ███  ░██░██  ░░██ ░███   ░░█████
# ░░     ░░ ░░ ░░░   ░░ ░░    ░░  ░░░     ░░░░░


# Start GNOME Keyring
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/local/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

## Executed by startx (run your window manager from here)
xrdb -load ~/.Xresources
xset +fp /usr/local/share/fonts
xset fp rehash

if [ -d /etc/X11/xinit/xinitrc.d  ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f"  ] && . "$f"
  done
  unset f
fi

# For Uniform look Qt and GTK
export QT_QPA_PLATFORMTHEME=qt5ct
export GTK2_RC_FILES=$HOME/.gtkrc-2.0

export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_SCREEN_SCALE_FACTORS=1
export QT_SCALE_FACTOR=1

export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
export FONTCONFIG_PATH=/etc/fonts

# Clipmenu Environment Variables
export CM_LAUNCHER=rofi-clipmenu
export CM_DIR=/tmp/clipmenu

# For Ranger define Terminal
export TERMCMD="st"

# For Ranger define Text Editor
export VISUAL="vim"

# For Pager always use Less
export LESS="-SRXF"

# For Wallpaper Path
export WALLPAPER1=$HOME/pic/Wallpapers/archWallpaper/Arch-Wallpaper-11X-dark.png
export WALLPAPER2=$HOME/pic/Wallpapers/archWallpaper/Arch-Wallpaper-11H-dark.png

# For default session
DEFAULTSESSION=bspwm
case "$1" in
    bspwm) exec bspwm ;;
    xfce) exec startxfce4 ;;
    *) exec $DEFAULTSESSION ;;
esac

# For dwm
#while true; do
#    /usr/local/bin/dwm 2> /dev/null
#done

# For dwm-status
#while true; do
#   /usr/bin/dwm-status 2>&1 >/dev/null &
#   sleep 1s
#done &
