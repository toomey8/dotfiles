
" Larry B., .vimrc!
" vim:fdm=marker

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
Bundle 'tpope/vim-speeddating'
Bundle 'itchyny/calendar.vim'
Bundle 'mileszs/ack.vim'
Bundle 'jalvesaq/VimCom'
Bundle 'rhysd/clever-f.vim'
    let g:clever_f_ignore_case = 1

Bundle 'justinmk/vim-sneak'
    nmap ∆ <Plug>SneakForward
    nmap ˚ <Plug>SneakBackward
    let g:sneak#streak = 1
    let g:sneak#use_ic_scs = 1

Bundle 'junegunn/goyo.vim'
    nnoremap <Leader>x :Goyo<CR>:source $MYVIMRC<cr>
    let g:goyo_width=65
    set relativenumber " add line numbers
    nnoremap <leader>z :setlocal relativenumber!<cr>

Bundle 'scrooloose/nerdtree'
    nnoremap <leader>N :NERDTreeToggle .<cr>
    let NERDTreeChDirMode=2
    let NERDTreeIgnore = ['\.plist$']

Bundle 'kien/ctrlp.vim'
    " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
    let g:ctrlp_custom_ignore = '\v\.(jpeg|jpg|JPG|pdf|png|doc|docx|xls|xlsx|csv|Icon^M^M)$'

Bundle 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = "context"

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

" quick escape
imap jk <esc>
imap kj <esc>

" Jump Paragraphs with meta j,k
" noremap ˚ {
noremap K k?^$?<cr>j<esc>:noh<cr>
noremap J }j
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
nnoremap 0 g^
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
nnoremap <leader>sv :source $MYVIMRC<cr>
vnoremap <leader>a GVgg
nnoremap <leader>a GVgg
nnoremap <leader>0 :vsp<cr><c-w>w:CtrlP<CR>
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
nnoremap <silent>qp :Ack! '\b(call\|phone\|-\d{4})\b' todo.md<cr>
nnoremap gA :Ack! *.md<left><left><left><left><left>
nnoremap ga :Ack!

" }}}
" {{{ spelling & prose

set spell
nnoremap <leader>S ea<C-x><C-s>

" function! FixLastSpellingError()
" execute "normal! mm[s1z=`mA"
" endfunction
" nnoremap <silent> <leader>w :call FixLastSpellingError()<cr>

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

" delegate to bottom of today, return to mark
let @h = 'jmmkdd f/# todayjj{}P`mzMzv'

" make todo into microproject
let @p = 'HOjr*jkiki	- i'

let @l = 'Hi- j'
let @o = 'o* - kH'

" append date to eol
" nnoremap <leader>4 "=strftime("(%d-%m-%y)")<CR>P
nnoremap <leader>4 "=strftime("(%d-%b-%y)")<CR>P
let @t = 'o 4kJ'

" pop to top of paragraph, return to edited
let @j = 'jmmkdd{}P`m'
let @k = 'kmmjdd}{p`m'

""" }}}
" python/r/coding {{{

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Bundle 'hdima/python-syntax'
" let python_highlight_all = 1
Bundle 'christoomey/ctrlp-generic'
Bundle 'christoomey/vim-quicklink'
Bundle 'mattn/webapi-vim'
    vnoremap <leader>l :call ConvertVisualSelectionToLink()<cr>
Bundle 'christoomey/vim-tmux-runner'
Bundle 'christoomey/vim-tmux-navigator'
    nmap <localleader>u :VtrSendLineToRunner<cr>
    vmap <localleader>u <esc>:VtrSendSelectedToRunner<cr>
    nmap <leader>sT :VtrAttachToPane<cr>
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

""" }}}
" markdown functions {{{

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

function! s:CtrlPMarkdownHeader()
    let lines = getline('1', '$')
    let line_number = 1
    let g:header_map = []
    for line in lines
        if match(line, '^#\{1,}') != -1
            call add(g:header_map, [line_number, line])
        endif
        let line_number += 1
    endfor
    let headers = map(copy(g:header_map), 'v:val[1]')
    call CtrlPGeneric(headers, 'MoveToLine')
