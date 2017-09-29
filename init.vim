set encoding=utf-8
set nocompatible
filetype off

" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

call plug#begin('~/.vim/plugged')

" features
Plug 'arielrossanigo/dir-configs-override.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'moll/vim-bbye'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tommcdo/vim-exchange'

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

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" appearance
Plug 'w0ng/vim-hybrid'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" languages support
Plug 'sheerun/vim-polyglot'
Plug 'python-mode/python-mode'
Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }
Plug 'davidhalter/jedi-vim'

call plug#end()

filetype on
filetype plugin on
filetype plugin indent on

syn on
au BufReadPost * if getfsize(bufname("%")) > 204800 | set syntax= | endif

set mouse=a
set number
set relativenumber
set laststatus=2
set scrolloff=3
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

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-\> :NERDTreeToggle<CR>
nnoremap <A-\> :NERDTreeFind<CR>
nnoremap <leader>] :bn<CR>
nnoremap <leader>[ :bp<CR>
nnoremap <leader>q :Bdelete<CR>
nnoremap <leader>s :lopen<CR>
nnoremap <leader>c <plug>NERDCommenterToggle
nnoremap <leader>h] <Plug>GitGutterNextHunk
nnoremap <leader>h[ <Plug>GitGutterPrevHunk
nnoremap <leader>hv <Plug>GitGutterPreviewHunk
nnoremap <leader>D :vsplit <CR>:call jedi#goto()<CR>
nnoremap <leader>a :Ag<space>
nnoremap <leader>e :Files<CR>
nnoremap <leader>c :Commands<CR>
nnoremap <leader>f :Lines<CR>
nnoremap <leader>F :BLines<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>T :BTags<CR>

let g:indent_guides_enable_on_vim_startup=1

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

let g:polyglot_disabled = ['python']

let g:pymode_lint = 0
let g:pymode_rope = 0
let g:pymode_doc = 0
let g:pymode_run = 0
let g:pymode_syntax_all = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1

let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

let g:jedi#popup_on_dot = 0
let g:jedi#completions_enabled = 0
"let g:jedi#show_call_signatures = ""

let g:neomake_python_enabled_makers = ['pylint']
"let g:neomake_javascript_enabled_makers = ['eslint']
"
let g:neomake_warning_sign = {'text': '➤', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': 'ℹ', 'texthl': 'NeomakeMessageSign'}
let g:neomake_error_sign = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

autocmd FileType python setlocal completeopt-=preview
autocmd! BufReadPost,BufWritePost *.py Neomake

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
