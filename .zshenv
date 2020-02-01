if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# PYENV-INIT
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

