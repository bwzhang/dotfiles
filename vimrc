set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" tab completion
Plugin 'ervandew/supertab'
" syntax checking
Plugin 'scrooloose/syntastic'
" color scheme
Plugin 'altercation/vim-colors-solarized'
" ctrlp to fuzzy find files
Plugin 'kien/ctrlp.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" Default Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

syntax enable
" Setting theme
set background=dark
colorscheme solarized
" ctrl-c to exit insert mode
noremap <C-c> <Esc>
" show line numbers
set number
" tab with 4 spaces
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
" Make searches case insensitive
set ignorecase
" Only highlight search as it's typed in
set nohlsearch
set incsearch
set autoindent
set ruler

