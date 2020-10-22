"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
" cno #h e ~/
" cno #d e ~/Desktop/
" cno #j e ./
" cno #c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash
" cno #q <C-\>eDeleteTillSlash()<cr>

" Readline like keys for the command line
" NOTE: use vim-rsi instead
" cnoremap <C-A> <Home>
" cnoremap <C-E> <End>
" cnoremap <C-K> <C-U>
" cnoremap <C-F> <RIGHT>
" cnoremap <C-B> <LEFT>
" cnoremap <C-D> <LEFT><DELETE>
" cnoremap <C-P> <Up>
" cnoremap <C-N> <Down>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Parenthesis/bracket
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vnoremap $1 <esc>`>a)<esc>`<i(<esc>
" vnoremap $2 <esc>`>a]<esc>`<i[<esc>
" vnoremap $3 <esc>`>a}<esc>`<i{<esc>
" vnoremap $$ <esc>`>a"<esc>`<i"<esc>
" vnoremap $q <esc>`>a'<esc>`<i'<esc>
" vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
" inoremap $1 ()<esc>i
" inoremap $2 []<esc>i
" inoremap $3 {}<esc>i
" inoremap $4 {<esc>o}<esc>O
" inoremap $q ''<esc>i
" inoremap $e ""<esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> General abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Paste from clipboard and indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <M-P> :normal "*p=`]`]<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
    call CmdLine("grep '" . l:pattern . "' " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunc


if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --glob='!tags'\ --glob='!*.temp'
  set grepformat=%f:%l:%c:%m
elseif executable('ag')
  set grepprg=ag\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

vnoremap <silent> <leader>gv :call VisualSelection('gv', '')<CR><CR>
" nnoremap <leader>gg :grep<space>
nnoremap <leader>gm :set operatorfunc=GrepOperator<cr>g@
vnoremap <leader>gm :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif

  silent execute "grep " . shellescape(@@) . " ."
  copen
endfunction

" When you press <leader>gr you can search and replace the selected text
vnoremap <silent> <leader>gr :call VisualSelection('replace', '') <CR><CR>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<cr>/<C-R>=@/<cr><cr>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<cr>?<C-R>=@/<cr><cr>

nnoremap <leader>ao :botright copen<cr>
nnoremap <leader>an :cn<cr>
nnoremap <leader>ap :cp<cr>
" nnoremap <leader>ac ggVGy:tabnew<cr>:set syntax=qf<cr>pgg


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
" set laststatus=1

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Shell section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
else
  set term=screen-256color
endif

if exists('$TMUX') || !has('nvim')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Yank to clipboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap Y "*y
vnoremap Y "*y


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> *Ncgn https://youtu.be/YwMgnmZNWXA
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap c* *Ncgn

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> To the end of line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap - $
vnoremap - $


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Profile
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>DD :exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
nnoremap <leader>DP :exe ":profile pause"<cr>
nnoremap <leader>DC :exe ":profile continue"<cr>
nnoremap <leader>DQ :exe ":profile pause"<cr>:noautocmd qall!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Horizontal scroll with mouse.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <S-ScrollWheelUp>   <ScrollWheelLeft>
nnoremap <S-2-ScrollWheelUp> <2-ScrollWheelLeft>
nnoremap <S-3-ScrollWheelUp> <3-ScrollWheelLeft>
nnoremap <S-4-ScrollWheelUp> <4-ScrollWheelLeft>
nnoremap <S-ScrollWheelDown>     <ScrollWheelRight>
nnoremap <S-2-ScrollWheelDown>   <2-ScrollWheelRight>
nnoremap <S-3-ScrollWheelDown>   <3-ScrollWheelRight>
nnoremap <S-4-ScrollWheelDown>   <4-ScrollWheelRight>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! DeleteTillSlash()
  let g:cmd = getcmdline()

  if has("win16") || has("win32")
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  else
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  endif

  if g:cmd == g:cmd_edited
    if has("win16") || has("win32")
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
    else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    endif
  endif

  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc

" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

function! CmdLine(str)
  call feedkeys(":" . a:str)
endfunction

" Delete trailing white space on save, useful for some filetypes ;)
func! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunc

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      " au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
      au CursorHold * let @/ = '\V\<'.expand('<cword>').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

fu! Sum(vals) "{{{
  let acc = 0
  for val in a:vals
    let acc += val
  endfor
  return acc
endfu "}}}

fu! LogicalLineCounts() "{{{
  if &wrap
    let width = winwidth(0)
    let line_counts = map(range(1, line('$')), "foldclosed(v:val)==v:val?1:(virtcol([v:val, '$'])/width)+1")
  else
    let line_counts = [line('$')]
  endif
  return line_counts
endfu "}}}

fu! LinesHiddenByFoldsCount() "{{{
  let lines = range(1, line('$'))
  call filter(lines, "foldclosed(v:val) > 0 && foldclosed(v:val) != v:val")
  return len(lines)
endfu "}}}

fu! AutoVerticalResizeWindow() "{{{
  let longest = max(map(range(1, line('$')), "virtcol([v:val, '$'])"))
  exec "vertical resize " . (longest+4)
endfu

fu! AutoHorizontalResizeWindow()
  let line_counts  = LogicalLineCounts()
  let folded_lines = LinesHiddenByFoldsCount()
  let lines        = Sum(line_counts) - folded_lines
  exec 'resize ' . lines
  1
endfu "}}}

if has("autocmd")
  autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee,*.json,*.html :call CleanExtraSpaces()
endif

nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<cr>
" call AutoHighlightToggle()

" nnoremap <C-W>? :call AutoVerticalResizeWindow()<cr>
" nnoremap <C-W>/ :call AutoHorizontalResizeWindow()<cr>

" Current Highlight under Cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Highlight cursor only the active window
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

augroup AutoGrep
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost l*    lwindow
augroup END

" file is large
augroup LargeFile
  let g:LargeFile = 1024 * 1024 * 10
  autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif

  fu! LargeFile()
    " no syntax highlighting etc
    set eventignore+=FileType
    " save memory when other file is viewed
    setlocal bufhidden=unload
    " is read-only (write with :w new_filename)
    setlocal buftype=nowrite
    " no undo possible
    setlocal undolevels=-1
    " display message
    autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
  endfu
augroup END

augroup Scrollbar
  func! STL()
    let stl = '%f [%{(&fenc==""?&enc:&fenc).((exists("+bomb") && &bomb)?",B":"")}%M%R%H%W] %y [%l/%L,%v] [%p%%]'
    let barWidth = &columns - 65 " <-- wild guess
    let barWidth = barWidth < 3 ? 3 : barWidth

    if line('$') > 1
      let progress = (line('.')-1) * (barWidth-1) / (line('$')-1)
    else
      let progress = barWidth/2
    endif

    " line + vcol + %
    let pad = strlen(line('$'))-strlen(line('.')) + 3 - strlen(virtcol('.')) + 3 - strlen(line('.')*100/line('$'))
    let bar = repeat(' ',pad).' [%1*%'.barWidth.'.'.barWidth.'('
          \.repeat('-',progress )
          \.'%2*0%1*'
          \.repeat('-',barWidth - progress - 1).'%0*%)%<]'

    return stl.bar
  endfun

  " hi def link User1 DiffAdd
  " hi def link User2 DiffDelete
  " set stl=%!STL()
augroup END

function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '*' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

function! Syn()
  for id in synstack(line("."), col("."))
    echo synIDattr(id, "name")
  endfor
endfunction
command! -nargs=0 Syn call Syn()

function! HICursor()
  echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
        \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
endfunction
command! -nargs=0 HICursor call HICursor()

command! -nargs=? -range Dec2hex call s:Dec2hex(<line1>, <line2>, '<args>')
function! s:Dec2hex(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    else
      let cmd = 's/\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No decimal number found'
    endtry
  else
    echo printf('%x', a:arg + 0)
  endif
endfunction

command! -nargs=? -range Hex2dec call s:Hex2dec(<line1>, <line2>, '<args>')
function! s:Hex2dec(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V0x\x\+/\=submatch(0)+0/g'
    else
      let cmd = 's/0x\x\+/\=submatch(0)+0/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No hex number starting "0x" found'
    endtry
  else
    echo (a:arg =~? '^0x') ? a:arg + 0 : ('0x'.a:arg) + 0
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Trim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
" nnoremap <F12>     :ShowSpaces 1<CR>
" nnoremap <S-F12>   m`:TrimSpaces<CR>``
" vnoremap <S-F12>   :TrimSpaces<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Make vim ludicrously fast again.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Ludicrous(enable)
  if a:enable
    if exists(":RainbowToggleOff")
      RainbowToggleOff
    endif
    if exists(":ALEDisable")
      ALEDisable
    endif
    if exists(":SignifyDisable")
      SignifyDisable
    endif
  else
    if exists(":RainbowToggleOn")
      RainbowToggleOn
    endif
    if exists(":ALEEnable")
      ALEDisable
    endif
    if exists(":SignifyEnable")
      SignifyEnable
    endif
  endif
endfunction


function! LudicrousToggle()
  if exists("b:diff_no_syntax") && b:diff_no_syntax == 1
    call Ludicrous(0)
    let b:diff_no_syntax=0
  else
    call Ludicrous(1)
    let b:diff_no_syntax=1
  endif
endfunction

command! -bar -nargs=0 LudicrousToggle call LudicrousToggle()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> No syntax highlighting in vimdiff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &diff
  syntax off
  call Ludicrous(1)
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Ignore whitespace in diff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! DiffIwhiteToggle()
  if &diffopt =~ "iwhite"
    set diffopt-=iwhite
    echo "Diff no ignore whitespace"
  else
    set diffopt+=iwhite
    echo "Diff ignore whitespace"
  endif
endfunction
set diffopt+=iwhite
command! -bar -nargs=0 DiffIwhiteToggle call DiffIwhiteToggle()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Ignore whitespace in diff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! DiffNoSyntaxToggle()
  if exists("b:diff_no_syntax") && b:diff_no_syntax == 1
    if &diff
      windo diffoff
    endif
    set syntax=on
    call Ludicrous(0)
    let b:diff_no_syntax=0
  else
    if !&diff
      windo diffthis
    endif
    set syntax=off
    call Ludicrous(1)
    let b:diff_no_syntax=1
  endif
endfunction
command! -bar -nargs=0 DiffNoSyntaxToggle call DiffNoSyntaxToggle()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> close empty buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CloseEmptyBuffers()
  let [i, n; empty] = [1, bufnr('$')]
  while i <= n
    if bufexists(i) && bufname(i) == ''
      call add(empty, i)
    endif
    let i += 1
  endwhile
  if len(empty) > 0
    exe 'bdelete' join(empty)
  endif
endfunction
command! -bar -nargs=0 CloseEmptyBuffers call CloseEmptyBuffers()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Sort inline words
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SortWordsSelection()
  " Get the visual mark points
  let StartPosition = getpos("'<")
  let EndPosition = getpos("'>")

  if StartPosition[0] != EndPosition[0]
    echoerr "Range spans multiple buffers"
  elseif StartPosition[1] != EndPosition[1]
    " This is a multiple line range, probably easiest to work line wise

    " This could be made a lot more complicated and sort the whole
    " lot, but that would require thoughts on how many
    " words/characters on each line, so that can be an exercise for
    " the reader!
    for LineNum in range(StartPosition[1], EndPosition[1])
      call setline(LineNum, join(sort(split(getline('.'), ' ')), " "))
    endfor
  else
    " Single line range, sort words
    let CurrentLine = getline(StartPosition[1])

    " Split the line into the prefix, the selected bit and the suffix

    " The start bit
    if StartPosition[2] > 1
      let StartOfLine = CurrentLine[:StartPosition[2]-2]
    else
      let StartOfLine = ""
    endif
    " The end bit
    if EndPosition[2] < len(CurrentLine)
      let EndOfLine = CurrentLine[EndPosition[2]:]
    else
      let EndOfLine = ""
    endif
    " The middle bit
    let BitToSort = CurrentLine[StartPosition[2]-1:EndPosition[2]-1]

    " Move spaces at the start of the section to variable StartOfLine
    while BitToSort[0] == ' '
      let BitToSort = BitToSort[1:]
      let StartOfLine .= ' '
    endwhile
    " Move spaces at the end of the section to variable EndOfLine
    while BitToSort[len(BitToSort)-1] == ' '
      let BitToSort = BitToSort[:len(BitToSort)-2]
      let EndOfLine = ' ' . EndOfLine
    endwhile

    " Sort the middle bit
    let Sorted = join(sort(split(BitToSort, ' ')), ' ')
    " Reform the line
    let NewLine = StartOfLine . Sorted . EndOfLine
    " Write it out
    call setline(StartPosition[1], NewLine)
  endif
endfunction

" Add a mapping, go to your string, then press vi",s
" vi" selects everything inside the quotation
" ,s calls the sorting algorithm
" vmap ,s :SortWords<CR>
" Normal mode one: ,s to select the string and sort it
" nmap ,s vi",s
command! -nargs=0 -range SortWordsSelection call SortWordsSelection()
command! -nargs=0 SortWords call setline('.', join(sort(split(getline('.'), '\s*,\s*')), ", "))


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> copy file path
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" relative path  (src/foo.txt)
nnoremap <leader>cf :let @*=expand("%")<CR>

" absolute path  (/something/src/foo.txt)
nnoremap <leader>cF :let @*=expand("%:p")<CR>

" filename       (foo.txt)
nnoremap <leader>ct :let @*=expand("%:t")<CR>

" directory name (/something/src)
nnoremap <leader>ch :let @*=expand("%:p:h")<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> lesspipe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if exists('g:did_load_filetypes')
"   if executable('lesspipe.sh')
"     let s:lesspipe_cmd = 'LESSQUIET=1 lesspipe.sh'
"   elseif executable('lesspipe')
"     let s:lesspipe_cmd = 'lesspipe'
"   endif
"   if exists('s:lesspipe_cmd') && executable('file')
"     augroup lesspipe
"       autocmd!
"       " autocmd BufReadPost *
"             " \ if  empty(&l:buftype) && !did_filetype() && !&l:binary && filereadable(bufname('%')) &&
"             " \     system('file --mime --brief ' . fnamemodify(resolve(expand('%')), ':p:S')) !~# '^text/' |
"             " \   silent exe '%!' . s:lesspipe_cmd . ' ' . expand('%:S') |
"             " \   setlocal filetype=text |
"             " \ endif

"       autocmd Filetype pdf
"             \ exe '%!' . s:lesspipe_cmd . ' ' . expand() |
"             \ setlocal filetype=text nomodifiable readonly |

"       let g:zipPlugin_ext='*.apk,*.celzip,*.crtx,*.ear,*.gcsx,*.glox,*.gqsx,*.kmz,*.oxt,*.potm,*.potx,*.ppam,*.sldx,*.thmx,*.vdw,*.war,*.wsz,*.xap,*.xlam,*.xlam,*.xltm,*.xltx,*.xpi,*.zip'
"     augroup END
"   endif
" endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> quick normal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>h :<c-u>normal<Space>
vmap <leader>h :<c-u>normal<Space>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Clean up on leave
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function!  <SID>DeleteBufferByExtension(strExt)
  let s:bufNr = bufnr("$")
  echo 'all bufnr' . s:bufNr
  while s:bufNr > 0
    echo 'bufnr' . s:bufNr
    if buflisted(s:bufNr)
      echo 'buf name' . bufname(s:bufNr)
      " if (matchstr(bufname(s:bufNr), ".".a:strExt."$") == ".".a:strExt )
      " if getbufvar(s:bufNr, '&modified') == 0
      "   execute "bd ".s:bufNr
      " endif
      " endif
    endif
    let s:bufNr = s:bufNr-1
  endwhile
endfunction

map <leader>et :call <SID>DeleteBufferByExtension("txt")

" autocmd VimLeavePre :bufdo if &ft == 'coc-explorer' | doautocmd FileType | endif
