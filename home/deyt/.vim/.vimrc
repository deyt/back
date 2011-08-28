syntax enable
set nocp " Переходим в режим nocompatible
set ruler
set number
set guifont=Fixed\ 9
set termencoding=utf-8
set autoindent
colorscheme slate
set title
set magic
set encoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r,cp866
set laststatus=2
set wrap
set linebreak
set showmatch
set scrolloff=5
"set guioptions=aegitp
set guioptions=b

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"set undofile
set ignorecase
set incsearch
set showmatch
set hlsearch
set colorcolumn=85

set showtabline=2

set pastetoggle=<F2>
noremap <F1> <ESC>
nnoremap ; :

map <silent> <M-j> :tabprev <CR>
map <silent> <M-k> :tabnext <CR>
map <silent> <M-e> :tabedit 
map <silent> mm :set guioptions+=mT <CR>
map <silent> MM :set guioptions-=mT <CR>

set stl=[b%n]%m%r[%t][type:%Y]%=\ [%l/%L,%c][%p%%]
