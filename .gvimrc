" macvim

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
