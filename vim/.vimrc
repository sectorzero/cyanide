" About {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
" sanide global vimrc
" - inspired and derived from spf13
"
" author : sectorzero
" }

" General Vim Environment {

" Settings {
set nocompatible
set background=dark
filetype plugin on
filetype plugin indent on
syntax enable
set novisualbell
set noerrorbells
" }

" Pathogen {
" Ensure that the ~/.vim/bundle/ system works
runtime! autoload/pathogen.vim
silent! call pathogen#helptags()
silent! call pathogen#runtime_append_all_bundles()
" }

" }

" Appearence {

" General {
set number

if has('cmdline_info')
	set ruler                  	" show the ruler
	set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
	set showcmd                	" show partial commands in status line and
								" selected characters/lines in visual mode
endif

if has('statusline')
    set laststatus=2

	" Broken down into easily includeable segments
	set statusline=%<%f\    " Filename
	set statusline+=%w%h%m%r " Options
	set statusline+=%{fugitive#statusline()} "  Git Hotness
	set statusline+=\ [%{&ff}/%Y]            " filetype
	set statusline+=\ [%{getcwd()}]          " current dir
	"set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
	set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif
"}

" Color {

" Solarized {
"set background=dark
"set t_Co=16
"let g:solarized_termcolors=16
"colorscheme solarized
" }

" 256 ColorScheme {
set t_Co=256
set t_AF=[3%p1%dm
set t_AB=[4%p1%dm

colorscheme xoria256
" }

" }

" }

" Usability {
set incsearch
set ignorecase
set smartcase
set iskeyword+=_

set autowrite

set pastetoggle=<C-p>
":map <C-u> :set list!<cr>

set history=1000
" }

" Formatting {
"set list
set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

" set nowrap                     	" wrap long lines
set autoindent                 	" indent at the same level of the previous line

set shiftwidth=4               	" use indents of 4 spaces
set expandtab 	  	     		" tabs are spaces, not tabs
set tabstop=4 					" an indentation every four columns
set softtabstop=4 				" let backspace delete indent
" }

" Plugins {

" SuperTab {
" supertab + eclim == java win
let g:SuperTabDefaultCompletionType="<C-x><C-u>"
let g:SuperTabDefaultCompletionTypeDiscovery = [
\ "&completefunc:<C-x><C-u>",
\ "&omnifunc:<C-x><C-o>",
\ ]
let g:SuperTabLongestHighlight = 1
inoremap <C-space> <C-x><C-o>
" }

" NERDTree {
nmap <silent> <Leader>t :NERDTreeToggle<CR>
" }

" TagList {
let g:Tlist_Show_One_File=1
let g:Tlist_Use_Right_Window=1
let g:Tlist_WinWidth=40
let g:Tlist_GainFocus_On_ToggleOpen=1
nmap <silent> <Leader>c :TlistToggle<cr>
" }

" Wikipedia {
autocmd BufRead,BufNewFile *.wiki            setfiletype Wikipedia
autocmd BufRead,BufNewFile *.wikipedia.org*  setfiletype Wikipedia
" }

" }

" IDE {

" Edit-Compile-Edit Cycle
set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#

" }

" Customization / Override {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }
