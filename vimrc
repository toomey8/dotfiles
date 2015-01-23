"
" Larry B., .vimrc!
" vim:fdm=marker
" Eternal thanks to https://github.com/christoomey

" editor {{{

set guifont=Menlo:h22
set tw=60
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
set nocompatible " be improved
set term=screen-256color
set autochdir
filetype off " required!
set scrolloff=5 "keep cursor closer to middle
let mapleader = "\<Space>"
let maplocalleader = ","
set formatoptions+=tl
" set formatoptions=1
set linebreak
set clipboard=unnamed
set ignorecase " Do case insensitive matching
set smartcase " Do smart case matching
set expandtab " Convert <tab> to spaces (2 or 4)
set tabstop=4 " Four spaces per tab as default
set shiftwidth=4 " then override with per filteype
set softtabstop=4 " specific settings via autocmd
set smartindent
set showcmd " Show (partial) command in status line.
set incsearch " incremental search
set nobackup
set noswapfile " because they make a mess of everything
set helpheight=999
set cursorline cursorcolumn " helps me orient on screen
set shell=/bin/bash\ -i "makes ! shell commands work

" encryption
set cm=blowfish

" Searching stuff
set hlsearch " hilight searches, map below to clear
nohlsearch " kill highliting on vimrc reload
set incsearch " do incremental searching
set ignorecase " Case insensitive...
set smartcase " ...except if you use UCase

" nice bash-like filename auto-complete
set wildmenu
set wildmode=longest,list,full

" }}}
" bundle {{{

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
Bundle 'itchyny/calendar.vim'
Bundle 'mileszs/ack.vim'
Bundle 'jalvesaq/VimCom'
" Bundle 'amdt/vim-niji'
"     let g:niji_matching_filetypes = ['lisp', 'ruby', 'python']
"     let g:niji_dark_colours = [['brown', 'RoyalBlue3'],
"                             \ ['Darkblue', 'SeaGreen3'],
"                             \ ['darkgray', 'DarkOrchid3'],
"                             \ ['darkgreen', 'firebrick3'],
"                             \ ['darkcyan', 'RoyalBlue3']]
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-indent'
    nmap qd <Plug>(textobj-indent-a)
Bundle 'rhysd/clever-f.vim'
    let g:clever_f_ignore_case = 1
Bundle 'justinmk/vim-sneak'
    nmap ∆ <Plug>SneakForward
    nmap ˚ <Plug>SneakBackward
    let g:sneak#streak = 1
    let g:sneak#use_ic_scs = 1
Bundle 'junegunn/goyo.vim'
    let g:goyo_width=65
    nnoremap <leader>z :setlocal relativenumber!<cr>
    nnoremap <C-x> :Goyo<cr>
    " quick open / quit
    nnoremap qw :tabe ~/Dropbox/stories/scratch.md<CR>:CtrlP<CR>
    nnoremap qq :Goyo!<cr>:x<cr>
    autocmd! User GoyoEnter nnoremap <buffer> <C-x> :Goyo<cr>:source $MYVIMRC<cr>
Bundle 'scrooloose/nerdtree'
    nnoremap <leader>N :NERDTreeToggle .<cr>
    let NERDTreeChDirMode = 2
    let NERDTreeIgnore    = ['\.plist$']
Bundle 'kien/ctrlp.vim'
    let g:ctrlp_use_caching   = 0
    let g:ctrlp_custom_ignore = '\v\.(jpeg|jpg|JPG|pdf|png|doc|docx|xls|xlsx|csv|Icon^M^M)$'
Bundle 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = "context"
Bundle 'godlygeek/tabular'
     nmap <localleader>e :Tabularize / = <CR>
     vmap <localleader>e :Tabularize / = <CR>
     nmap <localleader>c :Tabularize / : <CR>
     vmap <localleader>c :Tabularize / : <CR>
Bundle 'terryma/vim-expand-region'
    vmap v <Plug>(expand_region_expand)
    vmap <C-v> <Plug>(expand_region_shrink)

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
" noremap ˚ {
noremap K k?^$?<cr>j<esc>:noh<cr>
noremap J j}k
let joinchar = ' '
nnoremap S :s/\n/\=joinchar/<CR><esc>:noh<return><esc>

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
vnoremap K k
vnoremap L g_
nnoremap - g$
nnoremap j gj
vnoremap j gj
vnoremap k gk
nnoremap k gk
vnoremap $ g9
nnoremap <silent> <esc> :noh<return><esc>
nnoremap ; :
nnoremap a A
nnoremap A a
nmap <tab> :tabnext<cr>
nmap <leader><tab> :tabnew<cr>
nmap s za

