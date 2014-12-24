
# make base case insensitive
bind 'set completion-ignore-case on'

# generic aliases

# No arguments: `git status`
# With arguments: acts like `git`
g() {
  if [[ $# > 0 ]]; then
    git "$@"
  else
    git status
  fi
}

alias ls="ls -FG"
alias py='cd /Users/briantoomey/Dropbox/stories/Python'
alias dot='cd /Users/briantoomey/code/dotfiles'
alias rd='cd /Users/briantoomey/r'
alias vim='mvim -v'
alias ipy='ipython --no-autoindent'
alias t='vim  /Users/briantoomey/Dropbox/stories/todo.md'
alias s='cd /Users/briantoomey/Dropbox/stories/'
alias d='cd /Users/briantoomey/Dropbox/'
alias m='mutt'
alias jbc='cd /Users/briantoomey/Dropbox/JBAnalyticsClients/'
alias tls='tmux list-sessions'
alias tlc='tmux attach -t code'
alias tlh='tmux attach -t home'
alias stm='tmux source-file ~/.tmux.conf'
alias sbrc='source ~/.bashrc'
alias lf="ls -d */|sed 's|[/]||g'"
alias icb='icalbuddy -npn -nc -eep "*" eventsToday+14'
alias numline='(pbpaste | wc -l)'
alias mdc=" (pbpaste | multimarkdown | textutil -stdin -stdout -convert rtf -format html | pbcopy)"

# Git Aliases

alias gl='glog -n 8'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" 
alias gs='git status'
alias gch='git checkout'
alias gc='git commit -a -m' 
alias gm='git checkout master'

# goto finder window

cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

# tmux new -s home // to make new session
# tmux new session from current directory
function tn {
  if [ -z "$1" ]; then
      session_name=$(basename `pwd`)
  else
      session_name=$1
  fi
  tmux new-session -d -s $session_name -n vim
  tmux attach-session -t $session_name
}

# http://ezprompt.net/
export PS1="\[\e[33m\]//\[\e[m\]\[\e[35m\]\W\[\e[m\]\[\e[36m\]~>\[\e[m\] "

PATH=$PATH:$HOME/.rvm/bin # Add RPM to PATH for scripting
