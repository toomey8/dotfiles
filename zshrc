# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL
ZSH_THEME="clean"


alias ls="ls -FG"
alias stories='cd /Users/briantoomey/Dropbox/stories/'
alias dot='cd /Users/briantoomey/code/dotfiles'
alias rd='cd /Users/briantoomey/r'
alias vim='mvim -v'
alias todo='vim /Users/briantoomey/Dropbox/stories/todo.md'
alias tls='tmux list-sessions'
alias tlc='tmux attach -t code'
alias tlh='tmux attach -t home'
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

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source $ZSH/oh-my-zsh.sh

