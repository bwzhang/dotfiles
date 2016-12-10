set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'argtextobj.vim'                 " text object for arguments
Plugin 'austintaylor/vim-indentobject'  " text object for indents
Plugin 'chriskempson/base16-vim'        " colorscheme
Plugin 'easymotion/vim-easymotion'      " convenient cursor motion
Plugin 'godlygeek/tabular'              " align text
Plugin 'jiangmiao/auto-pairs'           " close brackets, quotes, etc.
Plugin 'kien/ctrlp.vim'                 " fuzzy finder
Plugin 'mattn/gist-vim'                 " quickly make github gists
Plugin 'majutsushi/tagbar'              " browse ctags
Plugin 'ntpeters/vim-better-whitespace' " remove trailing whitespace
Plugin 'scrooloose/nerdcommenter'       " quick commenting
Plugin 'scrooloose/nerdtree'            " visual file tree
Plugin 'scrooloose/syntastic'           " syntax highlighting
Plugin 'sjl/gundo.vim'                  " to revert edits
Plugin 'terryma/vim-multiple-cursors'   " edit multiple locations
Plugin 'tpope/vim-fugitive'             " git plugin
Plugin 'tpope/vim-repeat'               " repeats plugin commands with .
Plugin 'tpope/vim-sleuth'               " detects tab size
Plugin 'tpope/vim-surround'             " easily change surrounding text
Plugin 'tpope/vim-vinegar'              " open files quickly
Plugin 'vim-airline/vim-airline'        " status line
Plugin 'vim-airline/vim-airline-themes' " theme for status line
Plugin 'airblade/vim-gitgutter'         " easily view changed lines
Plugin 'benmills/vimux'                 " run commands from tmux pane
Plugin 'Valloric/YouCompleteMe'         " code completion

call vundle#end()            " required
filetype plugin indent on    " required

" make <leader> easier to reach
let mapleader = "\<Space>"

set relativenumber

syntax enable

" xi syntax highlighting
au BufRead,BufNewFile *.xi set filetype=xi
au! Syntax xi source ~/.vim/syntax/xi.vim

set background=dark
let &t_Co=256
let base16colorspace=256
colorscheme base16-default

" change cursor type for different modes
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" don't unload buffers when I leave them
set hidden

" Make searches case insensitive
set ignorecase
" Only highlight search as it's typed in
set nohlsearch
set incsearch

" map <leader>g to toggle gundo
map <silent> <leader>g :GundoToggle<CR>

" quit multiple cursor with C-c
let g:multi_cursor_quit_key='<C-c>'

" stop using arrow keys
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>

" disable gitgutter by default
let g:gitgutter_enabled = 0

" show open buffers when only one tab is open
let g:airline#extensions#tabline#enabled=1
" powerline characters for status bar
" make sure to use Literation Mono Powerline on iTerm2
let g:airline_powerline_fonts=1
let g:airline_theme='base16_default'

" configure status line
set statusline=%<%f\    " Filename
set statusline+=%{fugitive#statusline()} "  Git branch
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
" always show status line
set laststatus=2

" CtrlP mapping
let g:ctrlp_map='<leader>p'
" CtrlPTag mapping
nnoremap <leader>t :CtrlPTag<CR>

" Tagbar mapping
nnoremap <silent> <leader>v :TagbarToggle<CR>

" use ctrl c instead of esc
imap <C-c> <esc>


set smartindent
set expandtab

" switch buffers with tab
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" scroll faster
nnoremap <C-e> 6<C-e>
nnoremap <C-y> 6<C-y>

" strip trailing whitespace on save
autocmd BufWritePre * StripWhitespace

" common command typos
:command WQ wq
:command Wq wq
:command W w
:command Q q
:command Bd bd
:command BD bd

" leave insert mode quickly
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

