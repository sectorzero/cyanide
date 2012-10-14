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

" Settings {
set nocompatible
set background=dark
filetype plugin on
filetype plugin indent on
syntax enable
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

set novisualbell  " silent
set noerrorbells  " silent

" Ref : http://nvie.com/posts/how-i-boosted-my-vim/
set backspace=indent,eol,start  
                  "allow backspacing over everything in insert mode

set incsearch     " show search matches as you type
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  " case-sensitive otherwise
set iskeyword+=_

set autowrite

set pastetoggle=<C-p>

set history=1000

" Do Not Pop Preview Window for OmniComplete / AutoComplete
set completeopt-=preview

" }

" Formatting {

"set list
":map <C-u> :set list!<cr>
set listchars=tab:>.,trail:.,extends:#,nbsp:. 
                                " Highlight problematic whitespace
                                
"set nowrap                    " wrap long lines
set autoindent                 	" indent at the same level of the previous line
set shiftwidth=4                " number of spaces to use for autoindenting
set expandtab 	  	     		" tabs are spaces, not tabs
set tabstop=4 					" an indentation every four columns
set softtabstop=4 				" let backspace delete indent
set copyindent                  " copy the previous indentation on autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
"set showmatch                  " set show matching parenthesis
set smarttab                    " insert tabs on the start of a line according to
                                " shiftwidth, not tabstop
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
" let g:Tlist_Show_One_File=1
" let g:Tlist_Use_Right_Window=1
" let g:Tlist_WinWidth=40
" let g:Tlist_GainFocus_On_ToggleOpen=1
" nmap <silent> <Leader>c :TlistToggle<cr>
" }

" Tagbar {
nmap <silent> <Leader>c :TagbarToggle<cr>
" }

" Wikipedia {
autocmd BufRead,BufNewFile *.wiki            setfiletype Wikipedia
autocmd BufRead,BufNewFile *.wikipedia.org*  setfiletype Wikipedia
" }

" ack-vim {
let g:ackprg="$CYANIDE_HOME/vim/ack/ack-standalone -H --nocolor --nogroup --column" 
" }

" ctrlp {
let g:ctrlp_map = '<Leader>f'
let g:ctrlp_working_path_mode = 2
let g:ctrlp_open_multiple_files = '1tjr'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$|build',
            \ 'file': '\.exe$\|\.so$\|\.dll$|tags' }

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Disable temp and backup files
set wildignore+=*.swp,*~,._*
"}

" Syntastic {
let g:syntastic_mode_map = { 
            \ 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['html'] }
" }

" YankRing {
nnoremap <silent> <Leader>ys :YRShow<CR>
" }

" Eclim {
" When a single result it found, open the corresponding file in a buffer
let g:EclimJavaSearchSingleResult='edit'
" Do not try to override makeprg and efm
let g:EclimJavaCompilerAutoDetect=0
" }

" }

" IDE {

" Edit-Compile-Edit Cycle
set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#

" Search / Custom Grep
"set grepprg=grep\ -nH\ $*
set grepprg=grep\ -srnHw\ --binary-files=without-match\ --exclude=\"\*.git\*\"\ --exclude=\"\*build\*\"\ --exclude=\"\*tags\*\"\ .\ -e\ $*
map <C-x><C-x> :execute " grep -srnHw --binary-files=without-match --exclude=\"\*.git\*\" --exclude=\"\*build\*\" --exclude=\"\*tags\*\" . -e " . expand("<cword>") . " " <bar> cwindow<CR>

" }

" Latex {


" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" PDF format generation as default
let g:Tex_DefaultTargetFormat='pdf'

" }

" Customization / Override {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }
