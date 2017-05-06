" http://www.calmar.ws/vim/256-xterm-24bit-rib-color-chart.HTML

" syntax on
hi clear SpellBad
hi SpellBad cterm=underline
syntax case ignore

hi Folded term=NONE cterm=NONE gui=NONE 
highlight Normal ctermfg=172 ctermbg=234

highlight rNumber    ctermfg=166
highlight rfloat    ctermfg=166
highlight rAssign    ctermfg=24
highlight rDelimiter ctermfg=5
highlight Delimiter  ctermfg=166
highlight rOperator  ctermfg=64
highlight rConstant  ctermfg=5
highlight rtype  ctermfg=64
highlight rString  ctermfg=37
highlight rBoolean  ctermfg=37
highlight rBoolean  ctermfg=37
highlight rmdChunkDelim  ctermfg=24

" highlight pythonInclude ctermfg=202
" highlight pythonExtraOperator ctermfg=27
" highlight pythonExtraPseudoOperator ctermfg=202
" highlight pythonConditional ctermfg=160
" highlight pythonRepeat ctermfg=160
highlight pythonBrackets ctermfg=24
" highlight pythonParen ctermfg=163
" highlight pythonString ctermfg=202
" highlight pythonNumber ctermfg=202
" highlight pythonConstant ctermfg=166
" highlight markdownUnixPath ctermfg=130
" highlight markdownEmail ctermfg=25
" highlight markdownURL ctermfg=130
highlight larryAsteric ctermfg=27
highlight itemComplete ctermfg=166
highlight itemDash ctermfg=33
" highlight indentedTODO ctermfg=184
highlight larryPeriod ctermfg=126
highlight todoTerm ctermfg=130
highlight todoTerm ctermfg=130
highlight markdownHeadingDelimiter ctermfg=24
highlight markdownH1 ctermfg=126
highlight markdownH2 ctermfg=55
highlight markdownH2 ctermfg=126
highlight markdownH3 ctermfg=166
highlight markdownH4 ctermfg=126
highlight Comment ctermfg=247
highlight Delimiter ctermfg=32
" syntax match markdownHeadingDelimiter "#" conceal cchar=§

" syn match pythonParen "[(|)]" "contained skipwhite
syn match pythonBrackets "[\[\]]" "contained skipwhite
" syn match UrlNoSpell "\w\+:\/\/[^[:space:]]\+" contains=@NoSpell
" syn match EmailNoSpell "/\S\+@\S" contains=@NoSpell
" syntax match markdownEmail /\<\w[^@ \t\r]*\w@\w[^@ \t\r]\+\w\>/
" syntax match markdownUnixPath /\k\@<![\/~]\S\+\(\/\|[^ [:punct:]]\)/
" syn match UrlNoSpell "\w\+:\/\/[^[:space:]]\+" contains=@NoSpell
" syn match TodoChar /\(^-\|^ \+-\)/
" syn region TodoDelimiter  start="--"  end="--" 
" highlight TodoDelimiter ctermfg=202

syn region itemComplete   start="^\* "  end="$" keepend contains=itemCause
syn region itemDash   start="^\-"  end=" " keepend contains=itemCause

" syn region indentedTODO   start="^----"  end=" " keepend contains=itemCause

" syn region itemComplete   start="^- "  end="$" keepend contains=itemCause

1match larryPeriod "[\^\~\^\*]"
" 2match larryAsteric "[\*]"
" syn keyword todoTerm jess nate sheila
" syn keyword todoTerm kaitlin erika lily ambrose jasmin
" syn keyword todoTerm ryan 

highlight larrydash ctermfg=64
2match larrydash "    -"
" highlight larrytripple ctermfg=33 
" 3match larrytripple "---"
highlight TodoChar cterm=bold term=bold ctermfg=30
hi Folded ctermfg=242 ctermbg=234

syntax match nonascii "[^\x00-\x7F]"
highlight nonascii ctermfg=24
