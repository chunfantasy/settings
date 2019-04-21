" Show line numbers
set number

" Encoding
set encoding=utf-8

" Cursor middle
set scrolloff=10

" Tab size
set tabstop=4

" Backspacing is allowed over everything in insert mode
set backspace=indent,eol,start

" Paste without yanking it
vnoremap <leader>p "0dP

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

