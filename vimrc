execute pathogen#infect()

" Backspace kann nach links löschen
"set bs=2

" Keine Backups
"set nobackup
"set nowb
"set noswapfile

" Kein Wordwraping
"set wrap!

" Zeilennummern
"set number
"set wildmenu

" Syntax und Theme
set t_Co=256
colorscheme desert
"syntax on

" Tab und Einrücken
"set smartindent
"set smarttab
"set tabstop=4
"set shiftwidth=4
"set expandtab

"filetype on
"filetype plugin on
"filetype indent on

"let g:omni_sql_no_default_maps = 1

" Intuitives Backspacing
"set backspace=eol,start,indent
"set whichwrap+=<,>,h,l

" Suchen
"set ignorecase
"set smartcase
"set hlsearch    "Hightlight search
"set incsearch

"set showmatch   "Show matching bracets
"set mat=2

" Zeilen Offset beim Scrollen
"set scrolloff=3

" Leader Key
let mapleader = ","

" Setze xterm Titel
set title

nmap <silent> <leader>n :NERDTree<CR>

" Starte Python mit F5
autocmd FileType python map <F5> :w<CR>:!python "%"<CR>
