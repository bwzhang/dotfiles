set nocompatible              " be iMproved, required
filetype off                  " required
set relativenumber            " relative instead of absolute line numbers

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
" change and delete surrounders
Plugin 'tpope/vim-surround'
" improving f and t commands
Plugin 'chrisbra/improvedft'

call vundle#end()            " required
filetype plugin indent on    " required

" Change cursor type for different modes
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

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

" stop using arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" show open buffers
let g:airline#extensions#tabline#enabled = 1

" CtrlP mapping
let g:ctrlp_map = '<c-p>'

" Ignore case for f and t
let g:ft_improved_ignorecase = 1

syntax enable
" Setting theme
set background=dark
colorscheme solarized

" ctrl-c to exit insert mode
noremap <C-c> <Esc>

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

