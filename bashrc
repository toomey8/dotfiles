# make base case insensitive
bind 'set completion-ignore-case on'
export BASH_SILENCE_DEPRECATION_WARNING=1
export VISUAL=nvim

LaTeXPipe() {
  # echo -n '$$'
  cat ~/Dropbox/stories/latex.txt
  # echo -n '$$'
}

export FZF_DEFAULT_OPTS='
  --bind ctrl-f:page-down,ctrl-b:page-up
  --color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229
  --color hl:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229
  --color info:150,prompt:110,spinner:150,pointer:167,marker:174
'

# Solarized colors
export FZF_DEFAULT_OPTS='
--color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229
--color info:150,prompt:110,spinner:150,pointer:167,marker:174
'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

# alias f = "vim `fzf --preview="cat {}" --preview-window=right:70%:wrap`"

#https://snarky.ca/why-you-should-use-python-m-pip/
alias pip="python -m pip"
alias pip=/usr/local/bin/pip3
alias py='s; bpython'

alias tex2svg="/usr/local/lib/node_modules/mathjax-node-cli/bin/tex2svg"
alias ls="ls -FG"
alias rstats='R_PROFILE_USER=~/code/dotfiles/Rprofile'
alias Math="math"
alias todo="sh todo-waiting-parse.sh"
alias dot='cd /Users/toomey8/code/dotfiles'
alias lar='cd /Users/toomey8/code/larryville/'
alias rd='cd /Users/toomey8/r'
alias t='nvim +Goyo90 /Users/toomey8/Dropbox/stories/t.md'
alias p='vim +Goyo90 /Users/toomey8/Dropbox/stories/password.md'
alias s='cd /Users/toomey8/Dropbox/stories/'
alias d='cd /Users/toomey8/Dropbox/'
alias tls='tmux list-sessions'
alias tns='tmux new-session -s'
alias tnh='tmux new-session -s home'
alias stm='tmux source-file ~/.tmux.conf'
alias sbrc='source ~/.bashrc'
alias Source='source ~/.bashrc;tmux source-file ~/.tmux.conf'
alias lf="ls -d */|sed 's|[/]||g'"
alias numline='(pbpaste | wc -l)'
alias mdc=" (pbpaste | multimarkdown | textutil -stdin -stdout -convert rtf -format html | pbcopy)"
alias i="imgcat"
alias math="/Applications/Mathematica.app/Contents/MacOS/MathKernel"

# Git Aliases
alias gcm="git add --all && git commit -m"
alias gl='glog -n 8'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" 
alias gs='git status'
alias gch='git checkout'
alias gc='git commit -a -m' 
alias gm='git checkout master'
export PS1="\[\e[33m\]//\[\e[m\]\[\e[35m\]\W\[\e[m\]\[\e[36m\]~>\[\e[m\] "

PATH=$PATH:$HOME/.rvm/bin # Add RPM to PATH for scripting
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export PATH=${PATH}:~/Library/Python/2.XXX/bin:~/bin
export PYTHONPATH="/Users/toomey8/Library/"
