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
filetype plugin on
filetype plugin indent on
syntax enable
set modelines=0
set encoding=utf-8
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

" Usability {
" Line numbering
set number
" Silence
set visualbell
set noerrorbells
" Status
set ruler
set laststatus=2
set cursorline
set showcmd
set showmode
" Ref : http://nvie.com/posts/how-i-boosted-my-vim/
" Aallow backspacing over everything in insert mode
set backspace=indent,eol,start 
set scrolloff=3

" Search
set incsearch     " show search matches as you type
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch      " highlighted
"nnoremap <leader><space> :noh<cr>

" Visual Reference
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor"

" Saving
set autowrite

" History
set history=1000

" disable cursor keys in normal mode
map <Left>  :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up>    :echo "no!"<cr>
map <Down>  :echo "no!"<cr>

" }

"" Formatting {

" Columns and Wrap
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

"" Hidden characters
""set list
"":map <C-u> :set list!<cr>
"set listchars=tab:>.,trail:.,extends:#,nbsp:.  " Highlight problematic whitespace
"                                
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

"}

" Tagbar {
nnoremap <leader>c :<C-u>TagbarToggle<CR>
"}

" vim-airline {
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
" }

" Customization / Override {
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
" }
