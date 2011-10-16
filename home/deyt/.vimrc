syntax enable                                           " подсветка синтаксиса
set nocp                                                " режим nocompatible
set ruler                                               " отображение координат курсора
set number                                              " нумерация строк
set guifont=Fixed\ 9                                    " дефолтный шрифт
set termencoding=utf-8                                  " дефолтная кодировка терминала utf8
set autoindent                                          " автоотступ

set title                                               " заголовок окна
set magic                                               
set encoding=utf-8                                      " utf8 в качестве кодировки по умолчанию
set fileencodings=utf-8,cp1251,koi8-r,cp866,latin1      " при открытии файлов перебирать кодировки из списка
set laststatus=2                                        
set wrap                                                " перенос строк
set linebreak                                           " перенос строк по словам
set scrolloff=5                                         
set guioptions=b

" количество пробелов
set tabstop=4                                           " для табуляции
set shiftwidth=4                                        " в коммандах отступа
set softtabstop=4                                       " добавляемых при нажатии <Tab>
set expandtab                                           " замена табуляции на пробелы

" поиск
set ignorecase                                          " игнорировать регистр
set incsearch                                           " поиск по мере набора текста
set showmatch                                           " подсвечивать все совпадения при поиске
set hlsearch                                            

set colorcolumn=100                                     " подсвечивать 100 символ каждой строки

set showtabline=2                                       " всегда показывать строку табов
set pastetoggle=<F2>                                    " вставляемый в документ текст не будет расползаться

noremap <F1> <ESC>                                       
nnoremap ; :                                             

set stl=[b%n]%m%r[%t][type:%Y]%=\ [%l/%L,%c][%p%%]      " строка статуса

colorscheme pablo                                       " цветовая схема

" NERDTree
let NERDTreeIgnore=['\.swp', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

" F3 - NERDTree
nmap <F3> :NERDTreeToggle<CR>
vmap <F3> <esc>:NERDTreeToggle<CR>
imap <F3> <esc>:NERDTreeToggle<CR>

" F5 - просмотр списка буферов
nmap <F5> <Esc>:BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>
imap <F5> <esc><esc>:BufExplorer<cr>

" F6 - предыдущий буфер
nmap <F6> :bp<cr>
vmap <F6> <esc>:bp<cr>i
imap <F6> <esc>:bp<cr>i

" F7 - следующий буфер
nmap <F7> :bn<cr>
vmap <F7> <esc>:bn<cr>i
imap <F7> <esc>:bn<cr>i

filetype plugin on
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

