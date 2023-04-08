set nocompatible " required for Vundle.vim
filetype off " required for Vundle.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-sensible'
Plugin 'vim-syntastic/syntastic'
Plugin 'rust-lang/rust.vim'
Plugin 'ycm-core/YouCompleteMe' "See github page for installation instructions
call vundle#end()            " required
filetype plugin indent on    " required

"set number
set wildmenu

" Syntax und Theme
set t_Co=256
colorscheme desert
syntax on

set smartindent
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab

filetype on
filetype plugin on
filetype indent on

"let g:omni_sql_no_default_maps = 1

" Intuitives Backspacing
"set backspace=eol,start,indent
"set whichwrap+=<,>,h,l

"set ignorecase
"set smartcase
"set hlsearch    "Hightlight search
"set incsearch

set showmatch   "Show matching bracets
set mat=2

" Zeilen Offset beim Scrollen
"set scrolloff=3

" Enable mouse support
" Remark: This will "capture" the mouse in putty and prevent easy copy & paste
"         You can hold down Ctrl while clicking in putty to work around this
set mouse=a

" Detecting the feature set of the mouse/terminal seems to be broken
" so we force the support here (allows scroll and window resizing)
set ttymouse=xterm2 

" Leader Key
let mapleader = ","

" Setze xterm Titel
set title

" Key mappings
" C- for text manipulation (Ctr+)
" M- for movement in editor (Alt+)
" <leader>- for plugin an custom stuff

nmap <silent> <leader>n :NERDTree<CR>

"" Move between windows with Alt+<direction>
"nnoremap <M-Left> <C-W>j
"nnoremap <M-Up> <C-W>k
"nnoremap <M-Down> <C-W>l
"nnoremap <M-Right> <C-W>h

"nmap <silent> <A-Up> :wincmd k<CR>
"nmap <silent> <A-Down> :wincmd j<CR>
"nmap <silent> <A-Left> :wincmd h<CR>
"nmap <silent> <A-Right> :wincmd l<CR>

nnoremap <leader>b :ls<CR>:b<Space>

" Plugins
"" NERDTree

" Exit vim if NERDTree is the last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Automaticaly open NERDTree if vim is opened with a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
