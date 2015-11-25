set nocompatible
filetype off                  " required!

let g:ycm_confirm_extra_conf = 0
let g:ycm_path_to_python_interpreter = '/home/matt/aircam/build/bin/mc_python'
let g:ycm_autoclose_preview_window_after_completion = 1
set completeopt=menu,menuone

filetype plugin indent on     " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/Vundle.vim'

" My bundles here:
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Valloric/YouCompleteMe'
Bundle 'nvie/vim-flake8'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/a.vim'

let python_highlight_all=1

let g:ycm_confirm_extra_conf = 0
set completeopt=menu,menuone
"
" original repos on GitHub
" non-GitHub repos
" Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

" The rest is my file as normal!

set noswapfile
set cursorline              " have a line indicate the cursor location
set completeopt=menuone,longest,preview
syntax on


set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

let mapleader=","
" easy tabs
noremap <leader>f :tabn<CR>
noremap <leader>a :tabp<CR>
noremap <leader>t :tabnew<Space>

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
noremap <leader><leader> <C-W>w

noremap <leader>h :noh<CR>

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

noremap <leader>ll :match OverLength //<CR>
noremap <leader>l<leader> :match OverLength /\%101v.\+\\|\s\+$/<CR>
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

noremap <leader>d :noh<CR>

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
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" yank selection to system clipboard (from http://stackoverflow.com/a/11489440/53997)
vnoremap <C-c> "*y

" FROM GOOGLE STYLE
"
" Show line numbers.
set number

" Turn on syntax highlighting.
syntax on

" Detect if the current file type is a C-like language.
autocmd FileType c,cc,cpp,objc,*.mm call SetupForCLang()

" Configuration for C-like languages.
function! SetupForCLang()
    " Use 2 spaces for indentation.
    setlocal shiftwidth=2
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal expandtab

    " Configure auto-indentation formatting.
    setlocal cindent
    setlocal cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4
    setlocal indentexpr=GoogleCppIndent()
    let b:undo_indent = "setl sw< ts< sts< et< tw< wrap< cin< cino< inde<"

    " Uncomment these lines to map F5 to the CEF style checker. Change the path to match your system.
    " map! <F5> <Esc>:!python ~/code/chromium/src/cef/tools/check_style.py %:p 2> lint.out<CR>:cfile lint.out<CR>:silent !rm lint.out<CR>:redraw!<CR>:cc<CR>
    " map  <F5> <Esc>:!python ~/code/chromium/src/cef/tools/check_style.py %:p 2> lint.out<CR>:cfile lint.out<CR>:silent !rm lint.out<CR>:redraw!<CR>:cc<CR>
endfunction

" From https://github.com/vim-scripts/google.vim/blob/master/indent/google.vim
function! GoogleCppIndent()
    let l:cline_num = line('.')

    let l:orig_indent = cindent(l:cline_num)

    if l:orig_indent == 0 | return 0 | endif

    let l:pline_num = prevnonblank(l:cline_num - 1)
    let l:pline = getline(l:pline_num)
    if l:pline =~# '^\s*template' | return l:pline_indent | endif

    " TODO: I don't know to correct it:
    " namespace test {
    " void
    " ....<-- invalid cindent pos
    "
    " void test() {
    " }
    "
    " void
    " <-- cindent pos
    if l:orig_indent != &shiftwidth | return l:orig_indent | endif

    let l:in_comment = 0
    let l:pline_num = prevnonblank(l:cline_num - 1)
    while l:pline_num > -1
        let l:pline = getline(l:pline_num)
        let l:pline_indent = indent(l:pline_num)

        if l:in_comment == 0 && l:pline =~ '^.\{-}\(/\*.\{-}\)\@<!\*/'
            let l:in_comment = 1
        elseif l:in_comment == 1
            if l:pline =~ '/\*\(.\{-}\*/\)\@!'
                let l:in_comment = 0
            endif
        elseif l:pline_indent == 0
            if l:pline !~# '\(#define\)\|\(^\s*//\)\|\(^\s*{\)'
                if l:pline =~# '^\s*namespace.*'
                    return 0
                else
                    return l:orig_indent
                endif
            elseif l:pline =~# '\\$'
                return l:orig_indent
            endif
        else
            return l:orig_indent
        endif

        let l:pline_num = prevnonblank(l:pline_num - 1)
    endwhile

    return l:orig_indent
endfunction

map <C-n> :NERDTreeToggle<CR>

set wildignore+=*.runlog
set wildignore+=build/RelWithDebInfoWorkstation/bin/*
