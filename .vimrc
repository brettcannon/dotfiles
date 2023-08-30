" To update runtime files run::
" :cd $VIMRUNTIME
" :!rsync -avzcP --delete --exclude="dos" --exclude="spell" ftp.nluug.nl::Vim/runtime/ .

" Turns off Vi-specific functionality
set nocompatible

" Set the default text encoding and force it for other file types
set encoding=utf-8
set fileencoding=utf-8

" Reload files when edited on the disk
set autoread

" backspacing over autoindent, over linebreaks, and over the start of insert
set backspace=indent,eol,start

" Incrementally show what currently matches the search string
set incsearch

" Show all matches; to temporarily turn off, use ``nohlsearch``.
set hlsearch

" Do not have searches wrap back around to the top (or bottom) of file
set nowrapscan

" Turns on line numbering, dynamically changing the allocated column space.
set number
set numberwidth=1

" Turn off inserting a comment chracter at the beginning of each newline
set formatoptions-=c
set formatoptions-=o
set formatoptions-=r

" Display cursor position
set ruler

" Display keys typed in so far for the current command
set sc

" Flash matching parantheses
set showmatch

" String to show for line wrapping
" Unneeded when numbers is set since wrapping can be told when line has no number for it
au BufRead,BufNewFile *.txt set showbreak=-->

" Make settings of listchars visible.
"set list

" Display possible completions of commands, files, etc. up to the longest
" common substring (default is to complete to the first match).
set wmnu
set wildmode=longest,list

" Turn on filetype detection, use indent files
filetype indent on

" Keep previous indent level for new lines
set ai

" Set folding to be based on indentation
set foldmethod=indent

" Initial fold level threshold; set high so as to have all folds initially
" expanded
set foldlevel=255

" Make indents only 4 spaces default
set shiftwidth=4
au BufRead,BufNewFile *.rst set shiftwidth=3

" Have tab insert based on shiftwidth.
set smarttab

" Autowrap files
set textwidth=79
au BufRead,BufNewFile *.txt set textwidth=70

" Replace tabs
set expandtab

" Have ``char1 <backspace> char2`` insert a digraph.
" Can always use Ctrl-K {char1}{char2} in Insert mode.
" (see ``:digraphs`` for list)
"set digraph

" Turn on Python syntax highlighting for all syntax types
let python_highlight_all=1

" Turn on syntax highlighting
syntax on

" Have HTML files be highlighted as Django templates by default.
au BufRead,BufNewFile *.html set filetype=htmldjango
" SCons files are Python
au BufRead,BufNewFile SConstruct,SConscript set filetype=python

" Turns on full syntax highlighting for busted terminals
" Without, only has normal, underlined, and blue
" Hack thanks to Bem's .vimrc
:if has("terminfo")
:  set t_Co=8
:  set t_Sf=[3%p1%dm
:  set t_Sb=[4%p1%dm
:else
:  set t_Co=8
:  set t_Sf=[3%dm
:  set t_Sb=[4%dm
:endif

" Turn spacebar into a non-recursive mapping for Ctrl-f when not in normal or
" visual mode
noremap <Space> <C-f>
