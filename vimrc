set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'chriskempson/base16-vim'        " colorscheme
Plug 'godlygeek/tabular'              " align text
Plug 'jiangmiao/auto-pairs'           " close brackets, quotes, etc.
Plug 'junegunn/fzf'                   " fuzzy finder
Plug 'kien/ctrlp.vim'                 " fuzzy finder
Plug 'ntpeters/vim-better-whitespace' " remove trailing whitespace
Plug 'scrooloose/nerdcommenter'       " quick commenting
Plug 'scrooloose/nerdtree'            " visual file tree
Plug 'scrooloose/syntastic'           " syntax highlighting
Plug 'sjl/gundo.vim'                  " to revert edits
Plug 'tpope/vim-fugitive'             " git plugin
Plug 'tpope/vim-repeat'               " repeats plugin commands with .
Plug 'tpope/vim-sleuth'               " detects tab size
Plug 'tpope/vim-surround'             " easily change surrounding text
Plug 'tpope/vim-vinegar'              " open files quickly
Plug 'vim-airline/vim-airline'        " status line
Plug 'vim-airline/vim-airline-themes' " theme for status line
Plug 'benmills/vimux'                 " run commands from tmux pane
Plug 'Valloric/YouCompleteMe'         " code completion

call plug#end()

set background=dark
let &t_Co=256
let base16colorspace=256
colorscheme base16-default-dark

let mapleader = "\<Space>"

set relativenumber

syntax enable

" Change cursor type for different modes
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Don't unload buffers when I leave them
set hidden

" Search settings
set ignorecase
set nohlsearch
set incsearch

map <silent> <leader>f :NERDTreeToggle<CR>
map <silent> <leader>g :GundoToggle<CR>

" Show open buffers when only one tab is open
let g:airline#extensions#tabline#enabled=1
" Powerline characters for status bar (currently disabled)
" Make sure to use Literation Mono Powerline on iTerm2 if you want arrows to
" display properly
let g:airline_powerline_fonts=0
let g:airline_theme='base16_default'
let g:airline_left_sep=''
let g:airline_right_sep=''

" Configure status line
set statusline=%<%f\                     " Filename
set statusline+=%{fugitive#statusline()} " Git branch
set statusline+=%*
let g:syntastic_enable_signs=1
set laststatus=2

" Use ctrl c instead of esc
imap <C-c> <esc>

" Default tab sizes (may be changed by vim sleuth)
set smartindent
set expandtab
set shiftwidth=4

" Move between files with <tab>
function Next()
    if tabpagenr('$') > 1
        tabnext
    else
        bnext
    endif
endfunction
function Prev()
    if tabpagenr('$') > 1
        tabprevious
    else
        bprevious
    endif
endfunction
nnoremap  <silent>   <tab> :call Next()<CR>
nnoremap  <silent> <S-tab> :call Prev()<CR>

" Scroll faster
nnoremap <C-e> 6<C-e>
nnoremap <C-y> 6<C-y>

" Strip trailing whitespace on save
autocmd BufWritePre * StripWhitespace

" Common command typos
:command WQ wq
:command Wq wq
:command W w
:command Q q
:command Bd bd
:command BD bd

" Stop using arrow keys
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>
