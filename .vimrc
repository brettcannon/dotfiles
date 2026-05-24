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

" Display cursor position
set ruler

" Display keys typed in so far for the current command
set showcmd

" Flash matching parantheses
set showmatch

" String to show for line wrapping
" Unneeded when numbers is set since wrapping can be told when line has no number for it

" Display possible completions of commands, files, etc. up to the longest
" common substring (default is to complete to the first match).
set wildmenu
set wildmode=longest,list

" Turn on filetype detection, use indent files
filetype indent on

" Keep previous indent level for new lines
set autoindent

" Set folding to be based on indentation, start with all folds open
set foldmethod=indent
set nofoldenable

" Make indents only 4 spaces default
set shiftwidth=4

" Have tab insert based on shiftwidth.
set smarttab

" Autowrap files
set textwidth=79

" Replace tabs
set expandtab

" Turn off inserting a comment character at the beginning of each newline
augroup vimrc
  autocmd!
  autocmd BufRead,BufNewFile *.txt set showbreak=-->
  autocmd BufRead,BufNewFile *.txt set textwidth=70
  autocmd BufRead,BufNewFile *.rst set shiftwidth=3
  autocmd FileType * set formatoptions-=c formatoptions-=o formatoptions-=r
augroup END

" Turn on Python syntax highlighting for all syntax types
let python_highlight_all=1

" Turn on syntax highlighting
syntax on

" Turn spacebar into a non-recursive mapping for Ctrl-f when not in normal or
" visual mode
noremap <Space> <C-f>
