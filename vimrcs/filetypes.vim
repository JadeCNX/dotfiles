"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Python section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd FileType python inoremap <buffer> $r return
" autocmd FileType python inoremap <buffer> $i import
" autocmd FileType python inoremap <buffer> $p print
" autocmd FileType python inoremap <buffer> $f # --- <esc>a
" autocmd FileType python map <buffer> <leader>1 /class
" autocmd FileType python map <buffer> <leader>2 /def
" autocmd FileType python map <buffer> <leader>C ?class
" autocmd FileType python map <buffer> <leader>D ?def
" autocmd FileType python set cindent
" autocmd FileType python set cinkeys-=0#
" autocmd FileType python set indentkeys-=0#


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> JSON section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " autocmd FileType json syntax match Comment +\/\/.\+$+
 autocmd FileType json set nowrap
 autocmd FileType jsonc set nowrap
 autocmd FileType json5 set nowrap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> JavaScript section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd FileType javascript call JavaScriptFold()
" autocmd FileType javascript setl foldenable
" autocmd FileType javascript setl nocindent
" autocmd FileType javascript setl expandtab shiftwidth=4 tabstop=4

" autocmd FileType javascript imap <c-t> console.log();<esc>hi
" autocmd FileType javascript imap <c-a> alert();<esc>hi

" autocmd FileType javascript inoremap <buffer> $r return
" autocmd FileType javascript inoremap <buffer> $f // --- PH<esc>FP2xi

" function! JavaScriptFold()
"     setl foldmethod=syntax
"     setl foldlevelstart=1
"     syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

"     function! FoldText()
"         return substitute(getline(v:foldstart), '{.*', '{...}', '')
"     endfunction
"     setl foldtext=FoldText()
" endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> CoffeeScript section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
" autocmd FileType coffee call CoffeeScriptFold()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> GO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Twig section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead *.twig set syntax=html filetype=html


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> XML
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup XML
    autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
    autocmd FileType xml set nofoldenable
    autocmd FileType xml set nowrap
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> SCSS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd FileType scss setl iskeyword+=@-@


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Actionscript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.as set filetype=actionscript

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Image
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter *.png,*.jpg,*gif exec "! catimg ".expand("%") | :bw


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> DockerFile
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.dockerfile set filetype=dockerfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> env file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead .env,.env.* set filetype=sh


