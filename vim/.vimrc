" Display
syntax on
set number " Show line numbers
set scrolloff=10 " Cursor middle

" Editing
set backspace=indent,eol,start " Backspacing is allowed over everything in insert mode
set tabstop=4 " Tab size

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Encoding
set encoding=utf-8
