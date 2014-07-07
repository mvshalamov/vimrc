set nocompatible
let mapleader = ","
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" тут будем добавлять наши расширения

filetype plugin indent on

" тут пойдут наши собственные настройки vim
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-git'
Bundle 'ervandew/supertab'
Bundle 'wincent/Command-T'
Bundle 'mitechie/pyflakes-pathogen'
Bundle 'mileszs/ack.vim'
Bundle 'sjl/gundo.vim'
Bundle 'fs111/pydoc.vim'
Bundle 'reinh/vim-makegreen'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/pep8'

autocmd vimenter * NERDTree
set guifont=Menlo\ Regular\ for\ Powerline:h12
let g:Powerline_symbols = 'fancy'
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
syntax on                           " syntax highlighing
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:pyflakes_use_quickfix = 0
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
nmap <leader>a <Esc>:Ack!
map <leader>n :NERDTreeToggle<CR>
map <leader>g :GundoToggle<CR>
let g:pep8_map='<leader>8'
colorscheme desert
map <F5> :w\|!python %<cr>
imap <F5> <Esc><F5>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Mm <CR>
endfunction
