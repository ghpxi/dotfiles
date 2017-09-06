set encoding=utf-8
set nocompatible
filetype off

" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" features
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
"Plug 'scrooloose/syntastic'
Plug 'ntpeters/vim-better-whitespace'
Plug 'moll/vim-bbye'
Plug 'neomake/neomake'

" git integration
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'chaoren/vim-wordmotion'
Plug 'editorconfig/editorconfig-vim'

" appearance
Plug 'chriskempson/base16-vim'
"Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'justinmk/vim-syntax-extra'

" languages support
Plug 'python-mode/python-mode'
Plug 'davidhalter/jedi-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'ekalinin/Dockerfile.vim'
Plug 'w0ng/vim-hybrid'

call plug#end()

filetype on
filetype plugin on
filetype plugin indent on

syn on
au BufReadPost * if getfsize(bufname("%")) > 204800 | set syntax= | endif

set number
set relativenumber
set laststatus=2
set nobackup
set noswapfile
set nowrap
set autoindent
set smartindent
set ignorecase
set smartcase
set incsearch
set nohlsearch
set showmatch
set gdefault
set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.
set clipboard+=unnamedplus
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
set foldmethod=indent
set foldlevel=99
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*.pyc
set background=dark
" set background=light

" https://github.com/w0ng/vim-hybrid
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
colorscheme hybrid
" colorscheme lucius

let mapleader = ","

nnoremap <C-\> :NERDTreeToggle<CR>
nnoremap <A-\> :NERDTreeFocus<CR>
nnoremap <leader>] :bn<CR>
nnoremap <leader>[ :bp<CR>
nnoremap <leader>a :Ack! -i --ignore-dir=migrations --ignore-dir=logs --ignore-dir=node_modules --python<Space>
nnoremap <leader>q :Bdelete<CR>
nnoremap <leader>s :lopen<CR>
nnoremap <leader>c <plug>NERDCommenterToggle
nnoremap <leader>h] <Plug>GitGutterNextHunk
nnoremap <leader>h[ <Plug>GitGutterPrevHunk
nnoremap <leader>hv <Plug>GitGutterPreviewHunk
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

cnoreabbrev Ack Ack!

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

let g:indent_guides_enable_on_vim_startup=1

let g:ctrlp_working_path_mode = 'ra'

let g:NERDTreeIgnore = [
    \ '\~$',
    \ '\.pyc$',
    \ '\.pyo$',
    \ '\.class$',
    \ '\.o$',
    \ '\.swp$',
    \ '__pycache__',
    \ ]
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

let g:wordmotion_mappings = {
    \ 'w' : '<M-w>',
    \ 'b' : '<M-b>',
    \ 'e' : '<M-e>',
    \ 'ge' : 'g<M-e>',
    \ 'aw' : 'a<M-w>',
    \ 'iw' : 'i<M-w>'
    \ }

let g:pymode_lint = 0
let g:pymode_rope = 0

let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

let g:jedi#popup_on_dot = 0
let g:jedi#completions_enabled = 1
"let g:jedi#show_call_signatures = ""

"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_check_on_open = 1
"
"let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_python_pylint_quiet_messages = {
"    \ "!level": "errors",
"    \}
"

let g:neomake_python_enabled_makers = ['pylint']
"let g:neomake_javascript_enabled_makers = ['eslint']
"
let g:neomake_warning_sign = {'text': '➤', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': 'ℹ', 'texthl': 'NeomakeMessageSign'}
let g:neomake_error_sign = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

autocmd FileType python setlocal completeopt-=preview
autocmd! BufReadPost,BufWritePost * Neomake
