
# make base case insensitive
bind 'set completion-ignore-case on'

# generic aliases

alias ls="ls -FG"
alias py='cd /Users/briantoomey/Dropbox/stories/Python'
alias dot='cd /Users/briantoomey/code/dotfiles'
alias rd='cd /Users/briantoomey/r'
alias vim='mvim -v'
alias ipy='ipython --no-autoindent'
alias t='vim  /Users/briantoomey/Dropbox/stories/todo.md'
alias s='cd /Users/briantoomey/Dropbox/stories/'
alias tls='tmux list-sessions'
alias tlc='tmux attach -t code'
alias tlh='tmux attach -t home'
alias tls='tmux source-file ~/.tmux.conf'
alias sbrc='source ~/.bashrc'
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

PATH=$PATH:$HOME/.rvm/bin # Add RPM to PATH for scripting
