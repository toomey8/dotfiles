# make base case insensitive
tmux unbind C-b
tmux set -g prefix C-s
bind 'set completion-ignore-case on'
export BASH_SILENCE_DEPRECATION_WARNING=1

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


# alias rsed="perl -p -i -e 's/```r/```{r}/g' r-works.rmd > r-works.rmd"

alias tex2svg="/usr/local/lib/node_modules/mathjax-node-cli/bin/tex2svg"
alias ls="ls -FG"
alias rstats='R_PROFILE_USER=~/code/dotfiles/Rprofile'
alias Math="math"
alias todo="sh todo-waiting-parse.sh"
alias ipython='ipython --no-autoindent -i start.py'
alias dot='cd /Users/briantoomey/code/dotfiles'
alias lar='cd /Users/briantoomey/code/larryville/'
alias rd='cd /Users/briantoomey/r'
alias vim='mvim -v'
alias ipy='ipython --no-autoindent'
alias t='nvim +Goyo90 /Users/briantoomey/Dropbox/stories/t.md'
alias p='vim +Goyo90 /Users/briantoomey/Dropbox/stories/password.md'
alias s='cd /Users/briantoomey/Dropbox/stories/'
alias d='cd /Users/briantoomey/Dropbox/'
alias f='fzf'
alias tls='tmux list-sessions'
alias tns='tmux new-session -s'
alias tnh='tmux new-session -s home'
alias stm='tmux source-file ~/.tmux.conf'
alias sbrc='source ~/.bashrc'
alias lf="ls -d */|sed 's|[/]||g'"
alias icb='icalbuddy -npn -nc -eep "*" eventsToday+14'
alias numline='(pbpaste | wc -l)'
alias mdc=" (pbpaste | multimarkdown | textutil -stdin -stdout -convert rtf -format html | pbcopy)"
alias i="imgcat"
alias math="/Applications/Mathematica.app/Contents/MacOS/MathKernel"

# Git Aliases

# alias r='radian'
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

# status lie settings
tmux set-option status off
