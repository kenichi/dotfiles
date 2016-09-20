"set runtimepath+=/Users/ken/src/lang/go/misc/vim
call pathogen#infect()

set directory=.,~/.vimswap
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
set number
set relativenumber
set expandtab
set sw=4
set ts=4
set nobackup
set wildignore=.git,.*.swp,node_modules,backup
set splitbelow
set splitright

" add git branch info via vim-fugitive to statusline
set statusline=%<%f\ %{fugitive#statusline()}\ %h%m%r%=%-14.(%l,%c%V%)\ %P 

" always show statusline
set laststatus=2

if has("gui_macvim")
    "colorscheme kenichi
    colorscheme PaperColor
    "colorscheme jellybeans
    set bg=dark
    hi Normal guifg=white guibg=black
    set cursorline
    "set transp=5
    set guioptions-=T
    "set guifont=Anonymous\ Pro:h12
    "set guifont=Anonymous\ Pro\ for\ Powerline:h14
    set guifont=Anonymice\ Powerline:h13
    map <D-j> :bn<CR>
    map <D-k> :bp<CR>
    map <D-d> :noh<CR>
    map <D-N> :NERDTreeToggle<CR>
    "let g:Powerline_symbols = 'fancy'
    set previewheight=25
    set noballooneval

    " pulse cursorline
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

filetype plugin indent on

set foldmethod=indent
set foldlevel=2
set foldnestmax=7
set antialias

map <F6> :Gstatus<CR>
map <F7> :Gdiff<CR>
map <F8> :Gcommit<CR>

let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_autoshowtag = 1
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

" folding mappings
" nmap - zr
" nmap = zm
" nmap _ zO

" ack
nmap <Leader>* :AgFromSearch<CR>
"let g:ackprg = 'ag --nogroup --nocolor --column'

" my own specific settings for filetypes
augroup myfiletypes
   autocmd!
   autocmd FileType ruby,eruby,yaml,javascript,html set ai sw=2 sts=2 ts=2 et
   " autocmd FileType javascript set sw=4 sts=4 ts=4
   autocmd BufNewFile,BufRead *.erb set ft=eruby
   autocmd BufNewFile,BufRead *.erubis set ft=eruby
   autocmd BufNewFile,BufRead Thorfile set ft=ruby
   autocmd BufNewFile,BufRead Gemfile set ft=ruby
   autocmd BufNewFile,BufRead *.ru set ft=ruby
   autocmd BufNewFile,BufRead *.as set ft=actionscript
   autocmd BufNewFile,BufRead *.md set ft=markdown ts=2 sw=2
   autocmd BufNewFile,BufRead *.m set ft=objc
   " autocmd FileType objc set fdm=syntax fdl=0 sw=4 sts=4 ts=4

   " delete fugitive buffers as soon as you 'go away' from them
   autocmd BufReadPost fugitive://* set bufhidden=delete

   " use '..' to navigate up when viewing trees or blobs
   autocmd User fugitive
     \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
     \   nnoremap <buffer> .. :edit %:h<CR> |
     \ endif

   " autogenerate tags
   " autocmd BufWritePost *.rb,*.c,*.cpp,*.h,*.m silent! !ctags -R &
   autocmd FileType changelog set et
augroup END



augroup RUBY
  autocmd!
  autocmd BufNewFile,BufRead */spec/**/*.rb,*_spec.rb compiler rspec
  autocmd BufNewFile,BufRead */test/**/*.rb,*_test.rb compiler rubyunit
  autocmd FileType html,eruby set fdm=indent
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  " autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
augroup END

" ruby syntax issues
let ruby_space_errors = 1
let ruby_fold = 1
"let ruby_no_comment_fold = 1



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

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" trims whitespace from beginning and end of lines
function FixWhitespace()
    execute ':%s/^\s\+$//'
    execute ':%s/\s\+$//'
endfunction
map <F9> :call FixWhitespace()<CR>

"let $XIKI_DIR = '/opt/ruby/current/lib/ruby/gems/1.9.1/gems/xiki-0.6.3'
"source $XIKI_DIR/etc/vim/xiki.vim

" switch colorschemes easier
function ToggleColor()
  if g:colors_name == "solarized"
    colorscheme kenichi
  else
    colorscheme solarized
  endif
endfunction
map <D-C> :call ToggleColor()<CR>

function ToggleBg()
  if &background == "dark"
    set bg=light
  else
    set bg=dark
  endif
endfunction
map <D-F> :call ToggleBg()<CR>

" go to thin, "no vsplit", mode
map <D-J> :set co=150 lines=99<CR>

" go to thunderboldt "full screen"
map <D-H> :set co=317 lines=99<CR>

" dash integration
nmap <silent> <leader>d <Plug>DashSearch

" replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

let g:airline_powerline_fonts = 1

" disable autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set diffopt="vertical"

" gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" ignore ./node_modules
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|dist)$'

" make ctrlp use CWD
let g:ctrlp_working_path_mode = 'a'

" restart puma
map <F10> :!curl http://127.0.0.1:65530/restart?token=foo<CR>
