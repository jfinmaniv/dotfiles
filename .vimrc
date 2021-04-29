" vim: set foldlevel=0:
" filetype, syntax{{{
filetype plugin indent on " enables filetype detection
syntax enable " enables syntax highlighting, keeping :highlight commands
"}}}
" variables{{{
let mapleader = " "
" supposed to make gx work but doesn't:
let netrw_browsex_viewer = "/opt/firefox/firefox.exe"
let markdown_folding = 1
"}}}
" options{{{
set autoindent " take indent for new line from previous line
set autoread " automatically read file when changed outside of vim
set autowriteall " automatically write file if changed
set background=light " 'dark' or 'light' used for highlight colors
set backspace=indent,eol,start " how backspace works at start of line
set breakindent " wrapped lines are indented same as beginning of line
set complete=.,w,b,u,t,i,k " added k for dictionary search
set encoding=utf-8
set expandtab " use spaces when <tab> is inserted
set foldmethod=marker " folding type
set nohlsearch
set ignorecase " ignore case
set incsearch
set laststatus=0
set linebreak " wrap long lines at a blank
set modeline
set modelines=1
set nowrapscan
" set number " print the line number in front of each line
set pastetoggle=<insert> " key code that causes paste to toggle
set ruler " show cursor line and column in the status line
set shiftround " round indent to shiftwidth
set shiftwidth=4 " number of spaces to use for (auto)indent step
set showbreak=+\  " hanging indents for wrapped lines
set showcmd " show commands
set smartcase " no ignore case when pattern has uppercase
set t_Co=16 " get rid of bold light colors
set tabstop=4 " number of spaces that <tab> in file uses
set textwidth=78 " maximum width of text that is being inserted
set undodir=~/.vim/undo " undo files here
set undofile " persistent undo
set virtualedit=block
set wildmenu
"}}}
" functions{{{
function! HandleLink()"{{{
    " open file with appropriate app
    let link = @l
    let ext = fnamemodify(link, ':e')
    if ext[0:2] == 'txt'
        " ge is part of platsicboy/vim-markdown plugin
        normal ge
    elseif link[0:3] == 'http'
        normal gx
    elseif ext == 'pdf'
        execute system('sumatra-pdf ' . fnameescape(link) . '&')
    else 
        execute system('start "" ' . fnameescape(link) . '&')
    endif
endfunction
"}}}
function! FzyCommand(choice_command, vim_command)"{{{
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction
"}}}
"}}}
" maps{{{
nnoremap <leader>ff :call FzyCommand("rg . ~/foo.txt", ":r!echo")<cr>
nnoremap <cr> ^(lyi):call HandleLink()<cr>
inoremap jk <esc>l
nnoremap <leader>hi
        \ :echo synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")<CR>
nnoremap <leader>src :e ~/.vim/my-snippets/
nnoremap <leader>sos <c-^>:bdelete snippets<cr>
        \ :call UltiSnips#RefreshSnippets()<cr>
nnoremap <leader>vrc :e $MYVIMRC<cr>
nnoremap <leader>sov :w<cr><c-^>:bdelete .vimrc<cr>:source $MYVIMRC<cr>
" noremap <silent> Y 
"         \ "cy :redir! > /dev/clipboard \| silent echon @c \| redir END<cr>
noremap Y "*y
nnoremap <silent> <leader>gd yi)"d:!start "" "$(dirname '<c-r>d')"<cr>
" uses expression register:
nnoremap <silent> <leader>wtu
        \ "pyi)vi)c<c-r>=system('cygpath -u "<c-r>p"')<cr><esc>
nnoremap <silent> <leader>utw
        \ "pyi)vi)c<c-r>=system('cygpath -w "<c-r>p"')<cr><esc>
nnoremap <silent> <leader>ltr
        \ "pyi)vi)c<c-r>=system('local-to-remote "<c-r>p"')<cr><esc>
nnoremap <silent> <leader>rtl
        \ "pyi)vi)c<c-r>=system('remote-to-local "<c-r>p"')<cr><esc>
"}}}
" command abbreviations{{{
cnoreabbrev cdd lcd %:p:h
cnoreabbrev h tab h
"}}}
" filetypes{{{
" r{{{
augroup r " {
    autocmd!
    autocmd FileType r inoremap <buffer> < <-
    autocmd FileType r inoremap <buffer> << <
    autocmd FileType r nnoremap <buffer><leader>ri :!open-r-repl<cr>
    autocmd FileType r nnoremap <buffer><leader>ro :!tmux kill-pane -t {bottom-right}<cr>
    autocmd FileType r nnoremap <buffer><silent> K viw"ry:SlimeSend1 help(<c-r>r)<cr>
    autocmd FileType r nmap <buffer> , <Plug>SlimeLineSend/^[^#\$]<cr>
    autocmd FileType r xmap <buffer> , <Plug>SlimeRegionSend
    autocmd FileType r nmap <buffer> <leader>, <Plug>SlimeParagraphSend}j
augroup END " }
"}}}
" sh{{{
augroup sh " {
    autocmd!
    autocmd FileType sh setlocal noexpandtab
    autocmd FileType sh nnoremap <buffer><leader>ri :!open-sh-repl<cr>
    autocmd FileType sh nnoremap <buffer><leader>ro :!tmux kill-pane -t {bottom-right}<cr>
    autocmd FileType sh nmap <buffer> , <Plug>SlimeLineSend/^[^#\$]<cr>
    autocmd FileType sh xmap <buffer> , <Plug>SlimeRegionSend
    autocmd FileType sh nmap <buffer> <leader>, <Plug>SlimeParagraphSend}j
