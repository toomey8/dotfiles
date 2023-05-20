"md vim:fdm=marker
"Eternal thanks to https://github.com/christoomey

" Vim {{{

let mapleader = "\<Space>"
let maplocalleader = ","
set backspace=indent,eol,start
set lazyredraw "speed up macros
set tw=60
set laststatus=0
set autochdir
filetype off " required!
set scrolloff=7 "keep cursor closer to middle
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
set hlsearch " highlight searches, map below to clear
set wildmenu
set wildmode=longest,list,full
set nohlsearch


command! SourceAllFiles execute "source ~/.vimrc" | execute "!tmux source-file ~/.tmux.conf" | execute "!source ~/.bashrc"

nnoremap <leader>sv :silent SourceAllFiles<cr>


" }}}
" Vim-plug {{{



call plug#begin('~/.vim/plugged')

Plug 'kkharji/sqlite.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'dhruvmanila/telescope-bookmarks.nvim', { 'tag': '*' }

" require('telescope').setup {
"   extensions = {
"     bookmarks = {
"       selected_browser = 'chrome',
"     },
"   }
" }

" Plug 'JuliaEditorSupport/julia-vim'
Plug 'christoomey/ctrlp-generic'
Plug 'christoomey/vim-quicklink'
   vnoremap <leader>l :call ConvertVisualSelectionToLink()<cr>
Plug 'github/copilot.vim'

Plug 'justinmk/vim-sneak'
    map f <Plug>Sneak_s
    map F <Plug>Sneak_S
    map t <Plug>Sneak_t
    map T <Plug>Sneak_T
    let g:sneak#s_next = 1
    let g:sneak#use_ic_scs = 1

Plug 'chrisbra/NrrwRgn'
" Plug 'gko/vim-coloresque'
" Plug 'mzlogin/vim-markdown-toc'
Plug 'wellle/targets.vim'
Plug '~/code/larryville'
Plug 'lifepillar/vim-solarized8'
Plug 'christoomey/ctrlp-generic'
Plug 'christoomey/vim-titlecase'
  nmap <leader>t <Plug>TitlecaseLine<cr>
  vmap <leader>t <Plug>Titlecase<cr>
Plug 'christoomey/vim-quicklink'
   vnoremap <leader>l :call ConvertVisualSelectionToLink()<cr>
Plug '/vim-mathematica'
    " let g:mma_candy = 2
Plug 'junegunn/vim-peekaboo'
  let g:peekaboo_delay = 450
Plug 'junegunn/vim-easy-align'
  nmap ga <Plug>(EasyAlign)
  xmap ga <Plug>(EasyAlign)
  vmap , :EasyAlign*,<Enter>
  " https://robots.thoughtbot.com/align-github-flavored-markdown-tables-in-vim
      map <Bar> vip :EasyAlign*<Bar><Enter>
      vmap <cr> <Plug>(EasyAlign)
      " Start interactive EasyAlign in visual mode (e.g. vipga)
      xmap ga <Plug>(EasyAlign)
      " Start interactive EasyAlign for a motion/text object (e.g. gaip)
      nmap ga <Plug>(EasyAlign)
Plug 'tpope/vim-markdown'
    let g:markdown_fenced_languages = ['python', 'html', 'r', 'bash=sh','mma', 'm=mma', 'j=r']
Plug 'danro/rename.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'kien/ctrlp.vim'
  let g:ctrlp_follow_symlinks = 2
  let g:ctrlp_use_caching = 0
  let g:ctrlp_map = '<c-x>'
  let g:ctrlp_custom_ignore = '\v\.(jpeg|jpg|JPG|pdf|png|doc|docx|svg|xls|xlsx|Icon^M^M)$'
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
Plug 'ervandew/supertab'
set complete+=s
let g:SuperTabDefaultCompletionType = "context"
    inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
    inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
Plug 'terryma/vim-expand-region'
  vmap v <Plug>(expand_region_expand)

  vmap <C-v> <Plug>(expand_region_shrink)

