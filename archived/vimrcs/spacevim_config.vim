function! config#after() abort
	let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
	echo "config path" . s:path

	exec "source " . s:path . '/../vimrc/basic.vim'
	exec "source " . s:path . '/../vimrc/filetypes.vim'
	exec "source " . s:path . '/../vimrc/extended.vim'
endfunction


