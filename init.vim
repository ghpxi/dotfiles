set nocompatible
filetype off

" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'moll/vim-bbye'
Plug 'editorconfig/editorconfig-vim'

Plug 'chriskempson/base16-vim'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'justinmk/vim-syntax-extra'

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
set list
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

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*.pyc

set background=light
colorscheme lucius

let mapleader = ","

cnoreabbrev Ack Ack!

nnoremap <F8> :TagbarToggle<CR>
nnoremap <C-\> :NERDTreeToggle<CR>
nnoremap <A-\> :NERDTreeFocus<CR>
nnoremap <leader>] :bn<CR>
nnoremap <leader>[ :bp<CR>
nnoremap <leader>a :Ack! --ignore-dir=migrations --ignore-dir=logs --ignore-dir=node_modules --python<Space>
nnoremap <leader>q :Bdelete<CR>
nnoremap <leader>s :SyntasticCheck<CR>
nnoremap <leader>S :SyntasticReset<CR>
nnoremap <leader>c <plug>NERDCommenterToggle
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

let g:indent_guides_enable_on_vim_startup=1

let g:ctrlp_user_command = ['.git', 'cd %s and; git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 'ra'

let g:NERDTreeIgnore = ['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$', '\.swp$', '__pycache__']
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTreeDirArrows = 0

let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_no_startup_for_diff = 1
let g:nerdtree_tabs_smart_startup_focus = 2

let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_quiet_messages = {
    \ "!level": "errors",
    \}
