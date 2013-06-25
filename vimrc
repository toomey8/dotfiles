" Larry B, .vimrc
set nocompatible               " be iMproved
"set term=screen-256color
"set term=screen-256color
filetype off                   " required!
let mapleader = "\<Space>"

set rtp+=~/.vim/bundle/vundle/
set clipboard=unnamed
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-markdown'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kana/vim-fakeclip'
Bundle 'nelstrom/vim-markdown-folding' 
Bundle 'scrooloose/nerdtree' 
Bundle 'msanders/snipmate.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'jcfaria/Vim-R-plugin'
Bundle 'ervandew/screen'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-repeat'
Bundle 'chrisbra/improvedft'
Bundle 'mikewest/vimroom'
"Bundle 'henrik/vim-open-url'
"Bundle 'Lokaltog/vim-easymotion'

set autochdir
autocmd vimenter * wincmd w 
nnoremap <leader>N :NERDTreeToggle .<cr>
let NERDTreeChDirMode=2
let NERDTreeIgnore = ['\.plist$']
let g:ft_improved_ignorecase = 1
" Easy Motion Settings  
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
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
set numberwidth=10  " left margin number width
set nobackup
set noswapfile

"Set Marks For todo.md
" Recall uppercase marks across sessions
function! SetTodoMarks (...)
    execute "normal! gg/now<CR>mM"
    execute "normal! gg/next<CR>mN"
    execute "normal! gg/holding<CR>mH"
    execute "normal! gg/list<CR>mL"
    execute "normal! gg/goals<CR>mG"
    endfunction
nnoremap <leader>u :call SetTodoMarks()<cr>

nnoremap <leader>m dd`Mp<C-O>
nnoremap <leader>n dd`Np<C-O>
nnoremap <leader>h dd`Hp<C-O>
nnoremap <leader>l dd`Lp<C-O>
nnoremap <leader>g dd`Gp<C-O>
nnoremap <leader>i ggjdd`Nzojdd`MpzMzo

"Markdown folding up/toggle
nmap <leader>f zMggs
nmap <leader>y zMs
nmap <leader>Y zR
nmap s za
"Bubble single lines
nmap <C-K> ddkP
nmap <C-J> ddp
" Bubble multiple lines
vmap <C-K> xkP`[V`]
vmap <C-j> xp`[V`]
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nmap <leader>r <leader>sv<leader>V
nnoremap a A
nnoremap A a
vnoremap <leader>a GVgg
nnoremap <leader>a GVgg
nnoremap <leader>o :CtrlP<CR>
nnoremap <leader>p :r!pbpaste<cr>
vnoremap <leader>c :!pbcopy<CR>
nnoremap <leader>x GVgg:!pbcopy<CR>x 
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

" Easy window navigation
"nnoremap <Left> <C-w>h
"nnoremap <Right> <C-w>l
"nnoremap <Up> <C-w>k
"nnoremap <Down> <C-w>j

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

function! FixLastSpellingError()
    execute "normal! mm[s1z=`mA"
endfunction
nnoremap <silent> <leader>w :call FixLastSpellingError()<cr>


" solarized options 
set background=dark
let g:solarized_termcolors = 256
"let g:solarized_termcolors=16
let g:solarized_visibility = "normal"
let g:solarized_contrast = "normal"
"let g:vimroom_background="#b58900"
"let g:vimroom_ctermbackground = 8
"let g:solarized_termtrans = 1
colorscheme solarized

set spell 
nnoremap <leader>sp ea<C-x><C-s>

if exists("+spelllang")
  set spelllang=en_us
endif
set spellfile=~/.vim/spell/en.utf-8.add

" Markdown Mode

nnoremap <leader>q :call OpenCurrentFileInMarked()<cr>

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
vnoremap <C-k> :call ConvertVisualSelectionToLink(1)<cr>
"nnoremap <silent> <Leader>Z <Plug>VimroomToggle
nnoremap ; :
nnoremap , ;


