set antialias
set autoindent
set backspace=indent,eol,start
set nobackup
set nocompatible
set directory=~/.vimswap,.
set expandtab
set foldlevel=2
set foldmethod=syntax
set foldnestmax=7
set hidden
set history=500
set hlsearch
set incsearch
set modeline
set number
set relativenumber
set ruler
set showcmd
set shiftwidth=2
set smartindent
set splitbelow
set splitright
set tabstop=2
set wildignore=.git,.*.swp,node_modules,backup

filetype plugin indent on
syntax on
color jellybeans
hi Normal guibg=NONE ctermbg=NONE

" navigate wraps
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" navigate windows
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'

" replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" fugitive
map <F6> :Gstatus<CR>
map <F7> :Gdiffsplit<CR>
map <F8> :Gcommit<CR>

" bufkill
map <C-w><C-k> :BD<CR>

" tagbar
let g:tagbar_autoshowtag = 1
nmap <F5> :TagbarToggle<CR>

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" cli nerdtree
map <C-N> :NERDTreeToggle<CR>

" make ctrlp use CWD
let g:ctrlp_working_path_mode = 'a'

" filetypes
autocmd FileType python setlocal fdm=indent fdn=2 fdl=0
autocmd FileType json setlocal fdl=1
