
" vim:fdm=marker
"Eternal thanks to https://github.com/christoomey

" editor {{{

set tw=60
set laststatus=0 
" neovim incompatible
    " set cm=blowfish
    " set nocompatible " be improved
    " set term=screen-256color
set autochdir
filetype off " required!
set scrolloff=5 "keep cursor closer to middle
let mapleader = "\<Space>"
  let maplocalleader = ","
set formatoptions+=tl
set linebreak
set clipboard=unnamed
set ignorecase " Do case insensitive matching
set smartcase " Do smart case matching
set expandtab " Convert <tab> to spaces (2 or 4)
set tabstop=4 " Four spaces per ta as default
set shiftwidth=4 " then override with per filteype
set softtabstop=4 " specific settings via autocmd
set smartindent
set showcmd " Show (partial) command in status line.
set incsearch " incremental search
set nobackup
set noswapfile " because they make a mess of everything
set shell=/bin/bash\ -i "makes ! shell commands work
set helpheight=999
set hlsearch " hilight searches, map below to clear
set wildmenu
set wildmode=longest,list,full

" }}}
" Vim-Plug {{{

call plug#begin('~/.vim/plugged')

Plug 'chrisbra/NrrwRgn'
Plug 'Beloglazov/Vim-Online-Thesaurus'
    let g:Online_thesaurus_map_keys = 0
    nnoremap qt :OnlineThesaurusCurrentWord<Cr>
Plug 'junegunn/vim-journal'
Plug 'junegunn/vim-peekaboo'
    let g:peekaboo_delay = 450
Plug 'junegunn/vim-easy-align'
  command! ReformatTable normal vip<cr>**|
  nmap <leader>rt :ReformatTable<cr>
  vmap <cr> <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
Plug 'tpope/vim-markdown'
let g:markdown_fenced_languages = ['python', 'html', 'r']
Plug 'godlygeek/tabular'
  nmap <leader>; :Tabularize /:<cr>
  autocmd BufEnter *.csv imap <buffer> <esc> <esc>:Tabularize /\|<cr>
  autocmd BufEnter *.csv nnoremap <buffer> b 2b
  autocmd BufEnter *.csv nnoremap <buffer> w 2w
Plug 'danro/rename.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'itchyny/calendar.vim'
Plug 'tommcdo/vim-exchange'
Plug 'mileszs/ack.vim'
  set conceallevel=2 concealcursor=nc
  syntax match qfFileName /^[^|]*/ transparent conceal
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
  nmap qd <Plug>(textobj-indent-a)
  nnoremap <C-s> viiok
  vmap <C-s> viiok
Plug 'rhysd/clever-f.vim'
  let g:clever_f_ignore_case = 1
Plug 'kien/ctrlp.vim'
  let g:ctrlp_follow_symlinks = 2
  let g:ctrlp_use_caching = 0
  let g:ctrlp_custom_ignore = '\v\.(jpeg|jpg|JPG|pdf|png|doc|docx|svg|xls|xlsx|Icon^M^M)$'
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
Plug 'ervandew/supertab'
  let g:SuperTabDefaultCompletionType = "context"
inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
 let p = '^\s*|\s.*\s|\s*$'
 if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
  let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
  let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
  Tabularize/|/l1
  normal! 0
  call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
 endif
endfunction
Plug 'terryma/vim-expand-region'
  vmap v <Plug>(expand_region_expand)
  vmap <C-v> <Plug>(expand_region_shrink)
filetype plugin indent on " required!
syntax on

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
" Goyo {{{

Plug 'junegunn/limelight.vim'
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 0  " Solarized Base1
let g:limelight_conceal_guifg = '#000000'  " Solarized Base1
let g:limelight_default_coefficient = 1.0

Plug 'junegunn/goyo.vim'
  let g:goyo_width=68
  let g:goyo_margin_top = 0
  let g:goyo_margin_bottom = 0
  nnoremap <leader>z :setlocal relativenumber!<cr>:set number<cr>
  vnoremap X x:CtrlP<cr>
  nnoremap <C-x> :Solar<cr>:Goyo90<cr>
    " quick open / quit
  nnoremap <leader>qw :CtrlPClearCache<cr>

function! s:Goyo90()
if tabpagenr('$') == '1'
    Goyo 84%x84%
endif
endfunction
command! Goyo90 call <sid>Goyo90()

function! s:GoyoAloneOpen()
if tabpagenr('$') == '1'
    Goyo90
    Solar
