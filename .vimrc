" filetype, syntax{{{
filetype plugin indent on " enables filetype detection
syntax enable " enables syntax highlighting, keeping :highlight commands
"}}}
" options{{{
let mapleader=" "
set autoindent " take indent for new line from previous line
set autoread " automatically read file when changed outside of vim
set autowrite " automatically write file if changed
set background=light " 'dark' or 'light' used for highlight colors
set backspace=indent,eol,start " how backspace works at start of line
set breakindent " wrapped lines are indented same as beginning of line
set complete=.,w,b,u,t,i,k " added k for dictionary search
set expandtab " use spaces when <tab> is inserted
set foldmethod=marker " folding type
set formatoptions=tcqrnj
set ignorecase " ignore case
set incsearch
set laststatus=2
set linebreak " wrap long lines at a blank
set modeline
set modelines=1
set nowrapscan
set number " print the line number in front of each line
set pastetoggle=<insert> " key code that causes paste to toggle
set ruler " show cursor line and column in the status line
set shiftround " round indent to shiftwidth
set shiftwidth=4 " number of spaces to use for (auto)indent step
set showbreak=+\  " hanging indents for wrapped lines
set showcmd " show commands
set smartcase " no ignore case when pattern has uppercase
set t_Co=16 " get rid of bold light colors
set tabstop=4 " number of spaces that <tab> in file uses
set textwidth=72 " maximum width of text that is being inserted
set undodir=~/.vim/undo " undo files here
set undofile " persistent undo
set virtualedit=block
set wildmenu
"}}}
" maps{{{
inoremap jk <esc>l
nnoremap <leader>w :w<cr>
nnoremap <leader>j :bnext<cr>
nnoremap <leader>k :bprevious<cr>
nnoremap <f10>
    \ :echo synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")<CR>
nnoremap <leader>bd :bnext<cr>:bdelete #<cr>
nnoremap <leader>si :e ~/.vim/snippets-jfin/
nnoremap <leader>so <c-^>:bdelete snippets-jfin<cr>
    \ :call UltiSnips#RefreshSnippets()<cr>
nnoremap <leader>vi :e $MYVIMRC<cr>
nnoremap <leader>vo :w<cr><c-^>:bdelete .vimrc<cr>:source $MYVIMRC<cr>
nnoremap <leader>wd :cd %:p:h<cr>
noremap Y "*y
" }}}
" filetypes{{{
" md
augroup md " {
    autocmd!
    autocmd FileType markdown set commentstring=<!--%s-->
augroup END " }
" r
augroup r " {
    autocmd!
    autocmd FileType r inoremap <buffer> < <-
    autocmd FileType r inoremap <buffer> << <
    autocmd FileType r nnoremap <buffer><silent> K viw"ry:SlimeSend1 help(<c-r>r)<cr>
augroup END " }
" sh
augroup sh " {
    autocmd!
    autocmd FileType sh setlocal noexpandtab
augroup END " }
"}}}
" slime{{{
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{bottom-right}"}
let g:slime_dont_ask_default = 1
augroup slime " {
    autocmd!
    autocmd FileType r,sh nmap <buffer> <leader>s  <Plug>SlimeLineSend/^[^#\$]<cr>
    autocmd FileType r,sh xmap <buffer> <leader>s <Plug>SlimeRegionSend`.
augroup END " }
"}}}
" ultisnips{{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="?<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["/home/jfin/.vim/snippets-jfin"]
"}}}
" colors{{{
" black darkred darkgreen brown darkblue darkmagenta darkcyan gray
highlight Comment          ctermfg=gray     ctermbg=none   cterm=none
highlight Constant         ctermfg=darkblue ctermbg=none   cterm=none
highlight DiffAdd          ctermfg=green    ctermbg=none   cterm=none
highlight DiffChange       ctermfg=black    ctermbg=none   cterm=none
highlight DiffDelete       ctermfg=darkred  ctermbg=none   cterm=none
highlight DiffText         ctermfg=green    ctermbg=none   cterm=none
highlight EndOfBuffer      ctermfg=gray     ctermbg=none   cterm=none
highlight Error            ctermfg=darkred  ctermbg=none   cterm=none
highlight ErrorMsg         ctermfg=darkred  ctermbg=none   cterm=none
highlight Folded           ctermfg=gray     ctermbg=white  cterm=none
highlight Identifier       ctermfg=black    ctermbg=none   cterm=none
highlight Ignore           ctermfg=gray     ctermbg=none   cterm=none
highlight IncSearch        ctermfg=black    ctermbg=yellow cterm=none
highlight LineNr           ctermfg=gray     ctermbg=white  cterm=none
highlight MatchParen       ctermfg=black    ctermbg=yellow cterm=none
highlight ModeMsg          ctermfg=gray     ctermbg=none   cterm=none
highlight NonText          ctermfg=gray     ctermbg=none   cterm=none
highlight Pmenu            ctermfg=black    ctermbg=white  cterm=none
highlight PmenuSbar        ctermfg=none     ctermbg=white  cterm=none
highlight PmenuSel         ctermfg=black    ctermbg=yellow cterm=none
highlight PmenuThumb       ctermfg=black    ctermbg=white  cterm=none
highlight PreProc          ctermfg=black    ctermbg=none   cterm=none
highlight Search           ctermfg=black    ctermbg=yellow cterm=none
highlight Special          ctermfg=green    ctermbg=none   cterm=none
highlight SpecialKey       ctermfg=gray     ctermbg=none   cterm=none
highlight SpellBad         ctermfg=darkred  ctermbg=none   cterm=none
highlight Statement        ctermfg=black    ctermbg=none   cterm=none
highlight StatusLine       ctermfg=gray     ctermbg=white  cterm=none
highlight StatusLineNC     ctermfg=white    ctermbg=white  cterm=none
highlight StatusLineTerm   ctermfg=gray     ctermbg=white  cterm=none
highlight StatusLineTermNC ctermfg=white    ctermbg=white  cterm=none
highlight Title            ctermfg=black    ctermbg=none   cterm=bold
highlight Type             ctermfg=black    ctermbg=none   cterm=none
highlight Underlined       ctermfg=black    ctermbg=none   cterm=underline
highlight VertSplit        ctermfg=white    ctermbg=white  cterm=none
highlight Visual           ctermfg=black    ctermbg=yellow cterm=none
highlight VisualNOS        ctermfg=black    ctermbg=yellow cterm=none
highlight WarningMsg       ctermfg=darkred  ctermbg=none   cterm=none
highlight WildMenu         ctermfg=black    ctermbg=yellow cterm=none
""}}}
