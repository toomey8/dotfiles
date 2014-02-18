
# make base case insensitive
bind 'set completion-ignore-case on'

# aliases
alias ls="ls -FG"
alias st='cd /Users/briantoomey/Dropbox/stories/'
alias py='cd /Users/briantoomey/Dropbox/stories/Python'
alias dot='cd /Users/briantoomey/code/dotfiles'
alias rd='cd /Users/briantoomey/r'
alias vim='mvim -v'
alias ipy='ipython --no-autoindent'
alias todo='vim /Users/briantoomey/Dropbox/stories/todo.md'
alias tls='tmux list-sessions'
alias tlc='tmux attach -t code'
alias tlh='tmux attach -t home'
alias tls='tmux source-file ~/.tmux.conf'
alias sbrc='source ~/.bashrc'

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
