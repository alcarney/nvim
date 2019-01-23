" ---------------------------------- init.vim --------------------------------
"
" Settings that apply everywhere

" ---------------------------------- Plugins ---------------------------------
"
call plug#begin('~/AppData/Local/nvim/plugged')

" Looks
Plug 'arcticicestudio/nord-vim'

" Editing
Plug 'machakann/vim-sandwich'

" Git
let g:gitgutter_sign_added = '→'
let g:gitgutter_sign_modified = '↔'
let g:gitgutter_sign_removed = '←'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'


" Linting
Plug 'ambv/black', {'for': 'python'}
let g:black_virtualenv = 'C:\Users\acarney\Documents\PythonEnvs\black'

Plug 'fisadev/vim-isort', {'for': 'python'}
let g:vim_isort_python_version = 'python3'

Plug 'w0rp/ale', {'for': 'python'}
let g:ale_sign_column_always = 1

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
set nowrap

" ---------------------------------- Appearance ------------------------------
"
" list:        Display non-printaable chars according to `listchars`
" title:       Set the window title to the file being edited
" noshowmode:  Don't show the mode name at the bottom.
" laststatus:  When is the statusline shown?
" showtabline: When is the tabline shown?
" colorcolumn: Highlight column at textwidth + 1
" listchars:   See :h listchars
set list
set title
set noshowmode
set laststatus=0
set showtabline=0
set colorcolumn=+1
set listchars=tab:».,trail:·,extends:→,precedes:←

"  colorscheme nord:  Nord colorscheme. (requires arcticicestudio/nord-vim)
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_uniform_status_lines = 1
colorscheme nord

highlight StatusLine term=italic cterm=italic gui=italic
highlight StatusLineNC term=italic cterm=italic gui=italic
highlight Visual term=italic cterm=italic ctermbg=0
highlight ColorColumn ctermbg=0

"" --------------------------------- UX --------------------------------------
"
" wildmode:    Set the behavior of command line completion. See :h wildmode
" wildignore:  Which files to exclude from the wildmenu
set wildmode=longest:full
set wildignore=*.swp,.git
set wildignore+=*.pyc,__pycache__


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
nnoremap <leader>e  :e %:h/
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
nnoremap <leader>p   <c-w>p

nnoremap <c-l>       <c-w><c-l>
nnoremap <c-k>       <c-w><c-k>
nnoremap <c-j>       <c-w><c-j>
nnoremap <c-h>       <c-w><c-h>

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

" <leader>#:  Show lines that match the previous pattern in a temporary window
" <leader>/:  List all lines that match the previous pattern in a location list
nnoremap <leader>#  :g/<c-r>//#<cr>
nnoremap <leader>/  :silent! lvimgrep /<c-r>//j %<cr>:lwindow<cr>

" -- Git (requires tpope/vim-fugitive)
nnoremap <leader>g  :Gstatus<cr>

" ---------------------------------- Auto Commands ---------------------------
"
" In order of appearance
"   - Trim trailing whitespace on save
augroup general
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END

" ---------------------------------- Python Provider -------------------------
let g:python_host_prog = 'C:\Users\acarney\Documents\PythonEnvs\neovim2\Scripts\python.exe'
let g:python3_host_prog = 'C:\Users\acarney\Documents\PythonEnvs\neovim\Scripts\python.exe'

" ---------------------------------- Functions -------------------------------
