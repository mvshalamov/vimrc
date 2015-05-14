set shell=/bin/bash
set nocompatible              " be iMproved, required
set clipboard=unnamed
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

Plugin 'gmarik/Vundle.vim'

" interface
Plugin 'bling/vim-airline'
Plugin 'notpratheek/vim-luna'
Plugin 'airblade/vim-gitgutter' " подсчвечивает изменения в файле

" navigation
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'

" search
Plugin 'vim-scripts/grep.vim'

" History
Plugin 'chrisbra/histwin.vim'

"snippets
Plugin 'Shougo/neocomplcache'

" --- Python ---
Plugin 'nvie/vim-flake8'

" code
Plugin 'scrooloose/syntastic'

"javascript
Plugin 'pangloss/vim-javascript'

"html
Plugin 'othree/html5.vim'

" go
Plugin 'fatih/vim-go'


" search
" Plugin 'Shougo/vimproc.vim', {
"        \ 'build' : {
"        \     'windows' : 'tools\\update-dll-mingw',
"        \     'cygwin' : 'make -f make_cygwin.mak',
"        \     'mac' : 'make -f make_mac.mak',
"        \     'unix' : 'make -f make_unix.mak',
"        \    },
"        \ }
" Plugin 'Shougo/unite.vim'

" " let Vundle manage Vundle, required
call vundle#end()            " required
filetype plugin indent on    " requir
"Вырубаем режим совместимости с VI:
set nocompatible

"Включаем распознавание типов файлов и типо-специфичные плагины:
filetype on
filetype plugin on

" запоминает место где файл редактировался в последний раз
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal g'\"" | endif
endif

fun! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

fun! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

" без него airline не подключится
set laststatus=2
"Настройки табов для Python, согласно рекоммендациям
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab "Ставим табы пробелами
set softtabstop=4 "4 пробела в табе
"Подсвечиваем все что можно подсвечивать
let python_highlight_all = 1
"Включаем 256 цветов в терминале, мы ведь работаем из иксов?
"Нужно во многих терминалах, например в gnome-terminal
set t_Co=256
syntax on
set mouse=a


let mapleader = ","

" hotkeys
nmap <F1> :set paste<CR>
nmap <F3> :set foldmethod=indent<CR>
map <C-n> :NERDTreeToggle<CR>

"interface
let g:airline_theme = "luna"

"snippets
let g:neocomplcache_enable_at_startup = 1

"syntactic
let g:syntastic_check_on_open = 1
let g:syntastic_python_checkers = ['python',]

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"switch splits
map <Leader>w <C-w>w

"save file with sudo
command! W exec 'w !sudo tee % > /dev/null' | e!

"create a new window
nmap <Leader><left>  :leftabove  vnew<CR>
nmap <Leader><right> :rightbelow vnew<CR>
nmap <Leader><up>    :leftabove  new<CR>
nmap <Leader><down>  :rightbelow new<CR>

" tagbar
nmap <F8> :TagbarToggle<CR>
