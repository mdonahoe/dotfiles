set nocompatible
filetype off                  " required!

let g:ycm_confirm_extra_conf = 0
let g:ycm_path_to_python_interpreter = '/home/matt/aircam/build/bin/mc_python'
let g:ycm_autoclose_preview_window_after_completion = 1
set completeopt=menu,menuone

filetype plugin indent on     " required!

set noswapfile
set cursorline              " have a line indicate the cursor location
set completeopt=menuone,longest,preview
syntax on


set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

" easy tabs
noremap ,f :tabn<CR>
noremap ,a :tabp<CR>
noremap ,t :tabnew<Space>

" use 'jj' to exit insert mode
inoremap jj <Esc>

" stop the fat finger { mistake
inoremap  <S-Down>     <NOP>

" disable all arrowkeys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>


" Make multiple windows easier
noremap ,, <C-W>w
" noremap ,v <C-W>v
" noremap ,c <C-W>c

noremap ,h :noh<CR>

let g:acp_completeoptPreview=1

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set nowrap

" Fix function/arrow keys in screen
set term=xterm-256color
set t_Co=256

" fewer metacharacters in regexes will require \s.  for more magic, use \v
set magic

colorscheme vividchalk

" Highlight columns over 100 characters and trailing whitespace
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9

noremap ,ll :match OverLength //<CR>
noremap ,l, :match OverLength /\%101v.\+\\|\s\+$/<CR>
match OverLength /\%101v.\+\|\s\+$/

" commands to turn on/off autoindenting
" noremap ,ii :set nocindent<CR>:set noautoindent<CR>
" noremap ,i, :set cindent<CR>:set autoindent<CR>

" show what's currently been entered
set showcmd

" don't wrap randomly
set textwidth=1000
set fo-=tc

" Do indenting
set autoindent
set nosmartindent
set nocindent

" Better searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" Keep at least 3 lines on top and bottom of screen around cursor
set scrolloff=3

" Allow buffers to be switched away from without saving
" set hidden

" Allow cursor movement to wrap across lines
set whichwrap=<,>,h,l,[,]

" Don't wrap text to the screen
set nowrap

noremap ,d :noh<CR>

" noremap ,e :tabf ~/.vimrc<CR>
" noremap ,s :source ~/.vimrc<CR>

" Better copy pasting (OSX ONLY)
nnoremap <F1> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
inoremap <F1> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>a
nnoremap <F2> :.w !pbcopy<CR><CR>
vnoremap <F2> :w !pbcopy<CR><CR>

" Fat finger saving
command WQ wq
command Wq wq
command W w
command Q q

" set working directory to current file
set autochdir

" right corner line num
set ruler

" This means you can hit backspace to delete over stuff. fuck
set backspace=indent,eol,start

" left shift to type
nnoremap ; :

" wtf is K? Who knows. It looks up the current word under cursor in man pages
nnoremap K <nop>

" quick way to add a line
nnoremap <CR> o<Esc>

" dont save the netrwhist file
autocmd VimLeave * if filereadable("~/.vim/.netrwhist")|call delete("~/.vim/.netrwhist")|endif

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

" ctags recursive (from http://stackoverflow.com/a/5019111/53997 )
set tags=tags;/

" youcompleteme jump to definition/declaration
nnoremap ,jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" yank selection to system clipboard (from http://stackoverflow.com/a/11489440/53997)
vnoremap <C-c> "*y