"Bubble single lines
nmap <c-j> ddp
nmap <c-k> ddkP
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
nnoremap <leader>sp zR:g//normal! ddggP<cr>zMggs
nnoremap <leader>se :tabnew<cr>:e $MYVIMRC<cr>
nnoremap <leader>st :tabnew<cr>:e ~/code/dotfiles/tmux.conf<cr>
nnoremap <leader>sh :tabnew<cr>:e ~/code/dotfiles/bashrc<cr>
nnoremap <leader>sg :tabnew<cr>:e ~/code/dotfiles/gitconfig<cr>
nnoremap <leader>sR :tabnew<cr>:e ~/code/dotfiles/snippet.r<cr>
nnoremap <leader>sb :tabnew<cr>:e ~/code/dotfiles/snippet.sh<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>qq :tabnew<cr>
vnoremap <leader>a GVgg
nnoremap <leader>a GVgg
nnoremap <leader>i :sp<cr><c-w>w:CtrlP<CR>
nnoremap <leader>o :tabe ~/Dropbox/stories/scratch.md<CR>:CtrlP<CR>
nnoremap <leader>q :%norm vipJ<cr>
nnoremap <leader>q :%norm vipJ<cr>
nnoremap qp :set paste<cr>

" markdown navigation
" move visual selection to top/bottom of heading markdown list
nnoremap <leader>j /^#
nnoremap <leader>k ?^#
" move to top, close all other folds

""" }}}
" {{{ grep bindings

" Search the current file for what's currently in the search register and display matches
nmap <silent> <leader>gh :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current file for the word under the cursor and display matches
nmap <silent> gf :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current file for the WORD under the cursor and display matches
nmap <silent> <leader>gF :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" grep for particular regexes
nnoremap <silent>qp :w!<cr>:Ack! '\b(call\|phone\|-\d{4})\b' todo.md<cr>
nnoremap <silent>q2 :w!<cr>:Ack! '@jess' todo.md<cr>
nnoremap <silent>qn :w!<cr>:Ack! '@neil' todo.md<cr>
nnoremap <silent>qt :w!<cr>:Ack! '@nate' todo.md<cr>
nnoremap gA :Ack! *.md<left><left><left><left><left>
nnoremap ga :Ack!

" }}}
" {{{ spelling & prose

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

if exists("+spelllang")
  set spelllang=en_us
endif
set spellfile=~/.vim/spell/en.utf-8.add

""" }}}
" macros {{{

set lazyredraw "speed up macros

" pop to top of paragraph, return to edited
let @j = 'jmmkdd{}P`m'
let @k = 'kmmjdd}{p`m'

" make todo into microproject
let @p = 'Hr*jkiki - i'
let @h = 'HokrOr#i##jkiki	- i'

let @l = 'Hi- j'
let @o = 'o* - kH'

" randomize paragraph

let @r = 'vapk:!gsort -R'

" append date to eol
" nnoremap <leader>4 "=strftime("(%d-%m-%y)")<CR>P
nnoremap <leader>4 "=strftime("(%d-%b-%y)")<CR>P
let @t = 'o 4kJ'

" tagging

let @q = 'a @jessH'
let @n = 'a @neilH'
let @t = 'a @nateH'

""" }}}
" python/r/coding {{{

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Bundle 'hdima/python-syntax'
" let python_highlight_all = 1
Bundle 'mattn/webapi-vim'
Bundle 'christoomey/ctrlp-generic'
Bundle 'christoomey/vim-quicklink'
    vnoremap <leader>l :call ConvertVisualSelectionToLink()<cr>
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'christoomey/vim-tmux-runner'
    nmap <localleader>u :VtrSendLinesToRunner<cr>
    nmap <localleader>i vip:VtrSendLinesToRunner<cr>
    vmap <localleader>u <Esc>:VtrSendLinesToRunner<cr>
    nmap <leader>sT :VtrAttachToPane<cr>
function! WrapRVarAndSend(wrapper)
 let command = a:wrapper . '(' . expand('<cword>') . ')'
 call VtrSendCommand(command)
endfunction
    " nnoremap <localleader>c :call WrapRVarAndSend('class')<cr>
    nnoremap <localleader>l :call WrapRVarAndSend('length')<cr>
    nnoremap <localleader>h :call WrapRVarAndSend('head')<cr>
    nnoremap <localleader>s :call WrapRVarAndSend('see')<cr>
    let g:VtrStripLeadingWhitespace = 0
    let g:VtrClearEmptyLines = 0
    let g:VtrAppendNewline = 0
" Bundle 'ivanov/vim-ipython'
" Bundle 'johndgiese/vipy'
Bundle 'hynek/vim-python-pep8-indent'
au FileType r set iskeyword+=.
au FileType r set iskeyword+=$

""" }}}
" markdow config {{{

Bundle 'tpope/vim-markdown'
Bundle 'altercation/vim-colors-solarized'
filetype plugin indent on " required!
syntax on

Bundle 'nelstrom/vim-markdown-folding'
    let g:markdown_fold_style = 'nested'

autocmd FileType python,r,R,s,S,Rrst,rrst,Rmd,rmd,txt call MarkdownFoldingForAll()
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

function! Browser ()
  let line = getline (".")
  let line = matchstr (line, "\%(http://\|www\.\)[^ ,;\t]*")
  exec "! start chrome ".line
