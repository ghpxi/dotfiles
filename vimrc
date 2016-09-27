syntax on

set nu
set relativenumber
set laststatus=2
set updatetime=250
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.
set nobackup
set noswapfile
set nowrap

set tabstop=4
set shiftwidth=4
set softtabstop=4

set nocompatible
filetype off

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mileszs/ack.vim'
Plug 'jreybert/vimagit'
Plug 'moll/vim-bbye'

Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'

Plug 'klen/python-mode'

call plug#end()

filetype plugin indent on
filetype plugin on

set background=light
colorscheme lucius

let mapleader = ","

cnoreabbrev Ack Ack!

nnoremap <C-\> :NERDTreeToggle<CR>
nnoremap <Leader>] :bn<CR>
nnoremap <Leader>[ :bp<CR>
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>q :Bdelete<CR>

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

let g:pymode_doc = 1
let g:pymode_lint = 0
let g:pymode_folding = 0

let NERDTreeIgnore = ['\.pyc$']

let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'

let g:Powerline_symbols = 'fancy'
let g:airline#extensions#tabline#enabled = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 3
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['pylint', 'pep8']
