" Eclim Mappings
nnoremap <silent> <buffer> <Leader>i :JavaImport<cr>
nnoremap <silent> <buffer> <Leader>d :JavaDocSearch -x declarations<cr>
nnoremap <silent> <buffer> <Leader>s :JavaSearchContext<cr>
nnoremap <silent> <buffer> <Leader>r :JavaSearch -x references<cr>
nnoremap <silent> <buffer> <Leader>d :JavaSearch -x implementors<cr>
nnoremap <silent> <buffer> <Leader>u :JavaHierarchy<cr>
nnoremap <silent> <buffer> <Leader>p :call JavaAppendPackageLine()<cr>
