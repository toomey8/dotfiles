" Larry B, .vimrc
" vim:fdm=marker

" editor {{{

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
set nocompatible               " be improved
set term=screen-256color
set autochdir
filetype off                   " required!
set scrolloff=5 "keep cursor closer to middle
let mapleader = "\<Space>"
let maplocalleader = ","
set formatoptions=1
set linebreak
set cursorline cursorcolumn  " helps me orient on screen
set clipboard=unnamed
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set expandtab       " Convert <tab> to spaces (2 or 4)
set tabstop=4       " Four spaces per tab as default
set shiftwidth=4    " then override with per filteype
set softtabstop=4   " specific settings via autocmd
set smartindent
set showcmd      " Show (partial) command in status line.
set incsearch                " incremental search
set relativenumber          " add line numbers
set numberwidth=1  " left margin number width
set nobackup
set noswapfile     " because they make a mess of everything
set helpheight=999

" Searching stuff
set hlsearch       " hilight searches, map below to clear
nohlsearch         " kill highliting on vimrc reload
set incsearch      " do incremental searching
set ignorecase     " Case insensitive...
set smartcase      " ...except if you use UCase

" nice bash-like filename auto-complete
set wildmode=longest,list,full
set wildmenu
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore=*Icon*
" }}}
" bundle {{{

Bundle 'gmarik/vundle'
Bundle 'rhysd/clever-f.vim'
    let g:clever_f_ignore_case = 1
Bundle 'justinmk/vim-sneak'
    nmap ß <Plug>SneakForward
    nmap ∂ <Plug>SneakBackward
    let g:sneak#streak = 1
    let g:sneak#use_ic_scs = 1
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-speeddating'
    nnoremap <leader>2 "=strftime("%a %d %b")<CR>P
Bundle 'itchyny/calendar.vim'
Bundle 'kien/ctrlp.vim'
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
    let g:ctrlp_custom_ignore = 'Icon.*'
Bundle 'xterm-color-table.vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/syntastic'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'scrooloose/nerdtree'
    nnoremap <leader>N :NERDTreeToggle .<cr>
    let NERDTreeChDirMode=2
    let NERDTreeIgnore = ['\.plist$']
Bundle 'jalvesaq/VimCom'
Bundle 'kien/ctrlp.vim'
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
    let g:ctrlp_custom_ignore = 'Icon*'
Bundle 'jalvesaq/VimCom'
"Bundle 'jcfaria/Vim-R-plugin'
Bundle 'Valloric/YouCompleteMe'
    let g:ycm_auto_trigger = 0
    let g:ycm_filetype_blacklist = {}
    let g:ycm_path_to_python_interpreter = '/usr/bin/python'

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
noremap ∆ {
noremap ˚ }

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
nnoremap - g$
nnoremap 0 g^
nnoremap j gj
vnoremap j gj
vnoremap k gk
nnoremap k gk
vnoremap $ g9
nnoremap <silent> <esc> :noh<return><esc>
nnoremap Q gqap
nnoremap ; :
nnoremap a A
nnoremap A a
nmap <tab> :tabnext<cr>

""" }}}
" leader mappings {{{

" cut & paste
vnoremap <leader>c :<c-u>call g:CopyVisualText()<cr>
nnoremap <leader>p :r!pbpaste<cr>
nnoremap <leader>x GVgg:!pbcopy<CR>x

" Mappings for quick search & replace. Global set to default
" Do a / search first, then leave pattern empty in :s// to use previous
nnoremap <Leader>sr :%s///g<left><left>
vnoremap <Leader>sr :s///g<left><left>

nnoremap <leader>sn :setlocal number!<cr>
nnoremap <leader>se :tabnew<cr>:e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ss :set numberwidth=1<cr>
nnoremap <leader>sb :set numberwidth=10<cr>
vnoremap <leader>a GVgg
nnoremap <leader>a GVgg
nnoremap <leader>0 :vsp<cr><c-w>w:CtrlP<CR>
nnoremap <leader>i :sp<cr><c-w>w:CtrlP<CR>
nnoremap <leader>o :tabedit scratch.md<CR>:CtrlP<CR>
nnoremap <leader>l :%norm vipJ<cr>
vmap <leader>x :!pbcopy<CR>

" markdown navigation
" move visual selection to top/bottom of heading markdown list
nnoremap <leader>j /^#
nnoremap <leader>k ?^#
" move to top, close all other folds
nmap <leader>f zMggs
nmap <leader>z 0zMlzz
nmap s za
"Bubble single lines
nmap <c-j> ddp
nmap <c-k> ddkP
" Bubble multiple lines
vmap <c-j> xp`[V`]
vmap <c-k> xkP`[V`]

nmap <leader>sl :call ListLeaders<CR>
function! ListLeaders()
    silent! redir @a
    silent! nmap <LEADER>
    silent! redir END
    silent! new
    silent! put! a
    silent! g/^s*$/d
    silent! %s/^.*,//
    silent! normal ggVg
    silent! sort
    silent! let lines = getline(1,"$")
endfunction

""" }}}
"  {{{ spelling

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

