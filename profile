[ -f /etc/profile ] && . /etc/profile
[ -f ~/.bashrc ] && . ~/.bashrc

PATH="/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin"
export PATH

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='7;31'

export VISUAL='mate -w'
export EDITOR='mate -w'

bind '"\eb":backward-word'

alias rt='rake test | unit_diff'
alias rss='ruby script/server'
alias ss='ruby script/server'
alias ss1='ruby script/server -p 3001'
alias ssc='ruby script/server -e dev_cached'
alias mr='mongrel_rails start'
alias console='ruby script/console'

alias gst='git status'
alias gd='git diff | mate'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gamd='git commit -a --amend'

alias gsd='git-svn dcommit'
alias gsf='git-svn fetch'
alias gsr='git-svn rebase'

alias ec='mate ~/bin/cheat/'
alias ep='mate ~/bin/dotfiles/'
alias es='mate ~/bin/script/'

. ~/bin/dotfiles/lightsky

function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git::\1)/'
}
function parse_svn_branch() {
  parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk -F / '{print "(svn::"$1 "/" $2 ")"}'
}
function parse_svn_url() {
  svn info 2>/dev/null | grep -e '^URL*' | sed -e 's#^URL: *\(.*\)#\1#g '
}
parse_svn_repository_root() {
  svn info 2>/dev/null | grep -e '^Repository Root:*' | sed -e 's#^Repository Root: *\(.*\)#\1\/#g '
}
function parse_scm_branch() {
  local value=$(parse_git_branch) 
  if [ -z "$value" ]; then
    local value=$(parse_svn_branch)
  fi
  echo "$value"
}

export PS1="\[\033[00m\]\u@\h\[\033[01;34m\] \w \[\033[31m\]\$(parse_scm_branch) \[\033[00m\]$\[\033[00m\] "

. ~/.preexec.bash

# called before each command and starts stopwatch
function preexec () {
  export PREEXEC_CMD="$BASH_COMMAND"
  export PREEXEC_TIME=$(date +'%s')
}

# called after each command, stops stopwatch
# and notifies if time elpsed exceeds threshold
function precmd () {
  stop=$(date +'%s')
  start=${PREEXEC_TIME:-$stop}
  let elapsed=$stop-$start
  max=${PREEXEC_MAX:-10}
  
  if [ $elapsed -gt $max ]; then
    growlnotify -n "iTerm" -m "took $elapsed secs" ${PREEXEC_CMD:-Some Command}
  fi
}

preexec_install