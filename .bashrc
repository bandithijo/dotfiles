### PROMPT ####################

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

COLOR_GRAY="\\[\\033[0;37m\\]"
COLOR_WHITE="\\[\\033[1;37m\\]"
COLOR_GREEN="\\[\\033[0;32m\\]"
COLOR_RED="\\[\\033[0;31m\\]"
COLOR_YELLOW="\\[\\033[1;33m\\]"
COLOR_BLUE="\\[\\033[1;34m\\]"

if [[ /Users/$USER != $HOME ]] ; then
	PROMPT_USERNAME="$COLOR_RED$USER$COLOR_WHITE "
else 
	PROMPT_USERNAME=""
fi

export PS1=$PROMPT_USERNAME'$(__git_ps1 "\[\e[0;32m\]%s\[\e[0m\]\[\e[0;33m\]$(parse_git_dirty)\[\e[0m\] ")\w$ '

# ls aliases
alias ll='ls -lah'
alias stat='svn stat'
alias sc='script/console --debugger'
alias sdb='script/dbconsole'
alias ss='script/server -u'
alias test='cucumber features'
alias prs='touch tmp/restart.txt'
alias la='ls -la'
#alias l='ls -CF'
alias sql='mysql -u root --password=my\>dbm'
 
#Increase history size
export HISTSIZE=1000
export HISTFILESIZE=1000

# rvm-install added line:
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi
export BROWSER='/usr/bin/chromium-browser'


# Apt
alias acs='apt-cache search'
alias agup='apt-get upgrade'
alias agud='apt-get update'

# Tools
alias wi="whois"

# Rails
alias r='rails'

# Git aliases
alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gca="git commit -a"
alias gcm="git commit -m"
alias gpush="git push origin master"
alias gpull="git pull origin master"
alias gco="git checkout"
alias gd="git diff"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
