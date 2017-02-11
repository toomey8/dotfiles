function! s:PythonCompile()
    normal :!awk '!/^```/' expand('%:t') > clean.md 
    " awk '!/^```/' inputfile > resultfile
endfunction
command! PythonCompile call <sid>TmuxPythonSlime()
nmap <localleader>d :PythonCompile<cr>
""" }}}
" fzf {{{
"
"
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  nnoremap q/ :QHist<CR>
  nnoremap qa :Ag 
" Open buffers
nnoremap qB :Buffers<CR>
" MRU
nnoremap qm :History<CR>
" Command history
command! CmdHist call fzf#vim#command_history({'right': '40'})
nnoremap q; :CmdHist<CR>
" Better search history
command! QHist call fzf#vim#search_history({'right': '40'})
nnoremap q/ :QHist<CR>
nnoremap qb :Goyo!<cr>:Solar<cr>:tabe ~/Dropbox/stories/Bookmarks.md<CR>:CtrlPMarkdownHeader<cr>

""" }}}