endif
endfunction
command! GoyoAloneOpen call <sid>GoyoAloneOpen()

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

function! s:InGoyoClose()
if tabpagenr('$') > '1'
    Goyo
endif
endfunction
command! InGoyoClose call <sid>InGoyoClose()
" nnoremap qw :Goyo!<cr>:Solar<cr>:tabe ~/Dropbox/stories/scratch.md<CR>:CtrlP<CR>
nnoremap qw :Goyo!<cr>:Solar<cr>:tabe ~/Dropbox/stories/scratch.md<CR>:Files<CR>

 """ }}}
" Dict {{{


command! -nargs=+ Wordnet call WordNetOverviews("<args>")
command! -nargs=+ Wn call WordNetOverviews("<args>")

noremap  q2 "wyiw:call WordNetOverviews(@w)<CR>
noremap  q3 "wyiw:call WordNetBrowse(@w)<CR>
let s:wordnet_buffer_id = -1

if !exists('g:wordnet_path')
  let g:wordnet_path = ""
endif

function! WordNetBrowse (word)
  call system(g:wordnet_path . "wnb " . a:word)
endfunction

function! WordNetOverviews (word)
  let definition = system(g:wordnet_path . "wn " . a:word . " -over")
  if definition == ""
    let definition = "Word not found: " . a:word
  endif
  call s:WordNetOpenWindow(definition)
endfunction

function! s:WordNetOpenWindow (text)
  " If the buffer is visible
  if bufwinnr("__WordNet__") > -1
    " switch to it
    exec bufwinnr("__WordNet__") . "wincmd w"
    hide
  endif

  if bufnr("__WordNet__") > -1
    exec bufnr("__WordNet__") . "bdelete!"
  endif

  exec 'silent! keepalt botright 20split'
  exec ":e __WordNet__"
  let s:wordnet_buffer_id = bufnr('%')

  call append("^", split(a:text, "\n"))
  exec 0
  " Mark the buffer as scratch
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
  setlocal nonumber
  setlocal nobuflisted
  setlocal readonly
  setlocal nomodifiable

  mapclear <buffer>
  syn match overviewHeader      /^Overview of .\+/
  syn match definitionEntry  /\v^[0-9]+\. .+$/ contains=numberedList,word
  syn match numberedList  /\v^[0-9]+\. / contained
  syn match word  /\v([0-9]+\.[0-9\(\) ]*)@<=[^-]+/ contained
  hi link overviewHeader Title
  hi link numberedList Operator
  hi def word term=bold cterm=bold gui=bold
endfunction

 """ }}}
" key mappings {{{
" jump to next vim window
nnoremap <leader>d <C-W>w

" Emacs bindings
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Jump Paragraphs with meta j,k
noremap K k?^$?<cr>j<esc>:noh<cr>
vmap K {j
noremap J j}k

"remap S for J, so J can be used for motions
nnoremap S :s/\n/\=joinchar/<CR><esc>:noh<return><esc>
let joinchar = ' '

" Keep search matches in the middle of the window.
nnoremap n nzzzv

" Center in screen when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap N Nzzzv
nnoremap <c-o> <c-o>zz

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
nnoremap Y y$
vnoremap L g_
nnoremap j gj
vnoremap j gj
vnoremap k gk
nnoremap k gk
vnoremap $ g9
nnoremap <silent> <esc> :noh<return>:set foldtext=MyFoldText()<cr><esc>
nnoremap ; :
nnoremap a A
nnoremap A a
nmap <tab> :tabnext<cr>:Solar<cr>
vmap <tab> :tabnext<cr>:Solar<cr>
nmap s za
nnoremap <leader>rm :call delete(expand('%')) \| bdelete!<CR>

"Bubble single lines
" nmap <c-j> ddp
" nmap <c-k> ddkP
nmap <c-j> f*
nmap <c-k> F*
" Bubble multiple lines
vmap <c-j> xp`[V`]
vmap <c-k> xkP`[V`]

