" where vim keeps swap files
set directory=~/.vimswap
" allow buffers with changes to be 'hidden' by another buffer in the same window
set hidden
" turn on features that break strict compatibility with vi
set nocompatible
" let backspace work on indents, end of lines, etc.
set backspace=indent,eol,start
" auto indenting
set autoindent
" command mode history
set history=500
" x,y coords on the status line
set ruler
" read vim settings from the bottom of files
set modeline
" see :help showcmd - shows what you've started to type in command mode on the status line
set showcmd
" search incrementally
set incsearch
" syntax highlight!
syntax on
" highlight searched terms
set hlsearch
" show line numbers
set nu
" change tabs to spaces
set expandtab
" shift width for indenting
set sw=4
" tab stop, how many spaces
set ts=4
" don't save backup files
set nobackup
" use exuberant ctags
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" add git branch info via vim-fugitive to statusline
set statusline=%<%f\ %{fugitive#statusline()}\ %h%m%r%=%-14.(%l,%c%V%)\ %P 

if has("gui_macvim")
    colorscheme kenichi
    " make my line numbers dark and stormy
    " hi linenr guifg=#444444 guibg=#111111
    " size of my macvim window
    set columns=205
    set lines=60
    " show me diffs vertically
    set diffopt="vertical"
    " hide that dumb toolbar
    set guioptions-=T
end

" i forget what this is for...
" if has("mac")
"   silent! set nomacatsui
" else
"   set lazyredraw
" end

" use ack as grep program... looking into ack.vim
" set grepprg=ack

" indent based on filetype
filetype plugin indent on

" i like folds; see :help folding
set foldmethod=indent
set foldlevel=1
set foldnestmax=4
"hi Folded guibg=black guifg=blue
"hi FoldColumn guibg=black guifg=grey

" i like monaco, but i'm open to trying new things.
set guifont=Monaco:h12
"set guifont="Andale Mono:h12"
" this should be obvious
set antialias
"hi normal guibg=Black guifg=White
"hi linenr guifg=DarkGrey guibg=black

" highlight the line my cursor is on
set cursorline
" set the cursorline bg to dark grey on gui, none on term
" hi cursorline term=none cterm=none guibg=grey15

" cmd-j == next buffer
map <D-j> :bn<CR>
" cmd-k == prev buffer
map <D-k> :bp<CR>
" cmdd- == take highlight off searched term
map <D-d> :noh<CR>
" cmd-r == set the filetype to ruby
map <D-r> :set ft=ruby<CR>
" cmd-e == open the FindFile dialog
"map <D-e> :FF<CR>
" cmd-shift-c == set the filetype to css
map <D-C> :set filetype=css<CR>
" cmd-shift-j == set the filetype to javascript
map <D-J> :set filetype=javascript<CR>
" cmd-shift-m == set the foldmethod to manual (defaults to indent, see above)
map <D-M> :set foldmethod=manual<CR>
" ctrl-n == open NERDTree drawer
map <D-N> :NERDTreeToggle<CR>
" F5 TlistToggle
map <F5>  :TlistToggle<CR>

" F6 == show me git status in a throw-away buffer
"map <F6> :enew<CR>:read !/opt/local/bin/git status<CR>:set buftype=nofile<CR>gg
" F6 == show me git diff in a throw-away buffer
"map <F7> :enew<CR>:read !/opt/local/bin/git diff<CR>:set syntax=diff buftype=nofile fdm=diff<CR>gg
" now that i have tpope's effing awesome vim-fugitive...
map <F6> :Gstatus<CR>
map <F7> :Gdiff<CR>
map <F8> :Gcommit<CR>

" comma-s == re-source ~/.vimrc
nmap ,s :source ~/.vimrc<CR>
" comma-v == edit ~/.vimrc in a new tab
nmap ,v :tabe ~/.vimrc<CR>

" by default, on wrapped lines, vim moves to the next whole line
" these mappings make it not behave that way, allowing you to 'move down'
" to a wrapped section of a line.
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" take one keystroke out of the switch windows in that direction command
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

" my own specific settings for filetypes
augroup myfiletypes
   autocmd!
   autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 ts=2 et
   autocmd FileType javascript set sw=2 sts=2 ts=2 et
   autocmd BufNewFile,BufRead *.erubis set ft=eruby
   autocmd BufNewFile,BufRead Thorfile set ft=ruby
   autocmd BufNewFile,BufRead Gemfile set ft=ruby
   autocmd BufNewFile,BufRead *.ru set ft=ruby
   autocmd BufNewFile,BufRead *.as set ft=actionscript
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

" allows one to :K ~/sr<tab complete paths><CR>
" this will cd to that dir, fire up NERDTree, and create the FindFile cache
function SetupNerdTreeAndFindFile(dir)
   let d = a:dir
   execute "cd " . d
   execute "FC ."
   execute "NERDTree"
endfunction
command! -n=? -complete=dir -bar K :call SetupNerdTreeAndFindFile('<args>')

" i use to think bzr was cool
"let VCSCommandBZRExec = "/usr/local/bin/bzr"

" ruby syntax issues
"let ruby_space_errors = 1
let ruby_fold = 1
"let ruby_no_comment_fold = 1

" trims whitespace from beginning and end of lines
function FixWhitespace()
    execute ':%s/^\s\+$//'
    execute ':%s/\s\+$//'
endfunction
" map <F8> :call FixWhitespace()<CR>

map <C-R><C-b> :!NOCOLOR=true bundle exec rake db:bootstrap<CR>
map <C-R><C-m> :!NOCOLOR=true bundle exec rake db:migrate<CR>
map <C-R><C-f> :!NOCOLOR=true bundle exec rake db:load_fixtures<CR>
map <C-R><C-p> :!NOCOLOR=true bundle exec rake db:load_phases<CR>
map <C-R><C-t> :!NOCOLOR=true bundle exec rake test:all<CR>
map <C-R><C-i> :!NOCOLOR=true script/console<CR>
