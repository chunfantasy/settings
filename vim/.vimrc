" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Initialize plugin system
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi'

call plug#end()

" Encoding
set encoding=utf-8
scriptencoding utf-8

" Display
syntax on
set number " show line numbers
set relativenumber " show relative line numbers
set nowrap
set scrolloff=2 " cursor middle
set list
set listchars=space:·,tab:»·
" set listchars=space:·,tab:»·,eol:↴
set colorcolumn=80,100,120
set eol

" Editing
set backspace=indent,eol,start " Backspacing is allowed over everything in insert mode
set expandtab
set tabstop=2 " Tab size
set shiftwidth=2 " shift width
" set clipboard=unnamedplus " Use system clipboard by default

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" Key map
let mapleader = " "
let maplocalleader = " "
map <leader><space> :let @/=''<cr> " clear search
imap jj <Esc>