" <option-j/k> down/up paragraph
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
""" }}}
" leader mappings {{{

" cut & paste
vnoremap <leader>c :<c-u>call g:CopyVisualText()<cr>
nnoremap <leader>p :r!pbpaste<cr>

" Mappings for quick search & replace. Global set to default
" Do a / search first, then leave pattern empty in :s// to use previous
nnoremap <Leader>sr :%s///g<left><left>
vnoremap <Leader>sr :s///g<left><left>
nnoremap <leader>se :InGoyoClose<cr>:tabnew<cr>:e $MYVIMRC<cr>:Solar<cr>
nnoremap <leader>sd :InGoyoClose<cr>:tabnew<cr>:FZF ~/code/dotfiles/<cr>:Solar<cr>
nnoremap <leader>sv :w<cr>:source $MYVIMRC<cr>
vnoremap <leader>a GVgg
nnoremap <leader>a GVgg
nnoremap <localleader>r :registers<cr>
nnoremap <localleader>t :!sh todo-waiting-parse.sh<cr>

""" }}}
" grep bindings {{{

" Search the current file for what's currently in the search register and display matches
nmap <silent> <leader>gh :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current file for the word under the cursor and display matches
nmap <silent> gf :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>
nmap <silent> gp :vimgrep /\d\{3\}\w\d\{4\}/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current file for the WORD under the cursor and display matches
nmap <silent> <leader>gF :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" }}}
" spelling & prose {{{

set spell
nnoremap <leader>S ea<C-x><C-s>

function! FixLastSpellingError()
 let position = getpos('.')[1:3]
 let current_line_length = len(getline('.'))
 normal! [s1z=
 let new_line_length = len(getline('.'))
 let position[1] += (new_line_length - current_line_length)
 call cursor(position)
endfunction
nnoremap <leader>w :call FixLastSpellingError()<cr>
imap jk <c-o>:call FixLastSpellingError()<cr>

if exists("+spelllang")
  set spelllang=en_us
endif
set spellfile=~/.vim/spell/en.utf-8.add

""" }}}
" macros {{{

set lazyredraw "speed up macros

" pop to top of paragraph, return to edited
nnoremap mm ddp
nnoremap mj jmmkdd{}P`m
nnoremap mk kmmjdd}{p`m

" make todo into microproject

" randomize paragraph
let @r = 'vapk:!gsort -R'

" append date to eol
" nnoremap <leader>4 "=strftime("(%d-%m-%y)")<CR>P
nnoremap <leader>4 "=strftime("(%d-%b-%y)")<CR>P

function! s:MDTable()   
  let save_cursor = getpos(".")
  normal! {jms
  normal! }me
  silent! 's,'es/\t/|/g
  :Tab /|
  call setpos('.', save_cursor)
endfunction
command! MDTable call <sid>MDTable()
nnoremap <silent><localleader>t :MDTable<cr>

""" }}}
" python/r/coding {{{

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.csv set tw=100
au BufNewFile,BufRead *.r,*.R setf r  

" Plug 'jalvesaq/Nvim-R'
Plug 'vim-scripts/R-syntax-highlighting'
Plug 'christoomey/ctrlp-generic'
Plug 'christoomey/vim-titlecase'
  nmap <leader>gt <Plug>Titlecase<cr>
  vmap <leader>gt <Plug>Titlecase<cr>
  nmap <leader>gT <Plug>TitlecaseLine<cr>
Plug 'christoomey/vim-quicklink'
  vnoremap <leader>l :call ConvertVisualSelectionToLink()<cr>
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
  nmap <localleader>u :VtrSendLinesToRunner<cr>
  nmap <localleader><localleader> vip:VtrSendLinesToRunner<cr><cr>
  nmap <localleader><localleader> vip:VtrSendLinesToRunner<cr><cr>
  nmap <localleader>i vip:VtrSendLinesToRunner<cr>
  vmap <localleader>u <Esc>:VtrSendLinesToRunner<cr>
  nmap <leader>sT :VtrAttachToPane<cr>
function! WrapRVarAndSend(wrapper)
 let command = a:wrapper . '(' . expand('<cword>') . ')'
 call VtrSendCommand(command)
endfunction
  nnoremap <localleader>l :call WrapRVarAndSend('length')<cr>
  nnoremap <localleader>h :call WrapRVarAndSend('head')<cr>
  nnoremap <localleader>s :call WrapRVarAndSend('see')<cr>
  let g:VtrStripLeadingWhitespace = 0
  let g:VtrClearEmptyLines = 0
  let g:VtrAppendNewline = 0
Plug 'hynek/vim-python-pep8-indent'
au FileType r set iskeyword+=.
au FileType r set iskeyword+=$

