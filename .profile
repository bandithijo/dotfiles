# $FreeBSD: releng/12.1/share/skel/dot.profile 337497 2018-08-08 19:24:20Z asomers $
#
# .profile - Bourne Shell startup script for login shells
#
# see also sh(1), environ(7).
#

# These are normally set through /etc/login.conf.  You may override them here
# if wanted.
# PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$HOME/bin; export PATH
# BLOCKSIZE=K;	export BLOCKSIZE

# Setting TERM is normally done through /etc/ttys.  Do only override
# if you're sure that you'll never log in via telnet or xterm or a
# serial line.

EDITOR=vim;   	                export EDITOR
PAGER=less;  	                export PAGER

LANG=en_US.UTF-8;               export LANG
MM_CHARSET=UTF-8;               export MM_CHARSET

# set ENV to a file invoked each time sh is started for interactive use.
ENV=$HOME/.zshrc;               export ENV

# For Uniform look Qt and GTK
export GTK2_RC_FILES=$HOME/.gtkrc-2.0
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_SCREEN_SCALE_FACTORS=1
export QT_SCALE_FACTOR=1
export QT_FONT_DPI=86

# Clipmenu Environment Variables
export CM_LAUNCHER=dmenu-clipmenu
export CM_DIR=/tmp

export XDG_RUNTIME_DIR=/run/user/1000

# For BSPWM and Ranger define Terminal
export TERMCMD="st"

# For Ranger define Text Editor
export VISUAL="vim"

# For Pager always use Less
export LESS="-SRXF"

# PATH: GO
export GOPATH=$HOME/go
export PATH=$PATH:/usr/bin

# PATH: RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# PATH: PYENV
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# PATH: NPM
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix="$HOME/.node_modules"

# PATH: PERL5
PATH="$HOME/.config/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/.config/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/.config/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/.config/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/.config/perl5"; export PERL_MM_OPT;

# PATH: local /bin
PATH="$HOME/bin:$HOME/src:$HOME/.local/bin:$PATH"
export PATH

# For smooth the font for some Java apps
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# For cover some java application only show blank white
export _JAVA_AWT_WM_NONREPARENTING=1

export WALLPAPER1="$HOME/pic/Wallpaper/archWallpaper/Arch-Wallpaper-11-dark.png"
export WALLPAPER2="$HOME/pic/Wallpaper/archWallpaper/Arch-Wallpaper-11H-dark.png"
export WALLPAPER3="$HOME/pic/Wallpaper/archWallpaper/Arch-Wallpaper-11L-dark.png"
export WALLPAPER4="$HOME/pic/Wallpaper/archWallpaper/Arch-Wallpaper-11GW-dark.png"

# For disable Spring load when running Rails Console
export DISABLE_SPRING=true

# For pistol colorscheme
export PISTOL_CHROMA_STYLE=api

# A hack to disable gtk+ 3 client side decoration
export GTK_CSD=0
export LD_PRELOAD=/usr/lib/libgtk3-nocsd.so.0