""" }}}
" Abrev {{{

"General

iabbrev :ants: 🐜
"↑↑↑ literally how you get ants

imap qw^t ᵗ
imap qwe2 ²
imap qw+ ⁺
imap qwti ×
    " \times
imap qwci ∘
imap qwvv 𝒗
imap qwvw 𝑤
imap qwaa 𝒂
imap qwbb 𝒃
imap qwcc 𝒄
imap qwii ℹ
imap qwee ℯ
imap qwd6 °
    " degree
"Logic
imap qwel ∈
    " is an element of 
imap qwex ∃
    " there exists 
imap qwaa ∀   
    " for all 
imap qwbc ∵
    " because
imap qwtf ∴
    " therefore
imap qwxo ⊕
imap qweq ≡
    " equivalent
"Equivalance
    imap qwne ≠
    imap qwre ≈ 
    
"Fields
imap qwnn ℕ
    " field of natural numbers 
    " {1,2,3,4}
imap qwzz ℤ
    " field of integers 
    " {-1,0,1,2,3..}
imap qwqq ℚ
    " field of rational numbers
    " {-3/4, 14/2}
imap qwrr ℝ
    " field of real numbers
    " {π, ℯ, log(2), sin(π/7)}
imap qwcc ℂ
    " field of complex numbers
    " {2π + i, -3 + 4i}
    
"Greek
" Gamma
    map! qwG Γ
map! qwDE Δ
    " Delta
map! qwTH Θ
    " Theta
map! qwLA Λ
    " Lambda
map! qwXI Ξ
    " XI
map! qwPI Π
    " PI
map! qwSI Σ
    " Sigma
map! qwPH Φ
    " Phi
map! qwPS Ψ
map! qwOM Ω
map! qwal α
map! qwbe β
map! qwga γ
map! qwde δ
map! qwep ε
map! qwze ζ
map! qwet η
map! qwth θ
map! qwio ι
map! qwka κ
map! qwla λ
map! qwmu μ
map! qwxi ξ
map! qwpi π
map! qwrh ρ
map! qwsi σ
map! qwta τ
map! qwps ψ
map! qwom ω
map! qwph ϕ
    " phi
map! qwvp φ
    " varphi
imap qwge ≥   
imap qwle ≤
imap qwar ↔
imap qwno ¬
    " not
imap qwim ⇒
    " implies
" Operators
imap qwI ∫
    " integration
imap qwdb ‖
    " norm double bar
imap qwde ∂
    " partial derivation
imap qwdi ÷
    " Euclidean division. x/y truncated to int in Julia
imap qwin ∞

""" }}}
" fzf {{{

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
    nnoremap <C-n> :bnext<CR>
    imap <c-c> <plug>(fzf-complete-file-ag)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')
  let height = float2nr(40)
  let width = float2nr(40)
  let horizontal = float2nr((&columns - width) / 1.3)
  let vertical = 0
  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  call nvim_open_win(buf, v:true, opts)
endfunction

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', '16', '16'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['bg', '16'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nnoremap qa :Rg <Space>
nnoremap ql :Lines<cr>
nnoremap qb :Buffers<CR>
nnoremap qh :QHist<CR>

""" }}}
" Goyo {{{

Plug 'junegunn/goyo.vim'
  let g:goyo_width=88
  let g:goyo_margin_top = 0
  let g:goyo_margin_bottom = 0

function! ToggleRelativeNumber()
    let &relativenumber = &relativenumber?0:1
    let &nu = &nu?0:1
    "let &number = &relativenumber? 0:1
endfunction
nnoremap <silent> <Leader>z :call ToggleRelativeNumber()<cr>

function! s:Goyo90()
if tabpagenr('$') == '1'
    Goyo 88%x88%
endif
endfunction
command! Goyo90 call <sid>Goyo90()
nmap <C-g> :Goyo90<cr>

function! s:GoyoAloneOpen()
if tabpagenr('$') == '1'
    Goyo90
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
    execute 'quit!'
  endif
endif
endfunction
command! QuickQuit call <sid>QuickQuit()

nnoremap qq :silent Goyo!<cr>:QuickQuit<cr>:GoyoAloneOpen<cr><cr>

function! s:InGoyoClose()
if tabpagenr('$') > '1'
    Goyo
endif
endfunction
command! InGoyoClose call <sid>InGoyoClose()

nnoremap <c-e> :Goyo!<cr>:tabe ~/Dropbox/stories/temp.md<CR>:call fzf#run(fzf#wrap({'source': 'ls *.{md,jl,mma,css}'}))<cr><cr>
nnoremap qe :Goyo!<cr>:tabe ~/Dropbox/stories/scratch.md<CR>:call fzf#run(fzf#wrap({'source': 'ls *.*'}))<cr><cr>

nnoremap qa :Goyo!<cr>:tabnew<CR>:Rg<space>
nnoremap qc :Goyo!<cr>:tab<CR>:Files<CR>
nnoremap qn :InGoyoClose<cr>:tabnew<cr>

 """ }}}
