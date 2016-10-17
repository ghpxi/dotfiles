set nocompatible
filetype off

" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'jreybert/vimagit'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'easymotion/vim-easymotion'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'moll/vim-bbye'
Plug 'editorconfig/editorconfig-vim'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'chriskempson/base16-vim'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'justinmk/vim-syntax-extra'

Plug 'klen/python-mode'
Plug 'davidhalter/jedi-vim'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

call plug#end()
filetype on
filetype plugin on
filetype plugin indent on

syn on
au BufReadPost * if getfsize(bufname("%")) > 204800 | set syntax= | endif

set nu
set laststatus=2
set nobackup
set noswapfile
set nowrap
set relativenumber
set autoindent
set smartcase
set ignorecase
set incsearch
set showmatch
set hlsearch
set gdefault
set updatetime=250
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.
set clipboard+=unnamed
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set cursorline
set colorcolumn=121
set hidden
set showcmd
set splitright
set splitbelow

set background=light
colorscheme lucius

let mapleader = ","

cnoreabbrev Ack Ack!

nnoremap <F8> :TagbarToggle<CR>
nnoremap <C-\> :NERDTreeToggle<CR>
nnoremap <leader>] :bn<CR>
nnoremap <leader>[ :bp<CR>
nnoremap <leader>a :Ack!<Space>
nnoremap <leader>q :Bdelete<CR>
nnoremap <leader>s :SyntasticCheck<CR>
nnoremap <leader>c <plug>NERDCommenterToggle

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

let g:indent_guides_enable_on_vim_startup=1

let g:pymode_folding = 0
let g:pymode_run = 0
let g:pymode_doc = 0
let g:pymode_rope = 0
let g:pymode_lint = 0
let g:pymode_lint_on_fly = 0

let g:NERDTreeIgnore = ['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$', '\.swp$', '__pycache__']
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTreeDirArrows = 0

let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_no_startup_for_diff = 1
let g:nerdtree_tabs_smart_startup_focus = 2

let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': []
    \ }
