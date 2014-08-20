" About {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
" cyanide global vimrc
" - inspired and derived from spf13
"
" author : sectorzero
" }

" Pathogen Plugin Management {

" Blacklist / Disable Plugins
let g:pathogen_disabled = []
" call add(g:pathogen_disabled, '<bundle_name>')

" Pathogen initialization of plugin bundles
runtime! autoload/pathogen.vim
silent! call pathogen#infect()
silent! call pathogen#helptags()

" }

" General Vim Environment {
set nocompatible

" Enable filetype plugin
filetype indent on
filetype plugin on
filetype plugin indent on

" syntax highlighting
syntax enable

" Explicitly set encoding to utf-8
set encoding=utf-8

" Allow changing buffer without saving first
set hidden

" Allow Mouse Usage
" set mouse=a
" Hide mouse when typing
" set mousehide

" Performance considerations for network
"set ttyfast
"set ttyscroll=0
set ttimeout
set ttimeoutlen=50

" Sets how many lines of history VIM has to remember
set history=1000

" Auto reload if file is saved externally.
set autoread
set autowrite

" Turn off cursor blinking
set guicursor=a:blinkon0

set ruler "Always show current position
set number

" Disable all bells
set noerrorbells
set novisualbell
set t_vb=

set showmatch " Show matching bracets when text indicator is over them
set matchtime=2

set virtualedit=onemore

set nomodeline
set modelines=0

set lazyredraw

" disable cursor keys in normal mode
map <Left>  :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up>    :echo "no!"<cr>
map <Down>  :echo "no!"<cr>
" }

" Appearence {
set background=dark

" Color {
" Solarized {
set background=dark
set t_Co=16
let g:solarized_termcolors=16
colorscheme solarized
" }
" 256 ColorScheme {
"set t_Co=256
"set t_AF=[3%p1%dm
"set t_AB=[4%p1%dm
"
"colorscheme xoria256
" }
" }
" }

" Interface {
set shortmess=Iat

" Blank vsplit separator
set fillchars+=vert:\ 

" Ask for confirmation for various things
set confirm

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10
" How many lines to scroll at a time, make scrolling appears faster
set scrolljump=5
set sidescrolloff=5

" Auto complete setting
set completeopt=longest,menuone
" Don't complete from other buffer
" set complete=.

" show list for autocomplete
set wildmenu
set wildmode=list:longest
set wildignorecase

set wildignore=*.o,*.pyc,*.hi
set wildignore+=.hg,.git,.svn,.gitignore         " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.dll,*.manifest       " compiled object files
set wildignore+=*.d                              " dependency files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX BS

set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.wav,*.mp3,*.ogg
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*.pdf

set wildignore+=*.exe,*.jar,*.class

" Files with these suffixes get a lower priority when matching a wildcard
set suffixes=.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Allow backspacing everything in insert mode
set backspace=indent,eol,start

" Searching
set nohlsearch " Don't Highlight search things
"nnoremap <leader><space> :noh<cr>
set ignorecase " Ignore case when searching
set smartcase  " If there are any capitalized letters, case sensitive search
set incsearch  " Make search act like search in modern browsers
set wrapscan   " Search wraps around the end of the file

if executable('ack')
    set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
    set grepformat=%f:%l:%c:%m
endif
if executable('ag')
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
endif

" Status
let &statusline="%{winnr('$')>1?'['.winnr().'/'.winnr('$')"
            \ . ".(winnr('#')==winnr()?'#':'').']':''}\ "
            \ . "%{(&previewwindow?'[preview] ':'').expand('%:t:.')}"
            \ . "\ %=%m%y%{'['.(&fenc!=''?&fenc:&enc).','.&ff.']'}"
            \ . "%{printf('  %4d/%d',line('.'),line('$'))}"
set laststatus=2
set cursorline
set showcmd
set showmode
" }

"" Formatting {

" Columns and Wrap
set wrap
set whichwrap+=h,l,<,>,[,]
set linebreak
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" Indenting
set autoindent                 	" indent at the same level of the previous line
set copyindent                  " copy the previous indentation on autoindenting
set expandtab 	  	     		" tabs are spaces, not tabs
set tabstop=4 					" an indentation every four columns
set shiftwidth=4                " number of spaces to use for autoindenting
set softtabstop=4 				" let backspace delete indent
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab                    " insert tabs on the start of a line according to
                                " shiftwidth, not tabstop
"set list
"set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣,trail:• ",eol:¬
"set showbreak=↪

" }

" Plugins {

" Unite {
let g:unite_split_rule = "botright"
let g:unite_winheight = 10

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Set up some custom ignores
call unite#custom#source('file_rec,file_rec/async,file_mru,file,buffer,grep',
            \ 'ignore_pattern', join([
            \ '\.git/',
            \ '\.cmake/',
            \ 'git5/.*/review/',
            \ 'google/obj/',
            \ 'CMakeLists.txt',
            \ 'build/',
            \ ], '\|'))

nnoremap <leader>f :<C-u>Unite  -buffer-name=files   -start-insert buffer file_rec/async:!<cr>

nnoremap <leader>b :<C-u>Unite buffer<CR>

let g:unite_source_history_yank_enable = 1
nnoremap <leader>p :<C-u>Unite history/yank<CR>

nnoremap <silent> <leader>s :<C-u>Unite -buffer-name=grep grep:.<CR>
nnoremap <silent> <leader>a :<C-u>UniteWithCursorWord grep:.<CR>

"if executable('ag')
"    let g:unite_source_grep_command='ag'
"    let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
"    let g:unite_source_grep_recursive_opt=''
"
"    " Set up ignores for ag when using file_rec/async
"    let g:unite_source_rec_async_command='ag --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" --ignore "build" --ignore ".cmake" --ignore "CMakeLists.txt" --hidden -g ""'
"endif

"}

" Tagbar {
nnoremap <leader>c :<C-u>TagbarToggle<CR>
"}

" vim-airline {
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline#extensions#whitespace#enabled = 0
" }

" Latex {
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" PDF format generation as default
let g:Tex_DefaultTargetFormat='pdf'
" }

" }

" Customization / Override {
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
" }
