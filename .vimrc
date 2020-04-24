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
set splitbelow
set splitright
set tabstop=2
set wildignore=.git,.*.swp,node_modules,backup

syntax on

if has("gui_macvim")
    set noballooneval
    set bg=dark
    set cursorline
    set guioptions-=T
    set guifont=AnonymicePowerline:h14
    set transp=4

    colorscheme PaperColor
    hi Normal guifg=white guibg=black

    map <D-j> :bn<CR>
    map <D-k> :bp<CR>
    map <D-d> :noh<CR>
    map <D-N> :NERDTreeToggle<CR>

    let g:Powerline_symbols = 'fancy'

    " pulse cursorline on focus
    function! s:Pulse()
      setlocal nocursorline
      redraw
      sleep 100m

      setlocal cursorline
      redraw
      sleep 100m

      setlocal nocursorline
      redraw
      sleep 100m

      setlocal cursorline
      redraw
    endfunction
    autocmd FocusGained * call s:Pulse()
end

" replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" fugitive
map <F6> :Gstatus<CR>
map <F7> :Gdiff<CR>
map <F8> :Gcommit<CR>
" augroup GIT
" autocmd!
" " delete fugitive buffers as soon as you 'go away' from them
" autocmd BufReadPost fugitive://* set noswapfile bufhidden=delete
" augroup END

" bufkill
map <C-w><C-k> :BD<CR>

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
