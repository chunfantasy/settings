" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Initialize plugin system
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi'
call plug#end()

" Display
syntax on
set number " show line numbers
set scrolloff=10 " cursor middle

" Editing
set backspace=indent,eol,start " Backspacing is allowed over everything in insert mode
set tabstop=2 " Tab size
set shiftwidth=2 " shift width
set clipboard=unnamedplus " Use system clipboard by default

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Encoding
set encoding=utf-8

