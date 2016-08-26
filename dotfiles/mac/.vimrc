set nocompatible
set number
set ruler
set hlsearch
set t_Co=256
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized
set mouse=a
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
set statusline+=%F
set pastetoggle=<F2>

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType make setlocal noexpandtab

if $_ == "/usr/local/bin/git"
    set colorcolumn=72
else
    set colorcolumn=120
endif