" Dictionary {{{

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
" Leader mappings {{{

" cut & paste
" nnoremap <leader>p :r!pbpaste<cr>

" Mappings for quick search & replace. Global set to default
" Do a / search first, then leave pattern empty in :s// to use previous
nnoremap <leader>sr :%s///g<left><left><left>
vnoremap <leader>sr :s///g<left><left>

" Search and replace word under cursor
nnoremap <Leader>* :%s/\<<C-r><C-w>\>//g<Left><Left>

nnoremap <leader>se :tabnew<cr>:e ~/.vimrc<cr>

nnoremap <leader>sb :InGoyoClose<cr>:tabnew<cr>:e ~/code/dotfiles/bashrc<cr>
nnoremap <leader>sd :InGoyoClose<cr>:tabnew<cr>:FZF ~/code/<cr>

vnoremap <leader>a GVgg
nnoremap <leader>a GVgg

nnoremap s za
let @l = 'Hi- j'

" Emacs bindings
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
cnoremap <c-a> <home>
cnoremap <c-e> <end>
nnoremap <c-%> %

noremap K k?^$?<cr>j<esc>:noh<cr>
vmap K {j
noremap J j}k

nmap <c-j> /\v^(\*<Bar>#)<cr>:noh<cr>
nmap <c-k> ?\v^(\*<Bar>#)<cr>:noh<cr>

vnoremap <c-j> /*<cr>
vnoremap <c-k> ?*<cr>

"remap S for J, so J can be used for motions
nnoremap S :s/\n/\=joinchar/<CR><esc>:noh<return><esc>
let joinchar = ' '
noremap H ^
noremap L $
nnoremap <c-h> )
nnoremap <c-l> (
nnoremap Y y$
vnoremap L g_

nnoremap j gj
vnoremap j gj

vnoremap k gk
nnoremap k gk

vnoremap $ g9
nnoremap ; :

nnoremap a A
nnoremap A a

nmap <tab> :tabnext<cr>
vmap <tab> :tabnext<cr>

" Center in screen when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Keep search matches in the middle of the window.
nnoremap n nzzzv
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

""" }}}
" Spelling & prose {{{

" set spellfile=en.utf-8.add


" hi SpellBad xterm=underline
no remap <leader>S ea<C-x><C-s>

function! FixLastSpellingError()
 let position = getpos('.')[1:3]
 let current_line_length = len(getline('.'))
 normal! [s1z=
 let new_line_length = len(getline('.'))
 let position[1] += (new_line_length - current_line_length)
 call cursor(position)
endfunction
nnoremap <leader>w :call FixLastSpellingError()<cr>
" imap jk <c-o>:call FixLastSpellingError()<cr>
imap jk <esc>
imap kj <esc>

if exists("+spelllang")
  set spelllang=en_us
endif

""" }}}
" Macros {{{

" pop to top of paragraph, return to edited
nnoremap mk kmmjdd}{p`m
nnoremap mj jmmkdd{}P`m

""" }}}
" tmux {{{

Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
    let g:VtrStripLeadingWhitespace = 0
    let g:VtrClearEmptyLines = 0
    let g:VtrAppendNewline =  0
nmap <leader>sT :VtrAttachToPane<cr>

nmap <localleader><localleader> vip: VtrSendLinesToRunner<cr>

function! s:LarryTime() abort
  let l:pane_count = system('tmux list-panes | wc -l')
  if l:pane_count == 1
    VtrOpenRunner {'orientation': 'h', 'percentage': 50}
  endif
  VtrSendCommandToRunner j
endfunction
command! LarryTime call <sid>LarryTime()
nnoremap <leader>sj :LarryTime<cr>

""" }}}
" r {{{

au FileType r set iskeyword+=.
au FileType r set iskeyword+=$

" function! WrapRVarAndSend(wrapper)
"  let command = a:wrapper . '(' . expand('<cword>') . ')'
"  call VtrSendCommand(command)
" endfunction
"   nnoremap <localleader>h :call WrapRVarAndSend('head')<cr>
"   nnoremap <localleader>d :call WrapRVarAndSend('datatable')<cr>
"   nnoremap <localleader>g :call WrapRVarAndSend('glimpse')<cr>

""" }}}
" Mathematica {{{

au BufReadPost *.m set syntax=mma

" nnoremap <localleader>l :VtrSendCommand Export["latex.txt", TeXForm[%]]<cr><cr>

nnoremap <localleader>l :VtrSendCommand Export["latex.txt",%]<cr><cr>

function! s:TexInsert()
    execute 'VtrSendCommand 
    execute 'VtrSendCommand Export["latex.txt", StringJoin[{"$$",ToString[TeXForm[%]], "$$"}] '
    sleep 300m
    execute 'r latex.txt'
endfunction
command! TexInsert call s:TexInsert()
nmap <localleader>n :TexInsert<cr>

nnoremap <localleader>l :VtrSendCommandToRunner Export["latex.txt", TeXForm[%]]<cr><cr>
nnoremap <localleader>i :VtrSendCommand Export["latex.txt", %]<cr><cr>
nnoremap <localleader>m :VtrSendCommand Quiet[Export["latex.txt", %]<cr><cr>

" }}}
" Journal config {{{

" append date to eol todo make leader3 month name
nnoremap <leader>3 "=strftime("(%d-%m-%y)")<CR>P
nnoremap <leader>4 "=strftime("## %A, %b %d, %Y %H:%M")<CR>P

function! s:Insertdate()
  execute 'r!date "+\%A, \%b \%d \%Y @\%I:\%M \%p"'
endfunction
command! Insertdate call <sid>Insertdate()
nnoremap <leader>d :Insertdate<cr>
" nnoremap <leader>d :r! date<cr>

function! s:CreateJournalEntryFromBuffer()
  normal Go
  write
  silent! call system('cat spark2.md spark.md | sponge spark.md')
  %delete
  quit
endfunction
command! CreateJournalEntryFromBuffer call <sid>CreateJournalEntryFromBuffer()

function! s:CreateMistakeEntryFromBuffer()
  normal Go
  write
  silent! call system('cat spark2.md mistake.md | sponge mistake.md')
  %delete
  quit
endfunction
command! CreateMistakeEntryFromBuffer call <sid>CreateMistakeEntryFromBuffer()
nnoremap <leader>e :CreateMistakeEntryFromBuffer<cr>ZZ<cr>

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
" Markdown  {{{
" }}}
"  -- markdown config {{{
	
function! s:Unidecode()
  "write paragraph to temp file
    '{,'}write! unidecode.md
  "run unidecode script
    execute '!unidecode unidecode.md > unidecode.txt'
  "delete paragraph
    normal! vipx
  ""pipe in unidecoded
    execute 'r unidecode.txt'
  " remove duplicate spaces
  silent! 's,'es/\S\@<=\s\{2,}/ /g
  "delete temp files
  " execute '!rm unidecode.txt'
  " execute '!rm unidecode.md'
  :redraw!
endfunction
command! Unidecode call <sid>Unidecode()
map <localleader>u gqip:silent! Unidecode<CR>

Plug 'nelstrom/vim-markdown-folding'
    let g:markdown_fold_override_foldtext = 0
    autocmd FileType s,S,Rrst,rrst,Rmd,rmd,txt call MarkdownFoldingForAll()

" MarkdownFolding after plugin / markdown undo comment
autocmd BufEnter *.rmd Plug 'vim-pandoc/vim-pandoc'
autocmd BufEnter *.rmd Plug 'vim-pandoc/vim-pandoc-syntax'
autocmd BufEnter *.rmd Plug 'vim-pandoc/vim-rmarkdown'

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
    execute 'normal! "ac' . wrapping . 'a' . wrapping
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
    write!
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
map <c-m> :RichTextCopy<CR>

function! s:MathematicaUnicode()
    silent!%substitute/∈/\\\[Element\]/
endfunction
command! MathematicaUnicode call <sid>MathematicaUnicode()
map <Leader>mb :MathematicaUnicode<CR>

function! s:MarkdownListBoldify()
    silent!%substitute/^- \(.*\):/- **\1:**/
    silent!%substitute/http:\/\///
    silent!%substitute/https:\/\///
endfunction
command! MarkdownListBoldify call <sid>MarkdownListBoldify()
map <Leader>mb :MarkdownListBoldify<CR>

function! s:LarryClearScratch()
    write
    RichTextCopy 
    normal ggO
    normal ggO
    normal ggHi##
    execute 'r!date "+\%A, \%b \%d \%Y @\%I:\%M \%p"'
    silent! normal ggS
    silent! normal Go
    silent! normal Go
    write
    silent! call system('cat scratch.md email.md | sponge email.md')
    %delete
    quit
endfunction
command! LarryClearScratch call <sid>LarryClearScratch()
map <leader>m :LarryClearScratch<CR>ZZ


" }}}
"  -- markdown crl-p markdown header {{{

function! MoveEm(position)
  let saved_cursor = getpos(".")
  let previous_blank_line = search('^$', 'bn')
  let target_line = previous_blank_line + a:position - 1
  execute 'move ' . target_line
  call setpos('.', saved_cursor)
endfunction

for position in range(1, 9)
  execute 'nnoremap m' . position . ' :call MoveEm(' . position . ')<cr>'
endfor
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
nnoremap <leader><leader> :Lines
nnoremap <leader><leader> :silent! CtrlPMarkdownHeader<cr>

" }}}
"  -- markdown defer under {{{

function! DeferUnder(heading) range
  " mkview!
  let heading = substitute(a:heading, '^\s*\(.\{-}\)\s*$', '\1', '')
  let heading_line = search('^#\{1,5} '. heading, 'n')
  if heading_line == 0
    normal! u
    echoerr "TodoDefer: unable to find heading '". heading ."'"
  else
    let current_line = line('.') - 1
    let current_line_text = getline(current_line)
    execute a:firstline . "," . a:lastline . "move" . (heading_line + 1)
    execute current_line
    if getline('.') != current_line_text
      let target_line = line('.') + (a:lastline - a:firstline) + 1
      let target_line = target_line
      execute target_line
    endif
    normal! zvzz^
    call search("^.\+$", "bc")
    echon "@"
    echohl String | echon heading | echohl None
  endif
  normal zx
  " loadview
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

vnoremap qd :DeferUnder λ<cr>
nnoremap qd :DeferUnder λ<cr>
vnoremap qk :DeferUnder \.<cr>
nnoremap qk :DeferUnder \.<cr>
vnoremap qr :DeferUnder weekly review<cr>
nnoremap qr :DeferUnder weekly review<cr>
vnoremap qs :PromptedDefer<cr>
nnoremap qs :PromptedDefer<cr>

function! s:GotoLastEdit()
  normal! g;
endfunction
command! GotoLastEdit call <sid>GotoLastEdit()
nnoremap ,e :GotoLastEdit<cr>

" }}}
"  -- markdown move lines to file {{{

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
  let g:start=start
  let g:end=end
  silent! execute start "," . end . "w ! cat - " . a:file ." > .tmp && mv .tmp " . a:file . " && rm .tmp"
  silent! execute start . "," . end . "delete"
endfunction

function! DefineRepeatableDeferMappings(defer_mappings)
  for [mapping, file] in items(a:defer_mappings)
    execute "map " . mapping . " :call DeferToSpecificFile('" . file . "', '" . mapping ."')<cr>"
  endfor
endfunction

" Edit this dictionary. Key is mapping, value is file to target.
" Note, indentation must be maintained, and no trailing commas!

call DefineRepeatableDeferMappings({
      \ "ma": "archive.md",
      \ "mq": "quotes.md",
      \ "mj": "@jess.md",
      \ "mn": "@neil.md"
      \ })
command! -range MoveLinesToFile <line1>,<line2>call s:MoveLinesToFile()
nmap mm :MoveLinesToFile<cr>
vmap mm :MoveLinesToFile<cr>

"}}}
"  -- markdown formatting {{{

function! s:RenderMarkdown()
    " silent! w
    " call system('pandoc --highlight-style breezeDark -o --from=markdown --standalone --katex  $(ls -t | head -1) -o notes.html --css air.css --toc --toc-depth=0')
    silent! w! temp2.md
    call system('pandoc --highlight-style breezeDark -o --from=markdown --standalone --katex temp2.md -o notes.html --css air.css')
    call system('open notes.html')
endfunction
command! RenderMarkdown call <sid>RenderMarkdown()
nnoremap <leader>1 :RenderMarkdown<cr>

" trailing whitespace
"%s/\s\+$//e
"%s/\n\{2,}/\r\r/e


"}}}
"  -- t.md / GTD specific {{{



function! s:ChoresInsert()
    execute 'r WorksAndDays.md'
endfunction
command! ChoresInsert call s:ChoresInsert()
nmap <leader>sc :ChoresInsert<cr>

function! s:GTDProject()
    normal! o* ~~~~~~~~~~
    normal! <<
  normal! o+ /({})/
  normal! F}
  call feedkeys('i')
endfunction
command! GTDProject call <sid>GTDProject()
nnoremap <silent><c-p> :GTDProject<cr>

let @o = 'o* ~~~~~~~~~~'
function! s:GTDSeperator()
    normal! o* ~~~~~~~~~~
    normal! j
endfunction
command! GTDSeperator call <sid>GTDSeperator()
nnoremap <silent><c-o> :GTDSeperator<cr>

function! s:EpubCSS()
  " %s/{/{font-size: 8em !important;/
  " %s/{/{color: unset !important;/
  " %s/{/{background-color: unset !important;/
  " %s/font-size\: *.*/font-size\: 8em \!important\;/
  %s/font-size\:*.*/font-size\: 3em\;/
endfunction
command! EpubCSS call <sid>EpubCSS()
nnoremap <c-x> :EpubCSS<cr>

function! s:Project()
  let save_cursor = getpos(".")
  normal! {jr*
  normal! A:
  " silent! 's,'es/: /:
  call setpos('.', save_cursor)
endfunction
command! Project call <sid>Project()
nnoremap X :Project<cr>


function! s:MGTD()
  let save_cursor = getpos(".")
  normal! {jms
  normal! }me
  %s/\s\+$//e
  silent!  %g/\v^-.*$\n\s{4}-.*/normal r*
  silent! 's,'es/\v([-*]\s)(\w)/\1\u\2/
  silent! g/^*\s/norm a:
  silent! g/::/norm Lr
  silent! 's,'es/Http/http/
  silent! 's,'es/::/:
  " silent! 's,'es/: /:
  silent! 's,'es/\~ \~/\~/
  silent! 's,'es/?:/?
  silent! 's,'es/Www/www
  " remove duplicate spaces
  silent! 's,'es/\S\@<=\s\{2,}/ /g
  silent! 's,'es/\s\+$//
  silent! 's,'es/\/\/\:/\/\/
  silent! %s/\~\:/\~/
  silent! %s/\::/:/
  " silent! 's,'es/::/:
  normal gqap
  call setpos('.', save_cursor)
  normal! zx
endfunction
command! MGTD call <sid>MGTD()
nnoremap Q :MGTD<cr>

nnoremap <leader>f zMggjj

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
" Ultisnips {{{
"
" Track the engine.
" Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" Plug 'honza/vim-snippets'

" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<c
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

""" }}}
" Color {{{

nnoremap <leader>hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

Plug 'lifepillar/vim-solarized8'
call plug#end()
    let &t_ZH="\e[3m"
    let &t_ZR="\e[23m"
    if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
    endif
colorscheme larry-dark-solarized

""" }}}
