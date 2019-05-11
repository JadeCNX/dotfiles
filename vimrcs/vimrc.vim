
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

exec "source " . s:path . '/basic.vim'
exec "source " . s:path . '/filetypes.vim'
exec "source " . s:path . '/extended.vim'
exec "source " . s:path . '/plugs.vim'
