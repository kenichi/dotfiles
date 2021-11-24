set antialias
set autoindent
set backspace=indent,eol,start
set nobackup
set nocompatible
set diffopt=vertical
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
map <F7> :Gdiffsplit!<CR>
map <F8> :Git commit<CR>

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" cli nerdtree
map <C-N> :NERDTreeToggle<CR>

" make ctrlp use CWD
let g:ctrlp_working_path_mode = 'a'
" make ctrlp ignore gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" filetypes
autocmd FileType python setlocal fdm=indent fdn=2 fdl=0
autocmd FileType json setlocal fdl=1
autocmd FileType yaml setlocal fdm=indent fdl=1
autocmd FileType markdown setlocal textwidth=80

" auto-comment only when wrapping or <CR>
autocmd FileType * setlocal formatoptions-=o

" ripgrep
nmap <Leader>* :Rg<CR>
let g:rg_command = 'rg --vimgrep -g "!tags"'

" tagbar
let g:tagbar_autoshowtag = 1
nmap <F5> :TagbarToggle<CR>
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'p:protocols',
        \ 'm:modules',
        \ 'e:exceptions',
        \ 'y:types',
        \ 'd:delegates',
        \ 'f:functions',
        \ 'c:callbacks',
        \ 'a:macros',
        \ 't:tests',
        \ 'i:implementations',
        \ 'o:operators',
        \ 'r:records'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 'p' : 'protocol',
        \ 'm' : 'module'
    \ },
    \ 'scope2kind' : {
        \ 'protocol' : 'p',
        \ 'module' : 'm'
    \ },
    \ 'sort' : 0
\ }

" :help buffers for more info on vim's windows and buffers
" delete buffer, keep window
function Kwbd(kwbdStage)
  if(a:kwbdStage == 1)
    let g:kwbdBufNum = bufnr("%")
    let g:kwbdWinNum = winnr()
    windo call Kwbd(2)
    execute "bd! " . g:kwbdBufNum
    execute "normal " . g:kwbdWinNum . ""
  else
    if(bufnr("%") == g:kwbdBufNum)
      let prevbufvar = bufnr("#")
      if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != g:kwbdBufNum)
        b #
      else
        bn
      endif
    endif
  endif
endfunction
map <C-w><C-k> :call Kwbd(1)<CR>

" trims whitespace from beginning and end of line
function FixWhitespace()
    execute ':%s/^\s\+$//'
    execute ':%s/\s\+$//'
endfunction
map <F9> :call FixWhitespace()<CR>

" the forces of both light and dark are inside all of us
function ToggleBg()
  if &background == "dark"
    set bg=light
  else
    set bg=dark
  endif
endfunction
map <D-F> :call ToggleBg()<CR>

" go to thin mode
map <D-J> :set co=155 lines=99<CR>

" go to wide mode
map <D-H> :set co=317 lines=99<CR>

" dash.vim
nmap <Leader>d :Dash<CR>

" netrw nonsense
let g:netrw_fastbrowse = 0

" close all buffers
map <C-w><C-a> :bufdo bwipeout<CR>

" ALE, elixir-ls
" Required, explicitly enable Elixir LS
let g:ale_linters = {'elixir': ['elixir-ls']}

" formatters/fixers
let g:ale_fixers = {'python': ['black']}

" Required, tell ALE where to find Elixir LS
let g:ale_elixir_elixir_ls_release = expand("/Users/kenichi/src/tool/elixir-ls/rel")

" Optional, you can disable Dialyzer with this setting
let g:ale_elixir_elixir_ls_config = {'elixirLS': {'dialyzerEnabled': v:true}}

" Optional, configure as-you-type completions
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1

" remap K
nnoremap K :ALEHover<CR>
