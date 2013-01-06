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

filetype plugin indent on     " required!
syntax on

set expandtab " Convert <tab> to spaces (2 or 4)
set tabstop=4 " Four spaces per tab as default
set shiftwidth=4 " then override with per filteype
set softtabstop=4 " specific settings via autocmd
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" incremental search
set hlsearch		" highlights searches

nnoremap 0 g^
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
vnoremap $ g9
vnoremap <leader>a GVgg
vnoremap <leader>cp :<c-u>call g:CopyVisualText()<cr>
nnoremap <leader>p :r!pbpaste<cr>
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
set formatoptions+=a
nnoremap <leader>sp ea<C-x><C-s>

if exists("+spelllang")
  set spelllang=en_us
endif
set spellfile=~/.vim/spell/en.utf-8.add

