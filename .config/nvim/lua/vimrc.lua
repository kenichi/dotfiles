-- from https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/#2-attaching-neovim-to-rust-analyzer
-- seems unneeded
-- vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
-- vim.opt.shortmess = vim.opt.shortmess + { c = true }
-- vim.api.nvim_set_option('updatetime', 300)

vim.cmd([[
set autoindent
set backspace=indent,eol,start
set nobackup
set diffopt=vertical
set directory=~/.vimswap,.
set expandtab
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
set termguicolors

packadd! matchit

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

set bg=dark
set cursorline

colorscheme kanagawa
hi Normal guibg=none ctermbg=none
hi NonText guibg=none ctermbg=none

map <M-j> :bn<CR>
map <M-k> :bp<CR>
map <M-d> :noh<CR>

" quickfix
map <F3> :ccl<CR>

" filetypes
" autocmd FileType python setlocal fdm=indent fdn=2 fdl=0
" autocmd FileType elixir,json setlocal fdl=1 fdm=expr
" autocmd FileType yaml setlocal fdm=indent fdl=1
" autocmd FileType markdown setlocal textwidth=80
" autocmd FileType make setlocal fdm=indent fdl=0
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

" auto-comment only when wrapping or <CR>
autocmd FileType * setlocal formatoptions-=o

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

" close all buffers
map <C-w><C-a> :bufdo bwipeout<CR>

" ☯
function ToggleBg()
  if &background == "dark"
    set bg=light
  else
    set bg=dark
  endif
endfunction
map <C-o> :call ToggleBg()<CR>

" trims whitespace from beginning and end of line
function FixWhitespace()
    execute ':%s/^\s\+$//'
    execute ':%s/\s\+$//'
endfunction
map <F9> :call FixWhitespace()<CR>

" fugitive
function! ToggleGStatus()
    if buflisted(bufname('fugitive:///*/.git//'))
        execute ":bdelete" bufname('fugitive:///*/.git//')
    else
        Git
    endif
endfunction
nmap <F6> :call ToggleGStatus()<CR>
" map <F6> :Git<CR>
map <F7> :Gdiffsplit!<CR>
map <F8> :Git commit<CR>

map <leader>dv :DiffviewOpen<CR>
map <leader>dc :DiffviewClose<CR>

map <C-n> :NvimTreeFindFileToggle<CR>


" replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" copy filename and line number
function CopyFilenameAndLineNumber()
  execute ":!echo -n %:" . line(".") . " | pbcopy"
endfunction
map <leader>ct :call CopyFilenameAndLineNumber()<CR>

" Telescope file browser
nmap - :Telescope file_browser<CR>

" enew
nmap <M-n> :enew<CR>

" terraform
silent! autocmd! filetypedetect BufRead,BufNewFile *.tf
autocmd BufRead,BufNewFile *.hcl set filetype=hcl
autocmd BufRead,BufNewFile .terraformrc,terraform.rc,*.sp set filetype=hcl
autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform
autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json
let g:terraform_fmt_on_save=1
let g:terraform_align=1
nmap <Leader>ft :!tofu fmt %<CR>
autocmd FileType terraform setlocal commentstring=#\ %s

" dadbod
xmap <M-e> :%DB postgres://steampipe@127.0.0.1:9193/steampipe<CR>
autocmd FileType sql setlocal commentstring=--\ %s
]])
