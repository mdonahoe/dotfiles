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

colorscheme OceanicNext
set background=dark

set wildignore+=*.runlog
set wildignore+=build/RelWithDebInfoWorkstation/bin/*

" ---- Plugins ----
"  Required, but I don't know what these do...
filetype off
filetype plugin indent on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle 'gmarik/Vundle.vim'

" My bundles here
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'airblade/vim-gitgutter'
Bundle 'nvie/vim-flake8'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/a.vim'
Bundle 'wakatime/vim-wakatime'
Bundle 'jistr/vim-nerdtree-tabs'

Bundle 'Valloric/YouCompleteMe'
let g:ycm_confirm_extra_conf = 0
let g:ycm_path_to_python_interpreter = '/home/matt/aircam/build/host_aircam/bin/mc_python'
let g:ycm_autoclose_preview_window_after_completion = 1
set completeopt=menu,menuone
" jump to definition/declaration
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ctrlp#show_adjacent_modes = 1


" ---- Key Bindings ----
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

" ---- Status Line ----
" right corner line num
set ruler
" have a line indicate the cursor location
set cursorline

map <leader><leader> :NERDTreeFocusToggle<CR>
map <leader>n :NERDTreeTabsClose<CR>
