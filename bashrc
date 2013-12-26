alias ls="ls -FG"
alias stories='cd /Users/briantoomey/Dropbox/stories/'
alias dot='cd /Users/briantoomey/code/dotfiles'
alias rd='cd /Users/briantoomey/r'
alias vim='mvim -v'
alias todo='vim /Users/briantoomey/Dropbox/stories/todo.md'
alias tls='tmux list-sessions'
alias tlc='tmux attach -t code'
alias tlh='tmux attach -t home'

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

