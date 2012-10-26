call pathogen#infect()

set directory=~/.vimswap
set hidden
set nocompatible
set backspace=indent,eol,start
set autoindent
set history=500
set ruler
set modeline
set showcmd
set incsearch
syntax on
set hlsearch
set nu
set expandtab
set sw=4
set ts=4
set nobackup

" add git branch info via vim-fugitive to statusline
set statusline=%<%f\ %{fugitive#statusline()}\ %h%m%r%=%-14.(%l,%c%V%)\ %P 
" always show statusline
set laststatus=2

if has("gui_macvim")
    colorscheme kenichi
    set diffopt="vertical"
    set cursorline
    "set transp=5
    set guioptions-=T
    "set guifont=Anonymous\ Pro:h12
    set guifont=Anonymous\ Pro\ for\ Powerline:h14
    map <D-j> :bn<CR>
    map <D-k> :bp<CR>
    map <D-d> :noh<CR>
    map <D-N> :NERDTreeToggle<CR>
    let g:Powerline_symbols = 'fancy'
    set previewheight=25
end

filetype plugin indent on

set foldmethod=indent
set foldlevel=2
set foldnestmax=7
set antialias

map <F6> :Gstatus<CR>
map <F7> :Gdiff<CR>
map <F8> :Gcommit<CR>

let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
nmap <F5> :TagbarToggle<CR>

nmap j gj
nmap k gk
vmap j gj
vmap k gk

" take one keystroke out of the switch windows in that direction command
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

nmap - zr
nmap = zm

" my own specific settings for filetypes
augroup myfiletypes
   autocmd!
   autocmd FileType ruby,eruby,yaml,javascript,html set ai sw=2 sts=2 ts=2 et
   autocmd BufNewFile,BufRead *.erubis set ft=eruby
   autocmd BufNewFile,BufRead Thorfile set ft=ruby
   autocmd BufNewFile,BufRead Gemfile set ft=ruby
   autocmd BufNewFile,BufRead *.ru set ft=ruby
   autocmd BufNewFile,BufRead *.as set ft=actionscript
   autocmd BufNewFile,BufRead *.md set ft=markdown
   autocmd BufNewFile,BufRead *.m set ft=objc
   autocmd FileType objc set fdm=syntax fdl=0 sw=4 sts=4 ts=4
augroup END

augroup RUBY
  autocmd!
  autocmd BufNewFile,BufRead */spec/**/*.rb,*_spec.rb compiler rspec
  autocmd BufNewFile,BufRead */test/**/*.rb,*_test.rb compiler rubyunit
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  "autocmd FileType ruby,eruby set foldlevel=2 foldnestmax=3
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
augroup END

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

" ruby syntax issues
let ruby_space_errors = 1
let ruby_fold = 1
"let ruby_no_comment_fold = 1

" trims whitespace from beginning and end of lines
function FixWhitespace()
    execute ':%s/^\s\+$//'
    execute ':%s/\s\+$//'
endfunction
map <F9> :call FixWhitespace()<CR>

"let $XIKI_DIR = '/opt/ruby/current/lib/ruby/gems/1.9.1/gems/xiki-0.6.3'
"source $XIKI_DIR/etc/vim/xiki.vim
