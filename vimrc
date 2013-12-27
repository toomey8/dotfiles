" Larry B, .vimrc
set nocompatible               " be improved
set term=screen-256color
filetype off                   " required!
set scrolloff=5 "keep cursor closer to middle
let mapleader = "\<Space>"
let maplocalleader = ","
set formatoptions=1
set linebreak
set cursorline cursorcolumn 
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

set rtp+=~/.vim/bundle/vundle/
set clipboard=unnamed
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'christoomey/vim-tmux-runner'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'christoomey/ctrlp-generic'
nmap <localleader>l :VtrSendLineToRunner<cr>
nmap <leader>st :VtrAttachToPane<cr>
vmap <localleader>l <esc>:VtrSendSelectedToRunner<cr>
Bundle 'tpope/vim-markdown'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nelstrom/vim-markdown-folding' 
autocmd FileType python,r,R,s,S,Rrst,rrst,Rmd,rmd,txt call MarkdownFoldingForAll()
function! MarkdownFoldingForAll()
      runtime after/ftplugin/markdown/folding.vim
  endfunction
Bundle 'xterm-color-table.vim' 
Bundle 'flazz/vim-colorschemes'
Bundle 'mileszs/ack.vim' 
Bundle 'scrooloose/nerdtree' 
nnoremap <leader>N :NERDTreeToggle .<cr>
Bundle 'scrooloose/syntastic' 
Bundle 'hynek/vim-python-pep8-indent' 
let NERDTreeChDirMode=2
let NERDTreeIgnore = ['\.plist$']
Bundle 'kien/ctrlp.vim'
nmap <leader>sp :CtrlPClearCache<cr>
Bundle 'jalvesaq/VimCom'
"Bundle 'jcfaria/Vim-R-plugin'
Bundle 'ervandew/screen'
Bundle 'mikewest/vimroom'
Bundle 'rhysd/clever-f.vim'
let g:clever_f_ignore_case = "1"
Bundle 'Valloric/YouCompleteMe'

set autochdir
autocmd vimenter * wincmd w 
filetype plugin indent on     " required!
syntax on
set textwidth=60    " Left margin and fixes line numbers

nnoremap <leader>sn :setlocal number!<cr>
set expandtab       " Convert <tab> to spaces (2 or 4)
set tabstop=4       " Four spaces per tab as default
set shiftwidth=4    " then override with per filteype
set softtabstop=4   " specific settings via autocmd
set showcmd		    " Show (partial) command in status line.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" incremental search
set hlsearch		" highlights searches
set relativenumber          " add line numbers
set numberwidth=1  " left margin number width
set nobackup
set noswapfile

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
noremap K k
vnoremap K k
vnoremap L g_

" Searching stuff
set hlsearch                    " hilight searches, map below to clear
nohlsearch                      " kill highliting on vimrc reload
set incsearch                   " do incremental searching
set ignorecase                  " Case insensitive...
set smartcase                   " ...except if you use UCase
" silence hilighting
nmap <F4> :silent noh<CR>
nnoremap <LEADER>rh :silent noh<CR>

" Mappings for quick search & replace. Global set to default
" Do a / search first, then leave pattern empty in :s// to use previous
nnoremap <Leader>sr :%s///g<left><left>
vnoremap <Leader>sr :s///g<left><left>

