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
" better cursor movement
Plugin 'easymotion/vim-easymotion'
" status bar
Plugin 'bling/vim-airline'

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

" easymotion configuration
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
"
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

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

