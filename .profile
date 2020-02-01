# ------------------------------------------------------------------MY EXPORTS

# CONFIG DIRECTORY
export XDG_CONFIG_HOME=$HOME/.config

# For Uniform look Qt and GTK
export QT_QPA_PLATFORMTHEME=qt5ct
export GTK2_RC_FILES=$HOME/.gtkrc-2.0

export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_SCREEN_SCALE_FACTORS=1
export QT_SCALE_FACTOR=1

export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
export ANDROID_HOME=/opt/android-sdk

# Font config
export FONTCONFIG_PATH=/etc/fonts

# Clipmenu Environment Variables
export CM_LAUNCHER=rofi-clipmenu
export CM_DIR=/tmp/clipmenu

# TimeZone
#TZ='Asia/Jakarta'; export TZ
TZ='Asia/Makassar'; export TZ

# For modifying st terminal titelbar, only work on ZSH shell
# Source: http://www.faqs.org/docs/Linux-mini/Xterm-Title.html#s5
case $TERM in
  st*)
    precmd () {
      print -Pn "\e]0;st:%~\a"
    }
    preexec () {
      print -Pn "\e]0;st:$1\a"
    }
  ;;
esac

# For Ranger define Terminal
export TERMCMD="st"

# For Ranger define Text Editor
export VISUAL="vim"

# PATH: GO
export PATH=$PATH:/usr/local/go/bin

# PATH: RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

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

# JAVA_HOME, this path maybe only works on Arch
export JAVA_HOME="/usr/lib/jvm/default/"
#export JAVA_HOME="/usr/lib/jvm/java-8-openjdk/"
#export JAVA_HOME="/usr/lib/jvm/java-10-openjdk/"
#export JAVA_HOME="/usr/lib/jvm/java-12-openjdk/"
export PATH="$JAVA_HOME/bin:$PATH"

# For smooth the font for some Java apps
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# Environment akan berpengaruh ke tmux color and italic dan emacs color
export TERM=st-256color

# Vim as Manpager
# for Vim
#export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""
# for NeoVim
# export MANPAGER="nvim +set\ filetype=man -"

# FZF Solarized colors
# EXAMPLE:
# --color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
# --color info:254,prompt:37,spinner:108,pointer:235,marker:235
export FZF_DEFAULT_OPTS='
--color=light,fg:7,fg+:7,bg:8,bg+:3,hl:1,hl+:1,info:3,prompt:1,spinner:1,pointer:1,marker:1'

# --------------------------------------------------------------END MY EXPORTS
