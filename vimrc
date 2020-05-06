set backspace=indent,eol,start
set hlsearch incsearch cursorline
set nocompatible
set number relativenumber
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
set ttymouse=xterm2
set mouse=i
set showmatch ignorecase smartcase
set clipboard=unnamedplus
set spell spelllang=en_us
set autoindent
set expandtab
syntax on
filetype plugin indent on

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" Download vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" vim-plug options
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/peaksea', { 'as': 'peaksea' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

"autocmd VimEnter * silent! PlugInstall --sync | source ~/.vimrc

set background=dark
colorscheme peaksea

" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
noremap <F5> :set list!<CR>
inoremap jk <ESC>
