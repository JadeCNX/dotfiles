"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <space><cr> :noh<cr>

" Close the current buffer
" map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
" map <leader>ba :bufdo bd<cr>

" map <c-q> :Bclose<cr>
" map <c-l> :bnext<cr>
" map <c-h> :bprevious<cr>

" Useful mappings for managing tabs
map <space>tn :tabnew<cr>
map <space>to :tabonly<cr>
map <space>tc :tabclose<cr>
" map <space>tm :tabmove
map <space>t<space> :tabnext<space>

map <space>1 :tabnext 1<cr>
map <space>2 :tabnext 2<cr>
map <space>3 :tabnext 3<cr>
map <space>4 :tabnext 4<cr>
map <space>5 :tabnext 5<cr>
map <space>6 :tabnext 6<cr>
map <space>7 :tabnext 7<cr>
map <space>8 :tabnext 8<cr>
map <space>9 :tabnext 9<cr>
map <space>0 :tabnext 10<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <space>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <space>te :tabedit <c-r>=expand("%:p:h")<CR>

" Switch CWD to the directory of the open buffer
map <space>pwd :cd %:p:h<cr>:pwd<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk] or Command+[jk] on mac

" move counterlinewise
" nnoremap k gk
" nnoremap j gj
" vnoremap k gk
" vnoremap j gj

" focus split
" noremap gj <C-W>j
" noremap gk <C-W>k
" noremap gh <C-W>h
" noremap gl <C-W>l

" remop escape key
" inoremap fd <ESC>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
" map <space>ss :setlocal spell!<cr>

" Shortcuts using <space>
" map <space>sn ]s
" map <space>sp [s
" map <space>sa zg
" map <space>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Marco
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap Q @@


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <space>. mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <space>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <space>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
" map <space>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> :terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To map <Esc> to exit terminal-mode: >
tnoremap <C-O> <C-\><C-N>

" To simulate |i_CTRL-R| in terminal-mode: >
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" To use `ALT+{h,j,k,l}` to navigate windows from any mode: >
" tnoremap <A-h> <C-\><C-N><C-w>h
" tnoremap <A-j> <C-\><C-N><C-w>j
" tnoremap <A-k> <C-\><C-N><C-w>k
" tnoremap <A-l> <C-\><C-N><C-w>l
" inoremap <A-h> <C-\><C-N><C-w>h
" inoremap <A-j> <C-\><C-N><C-w>j
" inoremap <A-k> <C-\><C-N><C-w>k
" inoremap <A-l> <C-\><C-N><C-w>l
" :nnoremap <A-h> <C-w>h
" :nnoremap <A-j> <C-w>j
" :nnoremap <A-k> <C-w>k
" :nnoremap <A-l> <C-w>l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> VScode-Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" function! s:showCommands()
"     normal! gv
"     let startLine = line("v")
"     let endLine = line(".")
"     call VSCodeNotifyRange("workbench.action.showCommands", startLine, endLine, 1)
" endfunction

function! s:showCommands()
    normal! gv
    let startPos = getpos("v")
    let endPos = getpos(".")
    call VSCodeNotifyRangePos("workbench.action.showCommands", startPos[1], endPos[1], startPos[2], endPos[2], 1)
endfunction

xnoremap <silent> <C-P> :<C-u>call <SID>showCommands()<CR>

nnoremap <silent> <space>/ :<C-u>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
nnoremap <silent> <C-w>gd :<C-u>call VSCodeNotify('editor.action.revealDefinitionAside')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Vim-comentary like
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Plug.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:plug_file = '~/.vim/autoload/plug.vim'
if empty(glob(s:plug_file))
  exec 'silent !curl -fLo ' . s:plug_file . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

    Plug 'asvetliakov/vim-easymotion'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Easy Motion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:EasyMotion_smartcase = 1
" map , <Plug>(easymotion-prefix)
nmap <space>j <Plug>(easymotion-overwin-f)

map  <space>f <Plug>(easymotion-overwin-f)
nmap <space>F <Plug>(easymotion-overwin-f2)

