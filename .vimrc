" Show line numbers
set number

" Encoding
set encoding=utf-8

" Stay cursor in the middle
set scrolloff=10

" Tab size
set tabstop=4

" Share clipboard
set clipboard+=unnamed

" Paste without yanking it
vnoremap <leader>p "0dP

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

