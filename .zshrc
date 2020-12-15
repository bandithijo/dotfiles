#  ██████                           ██ ██   ██   ██      ██ ██    ██
# ░█░░░░██                         ░██░░   ░██  ░██     ░██░░    ░░
# ░█   ░██   ██████   ███████      ░██ ██ ██████░██     ░██ ██    ██  ██████
# ░██████   ░░░░░░██ ░░██░░░██  ██████░██░░░██░ ░██████████░██   ░██ ██░░░░██
# ░█░░░░ ██  ███████  ░██  ░██ ██░░░██░██  ░██  ░██░░░░░░██░██   ░██░██   ░██
# ░█    ░██ ██░░░░██  ░██  ░██░██  ░██░██  ░██  ░██     ░██░██ ██░██░██   ░██
# ░███████ ░░████████ ███  ░██░░██████░██  ░░██ ░██     ░██░██░░███ ░░██████
# ░░░░░░░   ░░░░░░░░ ░░░   ░░  ░░░░░░ ░░    ░░  ░░      ░░ ░░  ░░░   ░░░░░░
#
#                 ██
#                ░██
#  ██████  ██████░██      ██████  █████
# ░░░░██  ██░░░░ ░██████ ░░██░░█ ██░░░██
#    ██  ░░█████ ░██░░░██ ░██ ░ ░██  ░░
#   ██    ░░░░░██░██  ░██ ░██   ░██   ██
#  ██████ ██████ ░██  ░██░███   ░░█████
# ░░░░░░ ░░░░░░  ░░   ░░ ░░░     ░░░░░

zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# ---------------------------------------------------------------ZINIT COINFIG
# [ -f ~/.zshrc-zinit ] && source ~/.zshrc-zinit
# ------------------------------------------------------------END ZINIT CONFIG

# -----------------------------------------------------------------ZGEN CONFIG
[ -f ~/.zshrc-zgen ] && source ~/.zshrc-zgen
# -------------------------------------------------------------END ZGEN CONFIG

# ---------------------------------------------------------------------MINIMAL
MNML_OK_COLOR=7                      # default: 7
MNML_ERR_COLOR=1                     # default: 1
MNML_USER_CHAR='$'                   # default: λ
MNML_INSERT_CHAR=''                  # default: ›
MNML_NORMAL_CHAR=''                  # default: ·


# Components on the left prompt
MNML_PROMPT=(mnml_ssh mnml_status mnml_keymap)

# Components on the right prompt
MNML_RPROMPT=('mnml_cwd 2 0' mnml_git)

# Components shown on info line
MNML_INFOLN=(mnml_err mnml_jobs mnml_uhp mnml_files)

# An additional array is used to configure magic enter's behavior:
MNML_MAGICENTER=(mnml_me_dirs mnml_me_ls mnml_me_git)
# -----------------------------------------------------------------END MINIMAL


# -------------------------------------------------------------------OH-MY-ZSH
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

DISABLE_MAGIC_FUNCTIONS=true
# ---------------------------------------------------------------END OH-MY-ZSH



# Disale url escape
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Enable Vim mode in ZSH
bindkey -v
# Reverse menu with Shift+tab
bindkey '^[[Z' reverse-menu-complete

export KEYTIMEOUT=1

# # Change cursor with support for inside/outside tmux
# function _set_cursor() {
#     if [[ $TMUX = '' ]]; then
#       echo -ne $1
#     else
#       echo -ne "\ePtmux;\e\e$1\e\\"
#     fi
# }

# function _set_block_cursor() { _set_cursor '\e[2 q' }
# function _set_beam_cursor() { _set_cursor '\e[6 q' }

# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
#       _set_block_cursor
#   else
#       _set_beam_cursor
#   fi
# }
# zle -N zle-keymap-select
# # ensure beam cursor when starting new terminal
# precmd_functions+=(_set_beam_cursor) #
# # ensure insert mode and beam cursor when exiting vim
# zle-line-init() { zle -K viins; _set_beam_cursor }

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Untuk merubah titlebar dari st terminal
# Sumber: http://www.faqs.org/docs/Linux-mini/Xterm-Title.html#s5
case $TERM in
    st*)
    precmd () {
        # menampilkan direktori aktif (kondisi default)
        print -Pn "\e]0;st:%~\a"
    }
    preexec () {
        # menampilkan program yang sedang berjalan
        print -Pn "\e]0;st:$1\a"
    }
    ;;
esac

# For Changing directories, remember the directory you've navigated to with ranger
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )

    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

# For handle Delete key
# bindkey    "[3~"          delete-char
# bindkey    "3;5~"         delete-char

# Import alias from .aliases
[ -f ~/.aliases ] && source ~/.aliases

# Count how many opened terminal
#pgrep -x st | awk 'BEGIN{count=1}{ if(NR!=1){count++} }END{print " st:"count}'

# FZF DWM color
export FZF_DEFAULT_OPTS='
--color=dark,fg:14,fg+:0,bg+:9,hl:9,hl+:7,info:9,prompt:7,spinner:1,pointer:0,marker:7'

# Ignore node_modulses directory on fzf
# export FZF_DEFAULT_COMMAND = 'ag --nocolor --ignore node_modules -g ""'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --ignore-file ".gitignore"'

# Should to put at very bottom of this file config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export GPG_TTY=$(tty)