""" }}}
" journal config {{{
"
function! s:CreateJournalEntryFromBuffer()
  normal Go
  write
  silent! call system('cat spark2.md spark.md | sponge spark.md')
  %delete
  quit
endfunction
command! CreateJournalEntryFromBuffer call <sid>CreateJournalEntryFromBuffer()

function! s:InsertDateHeader()
  normal ggHi## 
  execute 'r!date "+\%A, \%b \%d \%Y @\%I:\%M \%p"'
    " http://www.computerhope.com/unix/udate.htm
  silent! normal ggS
  silent! normal Go
  silent! normal Go
  nnoremap <buffer> <leader>m :CreateJournalEntryFromBuffer<cr>ZZ<cr>
endfunction
command! InsertDateHeader call <sid>InsertDateHeader()
" }}}
" markdown config {{{

Plug 'nelstrom/vim-markdown-folding'
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType python,r,R,s,S,Rrst,rrst,Rmd,rmd,txt call MarkdownFoldingForAll()
" MarkdownFolding after ftplugin / markdown undo comment
autocmd BufEnter *.md set foldtext=MyFoldText()
autocmd BufEnter source 

command! BlockQuotify execute "normal! {jvip\<C-v>I> \<ESC>gqip"
nnoremap <buffer> <leader>gq :BlockQuotify<cr>
vmap <leader>gq :g/\(^$\n\)\@<=.*/BlockQuotify<cr>

function! MarkdownFoldingForAll()
  runtime after/ftplugin/markdown/folding.vim
endfunction

" Persistent undo
let undodir = expand('~/.undo-vim')
if !isdirectory(undodir)
 call mkdir(undodir)
endif
set undodir=~/.undo-vim
set undofile " Create FILE.un~ files for persistent undo

" Preview in Marked
nnoremap <leader>1 :w<cr>:call OpenCurrentFileInMarked()<cr>
function! OpenCurrentFileInMarked()
  let current_file = expand('%')
  let open_cmd = join(["open -a Marked", current_file])
  call system(open_cmd)
endfunction

function! g:CopyVisualText()
  let cur_register_contents = @c
  normal! gv
  normal! "cy
  normal! gv
  silent call system('pbcopy', @c)
endfunction

let g:markdown_fold_style = 'nested'
function! WrapCurrentWord(format)
 normal! gv
 if a:format == 'bold'
  let wrapping = '**'
 else
  let wrapping = '_'
 endif
 execute 'normal! "ac' . wrapping . 'a' . wrapping
endfunction
vnoremap <C-b> :call WrapCurrentWord("bold")<cr>
vnoremap <C-i> :call WrapCurrentWord("italic")<cr>

function! s:MarkdownToc()
silent lvimgrep '^#' %
  vertical lopen
  set modifiable
  let &winwidth=(&columns/2)
  %s/\v^([^|]*\|){2,2} #//
  for i in range(1, line('$'))
  let l:line = getline(i)
  let l:header = matchstr(l:line, '^#*')
  let l:length = len(l:header)
  let l:line = substitute(l:line, '\v^#*[ ]*', '', '')
  let l:line = substitute(l:line, '\v[ ]*#*$', '', '')
  let l:line = repeat(' ', (2 * l:length)) . l:line
  call setline(i, l:line)
  endfor
  set nomodified
  set nomodifiable
  normal gg
  highlight qfFileName ctermfg=126
  nnoremap <buffer> qq :close<cr>
endfunction
command! MarkdownToc call <sid>MarkdownToc()
nnoremap qo :MarkdownToc<cr>

function! s:MarkdownCopy()
 if &filetype != 'markdown'
  echoerr 'MarkdownCopy: Only valid on filetype "markdown"'
  return
 endif
 if !executable('multimarkdown')
  echoerr 'MarkdownCopy: multimarkdown executable required'
  return
 endif
 let rtf_convert_cmd = 'textutil -stdin -stdout -convert rtf -format html'
 let pipeline = ['cat '.expand('%'), 'multimarkdown', rtf_convert_cmd, 'pbcopy']
 call system(join(pipeline, ' | '))
 echohl String | echom 'Document copied as RTF'
endfunction
command! MarkdownCopy call <sid>MarkdownCopy()

function! s:RichTextCopy()
 if &filetype != 'markdown'
  echoerr 'RichTextCopy: Only valid on filetype "markdown"'
  return
 endif
 if !executable('multimarkdown')
  echoerr 'RichTextCopy: multimarkdown executable required'
  return
 endif
 let rtf_convert_cmd = 'textutil -stdin -stdout -convert rtf -format html'
 let pipeline = ['cat '.expand('%'), 'multimarkdown', rtf_convert_cmd, 'pbcopy']
 call system(join(pipeline, ' | '))
 echohl String | echom 'Document copied as RTF'
endfunction
command! RichTextCopy call <sid>RichTextCopy()

function! s:MarkdownListBoldify()
 silent!%substitute/^- \(.*\):/- **\1:**/
 silent!%substitute/**http:**/http/
endfunction
command! MarkdownListBoldify call <sid>MarkdownListBoldify()
map <Leader>sm :MarkdownListBoldify<CR>

function! s:LarryClearScratch()
 "MarkdownListBoldify
 "idempotentify MarkdownListBoldify @igg
 "scope to scratch.md
 write
 RichTextCopy
 write
 %delete
 quit
endfunction
command! LarryClearScratch call <sid>LarryClearScratch()
map <leader>m :LarryClearScratch<CR>ZZ

function! s:Kindle()
    %! perl -i.bak -pe 's/[^[:ascii:]]//g'
    global/^-/d
    global/^=/d
    global/^\(.*\)\ze\n\%(.*\n\)*\1$/d
    global/^/pu =\"\n\"
    %! sed G
    %s/^\(.*\)\n\1$/\1/
    normal! gggqG
endfunction
command! Kindle call <sid>Kindle()

" }}}
" markdown crl-p markdown header {{{

function! s:CtrlPMarkdownHeader()
 let line_numbers = range(1, line('$'))
 let g:header_map = []
 for line in line_numbers
  let header_level = s:HeaderLevelForLine(line)
  if header_level > 0
  let header_text = substitute(getline(line), '^#\+\s', '', '')
  let formatted_line = repeat(' ', (header_level - 1) * 2) . header_text
  call add(g:header_map, [line, formatted_line])
  endif
 endfor
 let headers = map(copy(g:header_map), 'v:val[1]')
 call CtrlPGeneric(headers, 'FocusHeaderLine')
endfunction

function! s:HeaderLevelForLine(line)
 let line_and_next = join(getline(a:line, a:line + 1), "\n")
 if !s:IgnoreTitle() && match(line_and_next, '.*\n=\+$') != -1
  return 1
 elseif match(line_and_next, '.*\n-\+$') != -1
  return 1 + s:TitleOffset()
 elseif match(getline(a:line), '^#\{1,}') != -1
  let hashes = matchlist(getline(a:line), '^\(#\+\)\s')[1]
  return len(hashes) - 1 + s:TitleOffset()
 endif
endfunction

function! s:TitleOffset()
 if s:IgnoreTitle()
  return 0
 else
  return 1
 endif
endfunction

function! s:IgnoreTitle()
 return exists('g:markdown_headers_ignore_title') && g:markdown_headers_ignore_title
endfunction

function! FocusHeaderLine(selected_value)
 for [line, header] in g:header_map
  if header == a:selected_value
  normal zM
  call cursor(line, 1)
  let fold_depth = foldlevel('.')
  execute 'normal ' . fold_depth . 'zojj'
  break
  endif
 endfor
endfunction

if !exists('g:markdown_headers_ignore_title')
 let g:markdown_headers_ignore_title = 1
endif

let g:markdown_headers_ignore_title = 0

command! CtrlPMarkdownHeader call <SID>CtrlPMarkdownHeader()
nnoremap <leader><leader> :CtrlPMarkdownHeader<cr>

" }}}
" markdown defer under {{{

function! DeferUnder(heading) range
 let heading = substitute(a:heading, '^\s*\(.\{-}\)\s*$', '\1', '')
 let heading_line = search('^#\{1,5} '. heading, 'n')
 if heading_line == 0
  normal! u
  echoerr "TodoDefer: unable to find heading '". heading ."'"
 else
  normal! k
  let saved_cursor = getpos(".")
  execute a:firstline . "," . a:lastline . "move" . (heading_line + 1)
  call setpos('.', saved_cursor)
  echon "@"
  echohl String | echon heading | echohl None
 endif
endfunction

function! s:PromptedDefer() range
 let headers = s:MarkdownHeaders()
 let range_string = a:firstline.','.a:lastline
 let defer_call = "call CtrlPGeneric(s:MarkdownHeaders(), 'DeferUnder')"
 execute range_string . defer_call
endfunction

function! s:MarkdownHeaders()
 let line_numbers = range(1, line('$'))
 let g:header_map = []
 for line in line_numbers
  let header_level = s:HeaderLevelForLine(line)
  if header_level > 0
  let header_text = substitute(getline(line), '^#\+\s', '', '')
  let formatted_line = repeat(' ', (header_level - 1) * 2) . header_text
  call add(g:header_map, [line, formatted_line])
  endif
 endfor
 return map(copy(g:header_map), 'v:val[1]')
endfunction

function! s:HeaderLevelForLine(line)
 let line_and_next = join(getline(a:line, a:line + 1), "\n")
 if !s:IgnoreTitle() && match(line_and_next, '.*\n=\+$') != -1
  return 1
 elseif match(line_and_next, '.*\n-\+$') != -1
  return 1 + s:TitleOffset()
 elseif match(getline(a:line), '^#\{1,}') != -1
  let hashes = matchlist(getline(a:line), '^\(#\+\)\s')[1]
  return len(hashes) - 1 + s:TitleOffset()
 endif
endfunction

function! s:TitleOffset()
 if s:IgnoreTitle()
  return 0
 else
  return 1
 endif
endfunction

function! s:IgnoreTitle()
 return exists('g:markdown_headers_ignore_title') && g:markdown_headers_ignore_title
endfunction

command! -range -nargs=? DeferUnder <line1>,<line2>call DeferUnder(<f-args>)
command! -range PromptedDefer <line1>,<line2>call <sid>PromptedDefer()

vnoremap ql :DeferUnder later<cr>
nnoremap ql :DeferUnder later<cr>
vnoremap qr :DeferUnder weekly review<cr>
nnoremap qr :DeferUnder weekly review<cr>
vnoremap qk :DeferUnder next<cr>
nnoremap qk :DeferUnder next<cr>
vnoremap qs :PromptedDefer<cr>
nnoremap qs :PromptedDefer<cr>
" }}}
" markdown move lines to file {{{

function! s:MoveLinesToFile() range
  let files = split(glob("**/*.md"), "\n")
  let g:move_lines_to_file_range = [a:firstline, a:lastline]
  call CtrlPGeneric(files, 'MoveLinesToFilePost')
endfunction

function! DeferToSpecificFile(file, mapping) range
  call MoveLinesToFilePost(a:file, a:firstline, a:lastline)
  call repeat#set(a:mapping)
endfunction

function! MoveLinesToFilePost(file, ...)
  if a:0 == 0 " no extra args
    let start = g:move_lines_to_file_range[0]
    let end = g:move_lines_to_file_range[1]
  else
    let start = a:1
    let end = a:2
  endif
  silent! execute "" . start "," . end . "w ! cat - " . a:file ." > .tmp && mv .tmp " . a:file . " && rm .tmp"
  execute "" . start "," . end . "d"
endfunction

function! DefineRepeatableDeferMappings(defer_mappings)
  for [mapping, file] in items(a:defer_mappings)
    execute "map " . mapping . " :call DeferToSpecificFile('" . file . "', '" . mapping ."')<cr>"
  endfor
endfunction

" Edit this dictionary. Key is mapping, value is file to target.
" Note, indentation must be maintained, and no trailing commas!
"
call DefineRepeatableDeferMappings({
      \ "ma": "accounting.md",
      \ "mq": "quotes.md",
      \ "mj": "Someday-Finitude.md",
      \ "mn": "nobody.md"
      \ })

command! -range MoveLinesToFile <line1>,<line2>call s:MoveLinesToFile()
nmap mm :MoveLinesToFile<cr>
vmap mm :MoveLinesToFile<cr>

"}}}
" todo.md / GTD specific {{{

function! s:MGTD()   
  let save_cursor = getpos(".")
  normal! {jms
  normal! }me
  " markdown list formatting
  " silent!  %g/\v^-.*$\n\s{4}-.*/normal r*
  silent! 's,'es/\~ / /
  silent! 's,'es/\* /- /
  silent!  %g/\v^-.*$\n\s{4}-.*/normal r*
  silent! 's,'es/\v([-*]\s)(\w)/\1\u\2/
  " silent! 's,'es/\* /\* \~ /
  silent! 's,'es/Http/http/
  silent! 's,'es/\~ \~/\~/
  " remove duplicate spaces
  silent! 's,'es/\S\@<=\s\{2,}/ /g
  silent! 's,'es/\s\+$//
  normal gqap
  call setpos('.', save_cursor)
endfunction
command! MGTD call <sid>MGTD()
nnoremap Q :MGTD<cr>

nnoremap <leader>f zMggjj

map <Leader>sq :r ! cat ~/Dropbox/stories/gtd/daily.md<cr>
map <Leader>sC :r ! icalbuddy -npn -nc -eep "*" eventsFrom:'1 8days ago' to:'today'<cr> :r ! icalbuddy -npn -nc -eep "*" eventsToday+18<cr>K

function! <SID>GetNext()
  :normal zM
  :normal G
  :normal kdgg
  :normal s2jddggP
  :normal <<
  :normal <<
  :normal o
  :normal k
  :normal O
  :normal O
  :normal zM
  :normal J
endfunction
nmap <silent> 0 :call <SID>GetNext()<CR>

function! <SID>FixFormatting()
  let saved_cursor = getpos(".")
  :normal ma
  " remove multi line charachters
  :silent! 1,$!perl -C -pe 's/\x{200B}//g'
  " merge multiple blank lines
  :silent! %s/\n\{3,}/\r\r/e
  "replace non latin quotes
  :silent! %s/ / /g
  "remove multiple white spaces
  :silent! %s/\s\+/ /g 
  "remove trailing whitespace at EOL
  :silent! %s/\s\+$// 
  "squash multiple white lines to 1
  :silent! %s/\n\{3,}/\r\r/e 
  "restore 4 space indent
  :silent! %s/^\s/&&&&
  :silent! %s/ / /g
  :noh
  :normal `a
  :normal zz
  call setpos('.', saved_cursor)
  :redraw!
endfunction
command! FixFormatting call s:FixFormatting()
nnoremap <localleader>f :silent!FixFormatting<cr>

function! s:GetNumLinesInBuffer()
  let g:NumLine = system('pbpaste | wc -l')
  echo g:NumLine
endfunction
command! GetNumLinesInBuffer call <sid>GetNumLinesInBuffer()
map <Leader>P :GetNumLinesInBuffer<CR>

" }}}
" color {{{

" soalarized loaded earlier because it is very picky about where it is loaded
" in the file and was causing errors

" Solarized options
colorscheme solarized
let g:solarized_termcolors = 256
let g:solarized_visibility = "normal"
let g:solarized_contrast = "normal"
set background=dark

function! s:Solar()   
    set background=dark
    let g:solarized_termcolors = 256
    let g:solarized_visibility = "normal"
    let g:solarized_contrast = "normal"
    colorscheme solarized
    highlight Normal ctermfg=214
    highlight normal ctermfg=214
    highlight Delimiter ctermfg=214
    highlight Delimiter ctermbg=0
    highlight qfFileName ctermfg=213
    hi Folded term=NONE cterm=NONE gui=NONE 
    source ~/code/dotfiles/vim/after/syntax/larry.vim
endfunction
command! Solar call <sid>Solar()

" Show syntax highlighting groups for word under cursor
" extract syntax group (from SO)

nnoremap <leader>hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

highlight Normal ctermfg=214
highlight normal ctermfg=214
highlight Delimiter ctermfg=214
highlight qfFileName ctermfg=213
highlight markdownHeadingDelimiter ctermfg=4
highlight markdownH1 ctermfg=126
hi Folded term=NONE cterm=NONE gui=NONE 
" set fillchars=fold:\ 
source ~/code/dotfiles/vim/after/syntax/larry.vim
hi Folded ctermfg=244

call plug#end()


" }}}
" Folding {{{

" Set a nicer foldtext function
"
set foldtext=MyFoldText()
function! MyFoldText()
  let line = getline(v:foldstart)
  if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
    let linenum = v:foldstart + 1
    while linenum < v:foldend
      let line = getline( linenum )
      let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
      if comment_content != ''
        break
      endif
      let linenum = linenum + 1
    endwhile
    let sub = initial . ' ' . comment_content
  else
    let sub = line
    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
    if startbrace == '{'
      let line = getline(v:foldend)
      let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
      if endbrace == '}'
        let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
      endif
    endif
  endif
  let n = v:foldend - v:foldstart + 1
  let info = ""
  let sub = sub . "                                                                                                                  "
  let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
  let fold_w = getwinvar( 0, '&foldcolumn' )
  " let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
  let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w )
  return sub . info
endfunction
command! MyFoldText call <sid>MyFoldText()

 """ }}}
