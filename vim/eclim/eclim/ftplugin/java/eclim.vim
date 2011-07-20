" Convenience Functions
" Ref : http://vim.wikia.com/wiki/Auto_insert_Java_class_template_when_editing_a_new_Java_file
function! InsertJavaPackage()
  let filename = expand("%")
  let filename = substitute(filename, "\.java$", "", "")
  let dir = getcwd() . "/" . filename
  let dir = substitute(dir, "^.*\/src\/", "", "")
  let dir = substitute(dir, "\/[^\/]*$", "", "")
  let dir = substitute(dir, "\/", ".", "g")
  let filename = substitute(filename, "^.*\/", "", "")
  let dir = "package " . dir . ";"
  let result = append(0, dir)
  let result = append(1, "")
endfunction

" Eclim Mappings
nnoremap <silent> <buffer> <Leader>i :JavaImport<cr>
nnoremap <silent> <buffer> <Leader>d :JavaDocSearch -x declarations<cr>
nnoremap <silent> <buffer> <Leader>s :JavaSearchContext<cr>
nnoremap <silent> <buffer> <Leader>r :JavaSearch -x references<cr>
nnoremap <silent> <buffer> <Leader>d :JavaSearch -x implementors<cr>
nnoremap <silent> <buffer> <Leader>u :JavaHierarchy<cr>
nnoremap <silent> <buffer> <Leader>p :call InsertJavaPackage()<cr>
