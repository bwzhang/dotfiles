set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'chriskempson/base16-vim'        " colorscheme
Plugin 'godlygeek/tabular'              " align text
Plugin 'jiangmiao/auto-pairs'           " close brackets, quotes, etc.
Plugin 'junegunn/fzf'                   " fuzzy finder
Plugin 'kien/ctrlp.vim'                 " fuzzy finder
Plugin 'ntpeters/vim-better-whitespace' " remove trailing whitespace
Plugin 'scrooloose/nerdcommenter'       " quick commenting
Plugin 'scrooloose/nerdtree'            " visual file tree
Plugin 'scrooloose/syntastic'           " syntax highlighting
Plugin 'sjl/gundo.vim'                  " to revert edits
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

" Make <leader> easier to reach
let mapleader = "\<Space>"

set relativenumber

syntax enable

set background=dark
let &t_Co=256
let base16colorspace=256
colorscheme base16-default-dark

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

map <leader><leader> <C-6>

map <silent> <leader>f :NERDTreeToggle<CR>

" Map <leader>g to toggle gundo
map <silent> <leader>g :GundoToggle<CR>

" Stop using arrow keys
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>

" Disable gitgutter by default
let g:gitgutter_enabled = 0

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
