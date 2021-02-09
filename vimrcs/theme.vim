"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:srcery_italic = 1
" let g:PaperColor_Theme_Options = {
"   \   'theme': {
"   \     'default': {
"   \       'transparent_background': 1,
"   \       'allow_italic': 1,
"   \       'allow_bold': 1
"   \     }
"   \   }
"   \ }
" let base16colorspace=256  " Access colors present in 256 colorspace
" let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
let g:onedark_terminal_italics = 1
let g:onedark_hide_endofbuffer = 1
" let g:onedark_termcolors = 256
" let g:solarized_term_italics = 1
" let g:solarized_termcolors=256
" let g:solarized_visibility = 'high'
" let g:one_allow_italics = 1
" let ayucolor="mirage"

" Colorscheme
set background=dark
colorscheme onedark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, ' ' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, ' ' . info['warning'])
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction

set statusline=
set statusline+=%1*\ %{WebDevIconsGetFileTypeSymbol()}\                                 " buffernr
set statusline+=%2*\\ %*                                 " split
set statusline+=%3*\ %<%f%h%m%r                           " file
" set statusline+=%4*%=%{!airline#check_mode(winnr())}      " check mode for airline
set statusline+=%4*%=%3*%{get(b:,'coc_current_function','')}\  " current function
set statusline+=%5*%{StatusDiagnostic()}\ %3*%{get(b:,'coc_git_status','')}\ %{get(g:,'coc_git_status','')}

" set statusline+=%5*                                        " split
" set statusline+=%2*\ \ %r%w%P                               " Modified? Readonly? Top/bot.
" set statusline+=%2*\ %l,%c\ %P\ %*                          " rownumber,colnumber
" set statusline+=%6*                                        " split
" set statusline+=%4*\ \ %{&spelllang}\                       " Spellanguage & Highlight on?
" set statusline+=%1*\ %{StatusDiagnostic()}                  " diagnostic info
" set statusline+=%1*%=%{get(b:,'coc_current_function','')}\  " current function
" set statusline^=%{get(g:,'coc_git_status','')}\ %{get(b:,'coc_git_status','')}\ %{get(b:,'coc_current_function','')}\ %{StatusDiagnostic()}
" set statusline+=%1*\ %=\ %{''.(&fenc!=''?&fenc:&enc).''}" Encoding
" set statusline+=%1*\ %<%f%h%m%r%b\ 0x%B\ \ %l,%c%V\ %P\ %* " character under cursor

let s:color1='#E06C75'
let s:color2='#3E4452'
let s:color3='#282C34'
let s:color4='#ABB2BF'

execute 'hi User1 guifg=' . s:color3 . ' guibg=' . s:color1
execute 'hi User2 guifg=' . s:color2 . ' guibg=' . s:color1
execute 'hi User3 guifg=' . s:color4 . ' guibg=' . s:color2
execute 'hi User4 guifg=' . s:color2 . ' guibg=' . s:color2
execute 'hi User5 guifg=' . s:color1 . ' guibg=' . s:color2
execute 'hi StatusLineNC guibg=' . s:color2
execute 'hi StatusLineTermNC guibg=' . s:color2
" execute 'hi User5 guifg=' . s:color1 . ' guibg=' . s:color3
" execute 'hi User4 guifg=' . s:color4 . ' guibg=' . s:color2
" execute 'hi User5 guifg=' . s:color3 . ' guibg=' . s:color1
" execute 'hi User6 guifg=' . s:color3 . ' guibg=' . s:color2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Override colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi Comment gui=italic
hi Identifier gui=italic
hi StorageClass gui=italic
hi Todo gui=inverse,bold,italic
hi Type gui=italic
hi Underlined gui=underline
hi Function gui=italic
hi Italic gui=italic
" hi Whitespace guifg=gray30

" disable underline in colorscheme onedark
hi DiffChange gui=NONE

" transparent background
if !has('gui_running') && !has('gui_vimr')
  hi Normal guibg=NONE ctermbg=NONE
  hi NonText guibg=NONE ctermbg=NONE
  " hi NonText guibg=NONE ctermbg=NONE guifg=#FBB829
  hi EndOfBuffer guibg=NONE ctermbg=NONE

  " hi LineNr guibg=NONE ctermbg=NONE
  " hi SignColumn guibg=NONE ctermbg=NONE
  " " hi Normal guibg=#212121
  " " hi NonText guibg=#212121
  " hi VertSplit guibg=NONE
  " hi Statement guibg=NONE
  " hi Title guibg=NONE
  " hi Todo guibg=NONE
  " hi Underlined guibg=NONE
  " hi ErrorMsg guibg=NONE
  " hi CursorLine guibg=NONE
  " hi CursorLineNr guibg=NONE
  " hi StatusLine guibg=NONE
endif

