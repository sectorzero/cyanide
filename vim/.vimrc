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
