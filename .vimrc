syntax on
colo onedark
set mouse=a

" autoindenting "
set smarttab
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8
set autoindent
set cindent

" show line numbers "
set number relativenumber
set nu
set ruler
set numberwidth=4
set showcmd
set hlsearch
" show 80 char limit "
"set colorcolumn=80"
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%79v.\+/

" change where splits go "
set splitbelow
set splitright

" folding functions "
"set foldmethod=indent
"set foldlevel=1

" change ctrl+w j into ctrl+j "
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
