function! s:QuickQuit()
let fix = 0
if winnr('$') != 1
  execute 'Goyo!'
  let fix = 1
else
  if fix == 0
    execute 'write'
    execute 'quit'
  endif
endif
endfunction
command! QuickQuit call <sid>QuickQuit()
nnoremap qq :Goyo!<cr>:QuickQuit<cr>:GoyoAloneOpen<cr>

