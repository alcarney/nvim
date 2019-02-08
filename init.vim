" ---------------------------------- init.vim --------------------------------
"
" Settings that apply everywhere

" ---------------------------------- Plugins ---------------------------------
"
call plug#begin('~/.local/share/nvim/plugged')

" Colors & Looks
Plug 'dylanaraps/wal.vim'
Plug 'itchyny/lightline.vim'

" Generic Editing
Plug 'machakann/vim-sandwich'

" Git
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_added = '→'
let g:gitgutter_sign_modified = '↔'
let g:gitgutter_sign_removed = '←'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

" Linting
Plug 'w0rp/ale'
let g:ale_sign_error = '!'
let g:ale_sign_warning = '•'
let g:ale_sign_column_always = 1

" -- Python
let g:black_virtualenv = '/home/alex/.virtualenvs/black'
Plug 'ambv/black', {'for': 'python'}

let g:vim_isort_map = ''
let g:vim_isort_python_version = 'python3'
Plug 'fisadev/vim-isort', {'for': 'python'}

call plug#end()


" ---------------------------------- Tabs and Spaces -------------------------
"
" expandtab:   Insert spaces when we use the <tab> key
" tabstop:     Tabs = N spaces
" softtabstop: Treat N spaces as a single tab character
" shiftwidth:  How many spaces do identation commands use?
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" ---------------------------------- Text Formatting -------------------------
"
set textwidth=79
set formatoptions="qrcoa"

" ---------------------------------- Appearance ------------------------------
"
" list:        Display non-printaable chars according to `listchars`
" title:       Set the window title to the file being edited
" nowrap:      Don't wrap long lines
" noshowmode:  Don't show the mode name at the bottom.
" laststatus:  When is the statusline shown?
" showtabline: When is the tabline shown?
" colorcolumn: Highlight column at textwidth + 1
" listchars:   See :h listchars
set list
set title
set nowrap
set noshowmode
set laststatus=2
set showtabline=0
set colorcolumn=+1
set listchars=tab:».,trail:·,extends:→,precedes:←

colorscheme wal

highlight StatusLine term=italic cterm=italic gui=italic
highlight StatusLineNC term=italic cterm=italic gui=italic
highlight Visual term=italic cterm=italic ctermbg=0
highlight ColorColumn ctermbg=0

" ---------------------------------- Key Maps --------------------------------
"
" mapleader:      Prefix key to use for <leader> mappings
" maplocalleader: Prefix key to use for <localleader> mappings
let mapleader = '\'
let maplocalleader = ' '

" -- File Management
" path:      Search downwards from the working directory
" <leader>f: Find file
set path=**
nnoremap <leader>f  :find<space>

" -- Buffer Management
" hidden:        Permit modified buffers to be sent to the background.
" <leader><tab>: Switch to most recent buffer
" <leader>b:     List open buffers and prepare a :b command. Quickfix windows
"                and other 'vim' buffers are excluded.
set hidden
nnoremap <leader><tab> :b#<cr>
nnoremap <leader>b     :filter! /\[/ ls<cr>:b<space>

" -- Window Management
" splitbelow: Open horizontal splits below
" splitright: Open vertical splits on the right
" <leader>p:  Move to previous window
" <c-l>:      Move to window right
" <c-k>:      Move to window above
" <c-j>:      Move to window below
" <c-h>:      Move to window left
set splitbelow
set splitright
nnoremap <leader>p <c-w>p

nnoremap <c-l>     <c-w><c-l>
nnoremap <c-k>     <c-w><c-k>
nnoremap <c-j>     <c-w><c-j>
nnoremap <c-h>     <c-w><c-h>

" -- Tab Management
" <leader>t: List tabs
nnoremap <leader>t  :tabs<cr>

" -- Terminal
" <esc>: Escape behaves as expected in terminal windows
tnoremap <esc> <c-\><c-n>

" -- Centered Movement
" All of these commands tweak the 'jumping about' commands so that they
" automatically place the cursor in the center of the screen.
nnoremap n nzz
nnoremap N Nzz
nnoremap G Gzz
nnoremap <c-i> <c-i>zz
nnoremap <c-o> <c-o>zz

" -- Searching
" ignorecase: Case insensitive searches
" smartcase:  Override ignorecase if pattern contains uppercase chars.
" incsearch:  Jump to matches mid search
" nohlsearch: Don't highlight matching search terms
" inccommand: Preview the results of :s/.../.../ commands is a new split
"             (neovim only)
set ignorecase
set smartcase
set incsearch
set nohlsearch
set inccommand=split

nnoremap <leader>#  :g/<c-r>//#<cr>
nnoremap <leader>/  :silent! lvimgrep /<c-r>//j %<cr>:lwindow<cr>

" -- Git
" <leader>g:  Open git status (requires vim-fugitive)
" <leader>s:  Stage the hunk under the cursor (requires vim-gitgutter)
" <leader>r:  Reset the hunk under the cursor (requires vim-gitgutter)
nnoremap <leader>g  :Gstatus<cr>
nnoremap <leader>s  :GitGutterStageHunk<cr>
nnoremap <leader>r  :GitGutterUndoHunk<cr>

" ]h:  Jump to the next hunk in the file
" [h:  Jump to the previous hunk in the file
nnoremap ]h  :GitGutterNextHunk<cr>
nnoremap [h  :GitGutterPrevHunk<cr>
" ---------------------------------- Auto Commands ---------------------------
"
" In order of appearance
"   - Trim trailing whitespace on save
augroup general
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END

" ----------------------------------- Python ---------------------------------
"
"  Settings to enable plugins that make use of python.
"
" g:python_host_prog:  Which interpreter to use for Python 2.x
" g:python3_host_prog: Which interpreter to use for Python 3.x
let g:python_host_prog = '/home/alex/.virtualenvs/nvim-py2/bin/python'
let g:python3_host_prog = '/home/alex/.virtualenvs/nvim_py3/bin/python3'

