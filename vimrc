set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'argtextobj.vim'
Plugin 'austintaylor/vim-indentobject'
Plugin 'chriskempson/base16-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'

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

" easymotion configuration
nmap s <Plug>(easymotion-s)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

" turn on case insensitive feature
let g:EasyMotion_smartcase=1

" nerdtreee configuration
" start nerdtree if vim is opened with no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" maps <leader>f to open nerdtree
map <silent> <leader>f :NERDTreeToggle<CR>
" close nerdtree if it's the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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

" use ctrl c instead of esc
imap <C-c> <esc>


" tab with 4 spaces
set smartindent
set expandtab

" switch buffers with tab
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" scroll faster
nnoremap <C-e> 6<C-e>
nnoremap <C-y> 6<C-y>

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
" taken from
" https://github.com/nicknisi/dotfiles/blob/master/config/nvim/init.vim
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

map <silent> <leader>h :call WinMove('h')<CR>
map <silent> <leader>j :call WinMove('j')<CR>
map <silent> <leader>k :call WinMove('k')<CR>
map <silent> <leader>l :call WinMove('l')<cr>

" strip trailing whitespace on save
autocmd BufWritePre * StripWhitespace

" leave insert mode quickly
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