" Heresy! Emacs bindings!
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
cnoremap <c-a> <home>
cnoremap <c-e> <end>
nnoremap <leader>d <C-W>w 
" move next item in que to runway
nnoremap <leader>n gg/# Next<cr>zajjddzMggp
" markdown navigation
" pop to next/previous heading
nnoremap <leader>j /^#
nnoremap <leader>k ?^#
" move visual selection to top/bottom of heading markdown list
vmap <leader>j x?^#/-P<esc>
vmap <leader>k x/^#?-p<esc>
" move to top, close all other folds
nmap <leader>f zMggs
nmap <leader>y zMs
nmap <leader>Y zR
nmap <leader>z 0zMlzz
nmap s za
"Bubble single lines
nmap <c-j> ddp
nmap <c-k> ddkP
" Bubble multiple lines
vmap <c-j> xp`[V`]
vmap <c-k> xkP`[V`]
nnoremap <leader>e :e<cr>
nnoremap <leader>se :sp<cr><c-w>w:e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ss :set numberwidth=1<cr>
nnoremap <leader>sb :set numberwidth=10<cr>
vnoremap <leader>a GVgg
nnoremap <leader>a GVgg
nnoremap <leader>0 :vsp<cr><c-w>w:CtrlP<CR>
nnoremap <leader>i :sp<cr><c-w>w:CtrlP<CR>
nnoremap <leader>o :tabedit scratch.md<CR>:CtrlP<CR>
nnoremap <localleader>i :tabn<cr>
nnoremap <C-i> :tabn<cr>
nnoremap <leader>p :r!pbpaste<cr>

" For some reason Vim no longer wants to talk to the OS
" X pasteboard through * (except in tmux)
vnoremap <leader>c :<c-u>call g:CopyVisualText()<cr>

function! g:CopyVisualText()
    let cur_register_contents = @c
    normal! gv
    normal! "cy
    normal! gv
    silent call system('pbcopy', @c)
endfunction

nnoremap <leader>x GVgg:!pbcopy<CR>x 
" autocmd Filetype markdown setlocal spell wrap linebreak
" nolist textwidth=0 potential soft wrap solution on
" markdown output wrapping issue 

vmap <leader>x :!pbcopy<CR>  
vmap <C-c> :w !pbcopy<CR><CR>
vmap <C-x> :!pbcopy<CR>  
nnoremap <leader>l :%norm vipJ<cr> 
nnoremap <leader>/ ?
nnoremap - g$
nnoremap 0 g^
nnoremap j gj
vnoremap j gj
vnoremap k gk
nnoremap k gk
vnoremap $ g9
nnoremap <silent> <esc> :noh<return><esc>
nnoremap Q gqap

"Igg Markdown Functions

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

" spelling

set spell
nnoremap <leader>S ea<C-x><C-s>

function! FixLastSpellingError()
    execute "normal! mm[s1z=`mA"
endfunction
nnoremap <silent> <leader>w :call FixLastSpellingError()<cr>

if exists("+spelllang")
  set spelllang=en_us
endif
set spellfile=~/.vim/spell/en.utf-8.add

" Preview in Marked
nnoremap <leader>1 :w<cr>:call OpenCurrentFileInMarked()<cr>
function! OpenCurrentFileInMarked()
    let current_file = expand('%')
    let open_cmd = join(["open -a Marked", current_file])
    call system(open_cmd)
endfunction

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

nnoremap ; :
nnoremap a A
nnoremap A a

" color scheme tweaking
" solarized options 

set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "normal"
let g:solarized_contrast = "normal"
colorscheme solarized
" Show syntax highlighting groups for word under cursor
" extract syntax group (from SO)
" nnoremap <leader>hi :echo 'hi<' . synIDattr(synID(line('.'),col('.'),1),'name') . '> trans<' . synIDattr(synID(line('.'),col('.'),0),'name') . '> lo<' . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name') . '>'<cr>

nmap <leader>sp :call <SID>SynStack()<CR>

function! <SID>SynStack()
  if !exists("*syn stack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

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
            execute 'normal ' . fold_depth . 'zo'
            break
        endif
    endfor
endfunction

command! CtrlPMarkdownHeader call <SID>CtrlPMarkdownHeader()
nnoremap <leader>h :CtrlPMarkdownHeader<cr>

highlight rNormal ctermfg=136
highlight Normal ctermfg=136
highlight normal ctermfg=136
highlight rBoolean ctermfg=165
highlight rOperator ctermfg=88
highlight rNumber ctermfg=128
highlight Delimiter ctermfg=27 
highlight rString ctermfg=93
highlight rConditional ctermfg=22
