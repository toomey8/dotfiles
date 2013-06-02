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
Bundle 'scrooloose/nerdtree' 
Bundle 'msanders/snipmate.vim'
set autochdir
autocmd vimenter * NERDTree 
autocmd vimenter * wincmd w 
let NERDTreeChDirMode=2
nnoremap <leader>n :NERDTreeToggle .<cr>
let NERDTreeIgnore = ['\.plist$']
"nnoremap <Leader>n :let NERDTreeQuitOnOpen = 1<bar>NERDTreeToggle<CR>
"nnoremap <Leader>N :let NERDTreeQuitOnOpen = 0<bar>NERDTreeToggle<CR>


filetype plugin indent on     " required!
syntax on

set textwidth=60    " Left margin and fixes line numbers
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
set relativenumber          " add line numbers
set numberwidth=5  " left margin number width

"Igg folding up/toggle
nmap <leader>fu zM
nmap <leader>uf zR
nmap s za

"Remove use of arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

vnoremap <leader>c :<c-u>call g:CopyVisualText()<cr>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>p :r!pbpaste<cr>
vnoremap <leader>a GVgg
nnoremap <leader>/ ?
nnoremap <leader>a mmggVG,cp<Esc>`m
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
nnoremap <esc> :noh<return><esc>
nnoremap Q gqap
" nnoremap b n
" nnoremap n b
" nnoremap m e
" nnoremap e m
"nnoremap a A
"nnoremap A a
vmap <C-c> :w !pbcopy<CR><CR>
vmap <C-x> :!pbcopy<CR>  
" work on Markdown shorter iab <hh> <####>
" iab <jj> <-> 
" line (b/e) sentence(b/e) paragraph (b/e) Heading # (b/e)
"
"Igg Markdown Functions
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

function! FixLastSpellingError()
    execute "normal! mm[s1z=`mA"
"    mm[s1z=`ma
endfunction
nnoremap <silent> <leader>w :call FixLastSpellingError()<cr>


function! g:CopyVisualText()
    normal! gv
	silent '<,'>w !pbcopy
endfunction

set background=light
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

nnoremap <leader>m :call OpenCurrentFileInMarked()<cr>

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
      normal! "lc[l](=system('pbpaste'))
    else
      let url = input("URd: ")
      if url != ''
        execute 'normal! "lc[l](' . url . ')'
      endif
    endif
endfunction

vnoremap <C-k> :call ConvertVisualSelectionToLink(1)<cr>


