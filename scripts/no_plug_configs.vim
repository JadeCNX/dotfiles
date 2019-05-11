" FINDING FILE:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path += **

" Display all matching files when we tab complate
set wildmenu


" TAG JUMPING:

" Create the 'tags' file (may need to install ctags first)
command! MakeTags !ctags -R .
" ^]   : jump to tag under cursor
" g^]  : jump ambiguous tags
" ^t   : jump back up the tag stack
" set tags for path looking tags


" AUTOCOMPLETE:

" The good stuff is documented in  |ins-completion|

" ^x^n : this file
" ^x^j : for filenames
" ^x^] : for tags only
" ^n   : anything specified by the 'complete' option
" ^n and ^p : back and forth in suggestion list


" FILE BROWSING:

" see also |netrw-browse-maps|

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s)\zs\.\S\+'


" BUILD INTEGRATION:

" ruby quick fix
set makeprg=bundle\ exec \ rspec\ -f\ QuickfixFormatter
" :make to run RSpec
" :cl to list erros
" :cc# to jump by number
" :cn, :cp to navigate