endfunction
map <Leader>2 :call Browser ()<CR>

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

" Create a markdown formatted link with the visually selected word as the
" anchor text. If auto_link == 1, then use the current item in the system
" clipboard, else prompt for the URL

function! ConvertVisualSelectionToLink(auto_link)
    normal! gv
    if a:auto_link
      normal! "lc[l](=system('pbpaste')
)
    else
      let url = input("URL: ")
      if url != ''
        execute 'normal! "lc[l](' . url . ')'
      endif
    endif
endfunction
vnoremap <C-U> :call ConvertVisualSelectionToLink(1)<cr>

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
endfunction
command! MarkdownListBoldify call <sid>MarkdownListBoldify()
map <Leader>sm :MarkdownListBoldify<CR>

function! s:LarryClearScratch()
  "MarkdownListBoldify
  "idempotentify MarkdownListBoldify @igg
  "scope to scratch.md
  write
  RichTextCopy
  %delete
  write
  quit
endfunction
command! LarryClearScratch call <sid>LarryClearScratch()

map <Leader>m :LarryClearScratch<CR>ZZ

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
vnoremap qj :DeferUnder weekly review<cr>
nnoremap qj :DeferUnder weekly review<cr>
vnoremap qk :DeferUnder next<cr>
nnoremap qk :DeferUnder next<cr>
vnoremap qs :PromptedDefer<cr>
nnoremap qs :PromptedDefer<cr>

" }}}
" todo.md / GTD specific {{{

nnoremap Q gqap
nnoremap <leader>f zMggjj

map <Leader>sc :tabnew<cr>:e ~/Dropbox/stories/captio.txt<cr>
map <Leader>sq :r ! cat ~/Dropbox/stories/gtd/daily.md<cr>

map <Leader>sd :r ! icalbuddy -npn -nc -eep "*" eventsFrom:'18 days ago' to:'today'<cr> :r ! icalbuddy -npn -nc -eep "*" eventsToday+18<cr>K

function! <SID>GetNext()
    :normal zM
    :normal G
    :normal kdgg
    :normal s2jddggP
    :normal <<
    :normal o
    :normal k
    :normal O
    :normal O
    :normal zM
    :normal J
endfunction
nmap <silent> 0 :call <SID>GetNext()<CR>

function! <SID>RemoveNonLatin()
    " remove multi line charachters
    :silent! 1,$!perl -C -pe 's/\x{200B}//g'
    " merge multiple blank lines
    :silent! %s/\n\{3,}/\r\r/e
    "replace non latin quotes
    :silent! %s/”/"/g 
    :silent! %s/“/"/g 
endfunction
nmap <silent> <Leader>su :call <SID>RemoveNonLatin()<cr>

function! <SID>FixFormatting()
    :normal ma
    :silent! %s/        /8888/g
    "remove multiple white spaces
    :silent! %s/\s\+/ /g 
    "remove trailing whitespace at EOL
    :silent! %s/\s\+$// 
    "squash multiple white lines to 1
    :silent! %s/\n\{3,}/\r\r/e 
    "restore 4 space indent
    :silent! %s/^\s/&&&&
    :silent! %s/8888/        /g
    :noh
    :normal `a
    :normal zz
    :redraw!
endfunction
nmap <silent> <Leader>sa :call <SID>FixFormatting()<cr>

function! <SID>AddBlankLinesAtTop()
    :normal gg
    :normal O
endfunction
nmap <silent> <Leader>sx :call <SID>AddBlankLinesAtTop()<CR>

function! s:GetNumLinesInBuffer()
    let g:NumLine = system('pbpaste | wc -l')
    echo g:NumLine
endfunction
command! GetNumLinesInBuffer call <sid>GetNumLinesInBuffer()
map <Leader>P :GetNumLinesInBuffer<CR>

function! <SID>ToggleParagraph()
    :normal zM
    :normal ggf-
    :normal vapkx
    :normal jsjp
endfunction
nmap <silent>- :call <SID>ToggleParagraph()<cr>

" }}}
" color {{{

" soalrized loaded earlier because it is very picky about where it is loaded
" in the file and was causing errors

Bundle 'xterm-color-table.vim'
Bundle 'flazz/vim-colorschemes'

" Solarized options
set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "normal"
let g:solarized_contrast = "normal"
colorscheme solarized

" Show syntax highlighting groups for word under cursor
" extract syntax group (from SO)
nnoremap <leader>hi :echo 'hi<' . synIDattr(synID(line('.'),col('.'),1),'name') . '> trans<' . synIDattr(synID(line('.'),col('.'),0),'name') . '> lo<' . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name') . '>'<cr>

highlight Normal ctermfg=214
highlight normal ctermfg=214
highlight rBoolean ctermfg=165
highlight rOperator ctermfg=88
highlight rNumber ctermfg=128
highlight Delimiter ctermfg=214
highlight rString ctermfg=93
highlight rConditional ctermfg=22

source ~/code/dotfiles/vim/after/syntax/python.vim
" hi lo ctermfg=22
" }}}
