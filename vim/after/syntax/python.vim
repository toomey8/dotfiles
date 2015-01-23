
" http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
syn match pythonParen "[(|)]" "contained skipwhite
syn match pythonBrackets "[\[\]]" "contained skipwhite

highlight pythonInclude ctermfg=202
highlight pythonExtraOperator ctermfg=124
highlight pythonExtraPseudoOperator ctermfg=202
highlight pythonConditional ctermfg=160
highlight pythonRepeat ctermfg=160
highlight pythonBrackets ctermfg=160
highlight pythonParen ctermfg=163
highlight pythonString ctermfg=202
highlight pythonNumber ctermfg=202
highlight pythonConstant ctermfg=166


" pythonBuiltin
" 3match markdownList "
" syn keyword markdownList '        -'
" highlight markdownList ctermfg=1

highlight larryPunct ctermfg=93
2match larryPunct "["',@\?]"

highlight larryPeriod ctermfg=160
1match larryPeriod "[.]"
