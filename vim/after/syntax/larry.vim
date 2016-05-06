
" http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html

highlight pythonInclude ctermfg=202
highlight pythonExtraOperator ctermfg=27
highlight pythonExtraPseudoOperator ctermfg=202
highlight pythonConditional ctermfg=160
highlight pythonRepeat ctermfg=160
highlight pythonBrackets ctermfg=27
highlight pythonParen ctermfg=163
highlight pythonString ctermfg=202
highlight pythonNumber ctermfg=202
highlight pythonConstant ctermfg=166
highlight markdownUnixPath ctermfg=130
highlight markdownEmail ctermfg=25
highlight markdownURL ctermfg=130
highlight markdownH1 ctermfg=126
highlight markdownH2 ctermfg=55
highlight larryAsteric ctermfg=27
highlight itemComplete ctermfg=166
highlight larryPeriod ctermfg=197
highlight todoTerm ctermfg=130
highlight todoTerm ctermfg=130
hi Folded term=NONE cterm=NONE gui=NONE 

" http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
" syn match pythonParen "[(|)]" "contained skipwhite
syn match pythonBrackets "[\[\]]" "contained skipwhite


syn match UrlNoSpell "\w\+:\/\/[^[:space:]]\+" contains=@NoSpell
syn match EmailNoSpell "/\S\+@\S" contains=@NoSpell
syntax match markdownEmail /\<\w[^@ \t\r]*\w@\w[^@ \t\r]\+\w\>/
syntax match markdownUnixPath /\k\@<![\/~]\S\+\(\/\|[^ [:punct:]]\)/
" syn match UrlNoSpell "\w\+:\/\/[^[:space:]]\+" contains=@NoSpell


" syn match TodoChar /\(^-\|^ \+-\)/
" syn region TodoDelimiter  start="--"  end="--" 
" highlight TodoDelimiter ctermfg=202

syn region itemComplete   start="^\* "  end="$" keepend contains=itemCause
" syn region itemComplete   start="^- "  end="$" keepend contains=itemCause

1match larryPeriod "[\^\~\^\*]"
" 2match larryAsteric "[*]"
" syn keyword todoTerm jess nate sheila mitch
" syn keyword todoTerm kaitlin erika lily ambrose jasmin
" syn keyword todoTerm ryan 

highlight larrydash ctermfg=64
2match larrydash "    -"
" highlight TodoChar ctermfg=40
highlight TodoChar cterm=bold term=bold ctermfg=30
highlight markdownHeadingDelimiter ctermfg=4
