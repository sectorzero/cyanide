" Java Convenience Functions

" Compute the Java 'package' identifier
function! JavaPackageName()
	let fpath = expand('%:p:h')
	let s1 = substitute(fpath, '^.*\(src\|tst\)\/', '', '')
	let result = substitute(s1, '\/', '.', 'g')
	return result
endfunction

" Format the Java 'package' line
function! JavaPackageLine()
	let package = JavaPackageName()
	return 'package ' . package . ';'
endfunction

" Compute the directory / path for the JUnit Class for the given Class
function! JavaUnitTestDirectory()
	let fpath = expand('%:p:h')
	let prefix = substitute(fpath, '\(^.*\)\(src\|tst\)\(.*\)', '\1', '')
	let suffix = substitute(fpath, '\(^.*\)\(src\|tst\)\(.*\)', '\3', '')
	return prefix . 'tst' . suffix
endfunction

" Compute the class name for the JUnit class ( <classname>Test.java )
function! JavaUnitTestFile()
	" Create <Class>Test.java file in Directory
	let filename = expand('%')
	let s1 = substitute(filename, '\.java$', '', '')
	let fname= s1 . 'Test' . '.java'
	return fname
endfunction

" [TODO] Append the JUnit class template
function! JavaAppendUnitTestTemplate()
	"Append 'package' line
	let package = JavaPackageLine()
	let result = append(0, package)

	" Append JUnit Boilerplate
	" TODO
endfunction

" Append the Java 'package' identifier
function! JavaAppendPackageLine()
	let package = JavaPackageLine()
	let result = append(0, package)
endfunction

" Create the JUnit class if one doesn't exist at the conventional path
function! JavaCreateUnitTestClass()
	" Create Directory If Doesnt Exist
	let dirtocreate = JavaUnitTestDirectory()
	:execute ':!mkdir -p ' . dirtocreate

	" Create <Class>Test.java file in Directory
	let fnametocreate = JavaUnitTestFile()

	let fpath = dirtocreate . '/' . fnametocreate

	if filereadable(fpath)
		:execute ':edit ' . fpath
	else
		:execute ':edit ' . fpath
		:call JavaAppendUnitTestTemplate()
	endif
endfunction
