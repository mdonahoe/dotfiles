" ---- General ----
syntax on
syntax enable

" This breaks the world for some reason.
" set termguicolors

" Don't wrap text to the screen
set nowrap
" Allow cursor movement to wrap across lines
set whichwrap=<,>,h,l,[,]

" Use 4 spaces instead of tabs
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" set working directory to current file
set autochdir

" Do indenting
set autoindent
set nosmartindent
set nocindent

" Better searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" show what's currently been entered
set showcmd

colorscheme vividchalk
set background=dark

set wildignore+=*.runlog
set wildignore+=build/*

" try to keep the edit line centered vertically on screen
set so=999

" ---- Plugins ----
"  Required, but I don't know what these do...
filetype off
filetype plugin indent on

autocmd FileType cpp setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 softtabstop=4

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')


" let Vundle manage Vundle (required)
Plug 'gmarik/Vundle.vim'

" My bundles here
Plug 'kien/ctrlp.vim'
let g:ctrlp_max_files = 25000
let g:ctrlp_custom_ignore = 'build\|DS_Store\|git'

Plug 'vim-scripts/a.vim'
Plug 'Valloric/YouCompleteMe'
let g:ycm_confirm_extra_conf = 0
let mc_python_path = '/home/skydio/aircam/build/host_aircam/bin/mc_python'
if filereadable(mc_python_path)
    let g:ycm_path_to_python_interpreter = mc_python_path
endif
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_server_keep_logfiles = 1
set completeopt=menu,menuone

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ctrlp#show_adjacent_modes = 1

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=0
hi IndentGuidesEven ctermbg=8

" Initialize plugin system
call plug#end()

" ---- Simple Key Bindings ----
let mapleader=","
" easy tabs
noremap <leader>f :tabn<CR>
noremap <leader>a :tabp<CR>
noremap <leader>t :tabnew<Space>

" use 'jj' to exit insert mode
inoremap jj <Esc>

" Fat finger saving
command WQ wq
command Wq wq
command W w
command Q q

" disable all arrowkeys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Clear search highlight
noremap <leader>d :noh<CR>

" quick way to add a line
nnoremap <CR> o<Esc>

" --- Plugin Key Bindings ---

" Bring up the NERDTree console or switch back to the main buffer
" map <leader><leader> :NERDTreeFocusToggle<CR>

" Close the console
" map <leader>n :NERDTreeTabsClose<CR>

" Search for files
map <leader>r :NERDTreeFind<CR>

" jump to definition
nnoremap <leader>jd :YcmCompleter GoTo<CR>


" ---- Status Line ----
" right corner line num
set ruler
" have a line indicate the cursor location
set cursorline

set clipboard=unnamed