""" }}}
" macros  {{{

" todo macros
let @w = 'ggdt#jsjjddkkskPOj�kbj'

""" }}}
" python/coding {{{

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

Bundle 'christoomey/ctrlp-generic'
Bundle 'christoomey/vim-tmux-runner'
Bundle 'christoomey/vim-tmux-navigator'
    nmap <localleader>u :VtrSendLineToRunner<cr>
    vmap <localleader>u <esc>:VtrSendSelectedToRunner<cr>
    nmap <leader>st :VtrAttachToPane<cr>
    let g:VtrStripLeadingWhitespace = 0
    let g:VtrClearEmptyLines = 0
    let g:VtrAppendNewline = 0
"Bundle 'ivanov/vim-ipython'
Bundle 'johndgiese/vipy'
Bundle 'hynek/vim-python-pep8-indent'

""" }}}
" markdown basic {{{

Bundle 'tpope/vim-markdown'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nelstrom/vim-markdown-folding'
autocmd FileType python,r,R,s,S,Rrst,rrst,Rmd,rmd,txt call MarkdownFoldingForAll()
function! MarkdownFoldingForAll()
      runtime after/ftplugin/markdown/folding.vim
  endfunction

""" }}}
" markdown functions {{{

" Preview in Marked
nnoremap <leader>1 :w<cr>:call OpenCurrentFileInMarked()<cr>
function! OpenCurrentFileInMarked()
    let current_file = expand('%')
    let open_cmd = join(["open -a Marked", current_file])
    call system(open_cmd)
endfunction

""" }}}
" junk {{{

function! g:CopyVisualText()
    let cur_register_contents = @c
    normal! gv
    normal! "cy
    normal! gv
    silent call system('pbcopy', @c)
endfunction

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
" <option-j/k> down/up paragraph
noremap ∆ {
noremap ˚ }

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
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
nnoremap <leader>N :NERDTreeToggle .<cr>
let NERDTreeChDirMode=2
let NERDTreeIgnore = ['\.plist$']
filetype plugin indent on     " required!
syntax on
set textwidth=60    " Left margin and fixes line numbers

set expandtab       " Convert <tab> to spaces (2 or 4)
set tabstop=4       " Four spaces per tab as default
set shiftwidth=4    " then override with per filteype
set softtabstop=4   " specific settings via autocmd
"set smarttab
set smartindent
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
set showcmd                    " Show (partial) command in status line.
set incsearch                " incremental search
set hlsearch                " highlights searches
set relativenumber          " add line numbers
set numberwidth=1  " left margin number width
set nobackup
set noswapfile
set helpheight=999
set autowriteall
set autoread

" }}}
" to sort {{{

function! g:CopyVisualText()
    let cur_register_contents = @c
    normal! gv
    normal! "cy
    normal! gv
    silent call system('pbcopy', @c)
endfunction

nnoremap <leader>x GVgg:!pbcopy<CR>x

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
nnoremap <leader>h :CtrlPMarkdownHeader<cr>
nnoremap <leader><leader> :CtrlPMarkdownHeader<cr>

" }}}
" color {{{

Bundle 'xterm-color-table.vim'
Bundle 'flazz/vim-colorschemes'

" solarize options
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
highlight Delimiter ctermfg=27
highlight rString ctermfg=93
highlight rConditional ctermfg=22
" }}}
