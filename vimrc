set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'chriskempson/base16-vim'

call vundle#end()            " required
filetype plugin indent on    " required

set relativenumber

syntax enable

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
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

" nerdtreee configuration
" start nerdtree if vim is opened with no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" maps C-n to open nerdtree
map <C-f> :NERDTreeToggle<CR>
" close nerdtree if it's the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" turn on case insensitive feature
let g:EasyMotion_smartcase=1

" quit multiple cursor with C-c
let g:multi_cursor_quit_key='<C-c>'

" stop using arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

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
let g:ctrlp_map='<C-p>'

" ctrl-c to switch to normal mode
noremap <C-c> <Esc>

" tab with 4 spaces
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" switch buffers with tab
nnoremap  <silent>   <tab> :bnext<CR>
nnoremap  <silent> <s-tab> :bprevious<CR>

" scroll faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" navigate wrapped lines more intuitively
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

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

map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<cr>
