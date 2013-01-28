set nocompatible               " be iMproved
filetype off                   " required!
let mapleader=","

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'mikewest/vimroom'
Bundle 'tpope/vim-markdown'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kana/vim-fakeclip'
Bundle 'nelstrom/vim-markdown-folding' 

filetype plugin indent on     " required!
syntax on

set formatoptions+=a "Line Wrap
set expandtab       " Convert <tab> to spaces (2 or 4)
set tabstop=4       " Four spaces per tab as default
set shiftwidth=4    " then override with per filteype
set softtabstop=4   " specific settings via autocmd
set showcmd		    " Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" incremental search
set hlsearch		" highlights searches
set relativenumber   " add line numbers
set numberwidth=10  " left margin number width

"Igg folding up/toggle
nmap <leader>fu zM
nmap <leader>uf zR
nmap s za

vnoremap <leader>cp :<c-u>call g:CopyVisualText()<cr>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>p :r!pbpaste<cr>
vnoremap <leader>a GVgg
nnoremap <leader>ca mmggVG,cp<Esc>`m
nnoremap - g$
nnoremap 0 g^
nnoremap j gj
vnoremap j gj
vnoremap k gk
vnoremap $ g9
nnoremap k gk
vnoremap <leader>cp :<c-u>call g:CopyVisualText()<cr>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>p :r!pbpaste<cr>
vnoremap <leader>a GVgg
nnoremap <leader>ca mmggVG,cp<Esc>`m
vmap <C-c> :w !pbcopy<CR><CR>
vmap <C-x> :!pbcopy<CR>  

function! g:CopyVisualText()
    normal! gv
	silent '<,'>w !pbcopy
endfunction

set background=dark
" solarized options 
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

set spell 
nnoremap <leader>sp ea<C-x><C-s>

if exists("+spelllang")
  set spelllang=en_us
endif
set spellfile=~/.vim/spell/en.utf-8.add

" Markdown Mode

nnoremap <leader>mkd :call OpenCurrentFileInMarked()<cr>

function! OpenCurrentFileInMarked()
    let current_file = expand('%')
    let open_cmd = join(["open -a Marked", current_file])
    call system(open_cmd)
endfunction




