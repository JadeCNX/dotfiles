"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors

" Set font according to system
if (has("mac") || has("macunix")) && !has("gui_vimr")
  set gfn=LigaOperatorMono\ Nerd\ Font\ Mono:h14,IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
  " elseif has("win16") || has("win32")
  " set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
  " elseif has("gui_gtk2")
  " set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
  " elseif has("linux")
  " set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
  " elseif has("unix")
  " set gfn=Monospace\ 11
endif
" set gfn=FuraCode\ Nerd\ Font,DankMono\ Nerd\ Font:h14,BlexMono\ Nerd\ Font:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
" set guioptions-=r
" set guioptions-=R
" set guioptions-=l
" set guioptions-=L

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <leader>e :e! ~/.vim/my_configs.vim<cr>
" autocmd! bufwritepost ~/.vim/my_configs.vim source ~/.vim/my_configs.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
  set undodir=~/.vim/undodir
  set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash
cno $q <C-\>eDeleteTillSlash()<cr>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> General abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Paste from clipboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" noremap <C-P> "+p`]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Ack searching and cope displaying
"    requires ack.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the the_silver_searcher if possible (much faster than Ack)
" if executable('ag')
" let g:ackprg = 'ag --vimgrep --smart-case'
" endif
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --glob='!tags'\ --glob='!*.temp'
  set grepformat=%f:%l:%c:%m
elseif executable('ag')
  set grepprg=ag\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

" When you press gv you Ack after the selected text
vnoremap <silent> <leader>gv :call VisualSelection('gv', '')<CR><CR>

" Open Ack and put the cursor in the right position
map <leader>gg :grep

" When you press <leader>gr you can search and replace the selected text
vnoremap <silent> <leader>gr :call VisualSelection('replace', '') <CR><CR>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<cr>/<C-R>=@/<cr><cr>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<cr>?<C-R>=@/<cr><cr>

map <leader>ao :botright copen<cr>
map <leader>ac ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>an :cn<cr>
map <leader>ap :cp<cr>


""""""""""""""""""""""""""""""
" -> Status line
""""""""""""""""""""""""""""""
" Always show the status line
" set laststatus=1

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

""""""""""""""""""""""""""""""
" -> Shell section
""""""""""""""""""""""""""""""
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
else
  set term=screen-256color
endif

if exists('$TMUX') || !has('nvim')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Cursor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a

if has('nvim')
  hi Cursor guifg='fg' guibg='Green'
  hi Cursor1 guifg='fg' guibg='Blue'
  hi Cursor2 guifg='fg' guibg='Red'
  set guicursor=
	\n-c:block-Cursor,
	\i-ve-ci:ver25,
	\r-cr:hor20,
	\o:hor50,
	\v-ve:block,
	\a:blinkwait280-blinkoff225-blinkon225,
	\sm:block-blinkwait175-blinkoff150-blinkon175

  " hi Cursor gui=NONE guifg=bg guibg=fg
  " hi Cursor2 gui=NONE guifg=bg guibg=fg
  " hi lCursor1 gui=NONE guifg=bg guibg=fg
  " hi lCursor2 gui=NONE guifg=bg guibg=fg

  au VimLeave * set guicursor=a:block-blinkon0
elseif exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Yank to clipboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap Y "*y
vnoremap Y "*y


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> To the end of line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap - $
vnoremap - $


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Profile
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>DD :exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
nnoremap <leader>DP :exe ":profile pause"<cr>
nnoremap <leader>DC :exe ":profile continue"<cr>
nnoremap <leader>DQ :exe ":profile pause"<cr>:noautocmd qall!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> No syntax highlighting in vimdiff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &diff
  syntax off
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""
" -> Trim
""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""
" -> Ignore whitespace in diff
""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""
" -> Ignore whitespace in diff
""""""""""""""""""""""""""""""
function! DiffNoSyntaxToggle()
  if exists("b:diff_no_syntax") && b:diff_no_syntax == 1
    diffoff
    set syntax=on
    if exists(":RainbowToggleOn")
      RainbowToggleOn
    endif
    let b:diff_no_syntax=0
  else
    diffthis
    set syntax=off
    if exists(":RainbowToggleOff")
      RainbowToggleOff
    endif
    let b:diff_no_syntax=1
  endif
endfunction
command! -bar -nargs=0 DiffNoSyntaxToggle call DiffNoSyntaxToggle()
