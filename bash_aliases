alias ll='ls -l'
alias la='ls -la'

alias v='vim'
alias tz='tar -xzvf'
alias tidyx='tidy -mi -xml -utf8'
alias jst='java -XX:+CMSClassUnloadingEnabled -XX:PermSize=64M -XX:MaxPermSize=128M -jar start.jar'
alias ct='ctags -R -f ctags --exclude=.git --exclude=log --extra=+f --langdef=file --langmap='file:.rb.erb''
alias pngc='pngcrush -rem alla -reduce -brute'

alias bx='bundle exec'
alias r='bx rake'
alias g='bx guard'
alias ts='bx thin start'
alias mm='bundle exec middleman'

alias ga='git add . && gst'
alias gamd='git commit -a --amend'
alias gb='git branch -vv'
alias gba='git branch -a'
alias gbl='git branch -l'
alias gca='git commit -v -a'
alias gd='git diff'
alias gdh='git diff HEAD'
alias gH='git reset --hard HEAD'
alias gl='git lg'
alias glp='gl -p'
alias gmt='git mergetool'
alias gpo='git push origin master'
alias gpr='git pull --rebase'
alias grc='git rebase --continue'
alias gsh='git show'
alias gst='git status --ignore-submodules=dirty'

alias gsd='git svn dcommit --username dbrubak1'
alias gsf='git svn fetch'
alias gsr='git svn rebase'
