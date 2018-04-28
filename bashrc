
# make base case insensitive
bind 'set completion-ignore-case on'


# rmd() {
# cat  > r-works.rmd
# sed 's/```r/```\{r\}/g' r-works.rmd > r-works.rmd
# perl -p -i -e 's/```r/```{r}/g' r-works.rmd
# }

g() {
  if [[ $# > 0 ]]; then
    git "$@"
  else
    git status
  fi
}

cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

fh() {
  eval $( ([ -n "$BASH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}


fzf-surfraw() { surfraw "$(cat ~/.config/surfraw/bookmarks | sed '/^$/d' | sort -n | fzf -e)" ;}

export RSTUDIO_PANDOC=/usr/lib/rstudio/bin/pandoc

export FZF_DEFAULT_OPTS='
  --bind ctrl-f:page-down,ctrl-b:page-up
  --color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229
  --color info:150,prompt:110,spinner:150,pointer:167,marker:174
'

alias tex2svg="/usr/local/lib/node_modules/mathjax-node-cli/bin/tex2svg"
alias ls="ls -FG"
alias rsed="perl -p -i -e 's/```r/```{r}/g' r-works.rmd > r-works.rmd"
alias rstats='R_PROFILE_USER=~/code/dotfiles/Rprofile'
alias todo="sh todo-waiting-parse.sh"
alias ipython='ipython --no-autoindent -i start.py'
alias dot='cd /Users/briantoomey/code/dotfiles'
alias lar='cd /Users/briantoomey/code/larryville/'
alias rd='cd /Users/briantoomey/r'
alias vim='mvim -v'
alias ipy='ipython --no-autoindent'
alias kwpy='python jb_scrape_keywords.py file test.csv results'
alias t='nvim +Goyo90 /Users/briantoomey/Dropbox/stories/todo.md'
alias p='vim +Goyo90 /Users/briantoomey/Dropbox/stories/password.md'
alias s='cd /Users/briantoomey/Dropbox/stories/'
alias d='cd /Users/briantoomey/Dropbox/'
alias q='cd /Users/briantoomey/Dropbox/quant/'
alias kwr='cd /Users/briantoomey/Dropbox/jb_scrape_keywords/'
alias jbc='cd /Users/briantoomey/Dropbox/JBAnalyticsClients/'
alias f='fzf'
alias tls='tmux list-sessions'
alias tns='tmux new-session -s'
alias tnh='tmux new-session -s home'
alias tnc='tmux new-session -s code'
alias tks='tmux kill-session -t'
alias tlc='tmux attach -t code'
alias tlh='tmux attach -t home'
alias tmh='tmux new-session -s home'
alias stm='tmux source-file ~/.tmux.conf'
alias sbrc='source ~/.bashrc'
alias lf="ls -d */|sed 's|[/]||g'"
alias icb='icalbuddy -npn -nc -eep "*" eventsToday+14'
alias numline='(pbpaste | wc -l)'
alias mdc=" (pbpaste | multimarkdown | textutil -stdin -stdout -convert rtf -format html | pbcopy)"

# Git Aliases

alias math="/Applications/Mathematica.app/Contents/MacOS/MathKernel"
alias gca="git add --all && git commit -m"
alias gl='glog -n 8'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" 
alias gs='git status'
alias gch='git checkout'
alias gc='git commit -a -m' 
alias gm='git checkout master'

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
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