endfunction

function! MoveToLine(selected_value)
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

command! CtrlPMarkdownHeader call <SID>CtrlPMarkdownHeader()
nnoremap <leader><leader> :CtrlPMarkdownHeader<cr>

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
map <Leader>sb :MarkdownListBoldify<CR>

function! s:LarryClearScratch()
  MarkdownListBoldify
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
" todo.md {{{

nnoremap Q gqap
nnoremap <leader>f zMggj

function! s:set_gtd_marks()
    " - (h)bottom-today/sideways
    " - (j)weekly-review/down
    " - (k)top-runway/up
    " - (l)ater
    " - (s)week
  keeppatterns /## today
      mark h
      nmap qh zRjmmkdd`hjp`mzMzv
  keeppatterns /### weekly review
      mark j
      nmap qj zRjmmkdd`jjp`mzMzv
  keeppatterns /# Nex
      mark k
      nmap qk zRjmmkdd`kjp`mzMzv
  keeppatterns /## late
      mark l
      nmap ql zRjmmkdd`ljp`mzMzv
  keeppatterns /## weekly
      mark s
      nmap qs zRjmmkdd`sjp`mzMzv
endfunction
autocmd BufReadPost todo.md silent! call <SID>set_gtd_marks()

map <Leader>sc :tabnew<cr>:e ~/Dropbox/stories/captio.txt<cr>

map <Leader>sd :r ! icalbuddy -npn -nc -eep "*" eventsFrom:'18 days ago' to:'today'<cr> :r ! icalbuddy -npn -nc -eep "*" eventsToday+18<cr>K

" function! <SID>QuickQuit()
" if bufname("%") == ""
" :wq! ~/Dropbox/stories/gtd/quit.md
" else
" :wq
" endif
" endfunction
" nmap qq :call <SID>QuickQuit()<cr>
nmap qq :x<cr>

" quick open
nnoremap qw :tabe ~/Dropbox/stories/scratch.md<CR>:CtrlP<CR>

function! <SID>StripTrailingWhitespace()
    let _s=@/
    let l = line(".")
    let c = col(".")
    :w
    :call <sid>AddBlankLinesAtTop()
    :call <sid>AddBlankLinesAtTop()
    :call append('.', '')
    :call append('.', '')
    :call append('.', '')
    :silent! %s/\(\_^#\+.*\)/\r\1\r
    :silent! %s/\s\+$//e
    :silent! %s![^ ]\zs \+! !g
    :silent! %!cat -s
    :silent! normal zMggs
    :2
    let @/=_s
    call cursor(l, c)
endfunction
nmap <silent> <Leader>sj :call <SID>StripTrailingWhitespace()<CR>

nmap <Leader>sa :.s![^ ]\zs \+! !g<cr>:noh<cr>

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
    let line = getline('.')
    "if line is empty, get from #next
    if len(line) == 0
        :silent! normal Gsggf-dapggp sj
    "if line is full, push below #next
    elseif len(line) > 0
        " :silent! normal dapGsGkp f sx sx
        :silent! normal vapkxGsG?# nextjp f sj sxj
    endif
endfunction
nmap <silent>- :call <SID>ToggleParagraph()<cr>

function! <SID>GetNext()
    let line=getline('.')
    if len(line) == 0
        " no task above fold
        :call <sid>AddBlankLinesAtTop()
        /# Next
        :silent! normal sjggJdd
        :silent! normal zMggs
        :silent! normal p
        :silent! call <SID>StripTrailingWhitespace()<CR>
    elseif len(line) > 0
        " task above fold
        :silent! normal ggf-
        :silent! normal vapkx
        :call <sid>AddBlankLinesAtTop()
        :call <sid>AddBlankLinesAtTop()
        /# Next
        :silent! normal sjggJdd
        :silent! normal zMggs
        :silent! normal p
        :silent! call <SID>StripTrailingWhitespace()<CR>
    endif
endfunction
nmap 0 :call <SID>GetNext()<cr>

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
" hi lo ctermfg=22
" }}}