augroup END " }
"}}}
" py{{{
augroup python " {
    autocmd!
    autocmd FileType python nnoremap <buffer><leader>ri :!open-python-repl<cr>
    autocmd FileType python nnoremap <buffer><leader>ro :!tmux kill-pane -t {bottom-right}<cr>
    autocmd FileType python nmap <buffer> , <Plug>SlimeLineSend/^[^#\$]<cr>
    autocmd FileType python xmap <buffer> , <Plug>SlimeRegionSend
    autocmd FileType python nmap <buffer> <leader>, <Plug>SlimeParagraphSend}j
augroup END " }
"}}}
" markdown{{{
augroup markdown " {
    autocmd!
    autocmd FileType markdown set foldlevel=2 
    autocmd FileType markdown set formatoptions-=t
    autocmd FileType markdown set textwidth=0 
    autocmd FileType markdown set tabstop=2 
    autocmd FileType markdown set shiftwidth=2
    autocmd FileType markdown set nowrap
    autocmd FileType markdown set conceallevel=2
augroup END " }
"}}}
"}}}
" plugins{{{
" slime{{{
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{bottom-right}"}
let g:slime_dont_ask_default = 1
"}}}
" ultisnips{{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=[ "my-snippets", "Ultisnips" ]
"}}}
" vim markdown{{{
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_folding_disabled = 1
"}}}
"}}}
" colors{{{
" color names: black darkred darkgreen brown darkblue darkmagenta darkcyan gray
highlight Comment          ctermfg=gray     ctermbg=none   cterm=none
highlight Conceal     ctermfg=gray     ctermbg=none   cterm=none
highlight Constant         ctermfg=darkblue ctermbg=none   cterm=none
" highlight Cursor             
" highlight CursorColumn       
" highlight CursorIM           
" highlight CursorLine         
" highlight CursorLineNr       
highlight DiffAdd          ctermfg=green    ctermbg=none   cterm=none
highlight DiffChange       ctermfg=black    ctermbg=none   cterm=none
highlight DiffDelete       ctermfg=darkred  ctermbg=none   cterm=none
highlight DiffText         ctermfg=green    ctermbg=none   cterm=none
" highlight Directory          
highlight EndOfBuffer      ctermfg=gray     ctermbg=none   cterm=none
highlight Error            ctermfg=darkred  ctermbg=none   cterm=none
highlight ErrorMsg         ctermfg=darkred  ctermbg=none   cterm=none
" highlight FoldColumn         
highlight Folded           ctermfg=black     ctermbg=none  cterm=none
highlight Identifier       ctermfg=black    ctermbg=none   cterm=none
highlight Ignore           ctermfg=gray     ctermbg=none   cterm=none
highlight IncSearch        ctermfg=black    ctermbg=yellow cterm=none
highlight LineNr           ctermfg=gray     ctermbg=white  cterm=none
" highlight LineNrAbove        
" highlight LineNrBelow        
highlight MatchParen       ctermfg=black    ctermbg=yellow cterm=none
" highlight ModeMsg            
" highlight MoreMsg            
highlight NonText          ctermfg=gray     ctermbg=none   cterm=none
" highlight Normal             
highlight Pmenu            ctermfg=gray    ctermbg=white  cterm=none
highlight PmenuSbar        ctermfg=none     ctermbg=white  cterm=none
highlight PmenuSel         ctermfg=black    ctermbg=yellow cterm=none
highlight PmenuThumb       ctermfg=black    ctermbg=white  cterm=none
highlight PreProc          ctermfg=black    ctermbg=none   cterm=none
" highlight Question           
" highlight QuickFixLine       
highlight Search           ctermfg=black    ctermbg=yellow cterm=none
" highlight SignColumn         
highlight Special          ctermfg=green    ctermbg=none   cterm=none
highlight SpecialKey       ctermfg=gray     ctermbg=none   cterm=none
highlight SpellBad         ctermfg=darkred  ctermbg=none   cterm=none
highlight SpellCap         ctermfg=darkred  ctermbg=none   cterm=none
highlight SpellLocal         ctermfg=darkred  ctermbg=none   cterm=none
highlight SpellRare         ctermfg=darkred  ctermbg=none   cterm=none
highlight Statement        ctermfg=black    ctermbg=none   cterm=none
highlight StatusLine       ctermfg=gray     ctermbg=white  cterm=none
highlight StatusLineNC     ctermfg=white    ctermbg=white  cterm=none
highlight StatusLineTerm   ctermfg=gray     ctermbg=white  cterm=none
highlight StatusLineTermNC ctermfg=white    ctermbg=white  cterm=none
highlight TabLine          ctermfg=gray    ctermbg=white  cterm=none          
highlight TabLineFill      ctermfg=black    ctermbg=white  cterm=none          
highlight TabLineSel       ctermfg=black    ctermbg=none  cterm=none          
" highlight Terminal           
highlight Title            ctermfg=black    ctermbg=none   cterm=bold
highlight Type             ctermfg=black    ctermbg=none   cterm=none
highlight Underlined       ctermfg=black    ctermbg=none   cterm=underline
highlight VertSplit        ctermfg=white    ctermbg=white  cterm=none
highlight Visual           ctermfg=black    ctermbg=yellow cterm=none
highlight VisualNOS        ctermfg=black    ctermbg=yellow cterm=none
highlight WarningMsg       ctermfg=darkred  ctermbg=none   cterm=none
highlight WildMenu         ctermfg=black    ctermbg=yellow cterm=none
" highlight lCursor            
"}}}
