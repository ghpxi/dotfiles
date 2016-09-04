syntax on

set nu
set laststatus=2
set nobackup
set noswapfile
set relativenumber

set tabstop=4
set shiftwidth=4
set softtabstop=4

set nocompatible
filetype off

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'chriskempson/base16-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'joshdick/onedark.vim'

call plug#end()

filetype plugin indent on
filetype plugin on

colorscheme onedark

map <C-\> :NERDTreeToggle<CR>

let mapleader = ","
let g:Powerline_symbols = 'fancy'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
