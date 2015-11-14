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

syntax enable
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
