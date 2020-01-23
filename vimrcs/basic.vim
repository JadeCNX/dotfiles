" Show line number
set number

" Show relative line number
" set relativenumber

" yank copy to clipboard
" set clipboard=unnamed

" show command
set showcmd

" start horizontal split below
set splitbelow

" start vertical split right
set splitright

" number of lines of history
set history=1000

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" map <leader>
let mapleader = " "
let maplocalleader = "\""

" Fast saving
" nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute w !sudo tee % >' /dev/null' <bar> edit!>''>

" scroll off
set scrolloff=3
set sidescrolloff=3
set scrollopt+=hor

" Language!
set encoding=UTF-8
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" turn on the Wild menu
set wildmenu

" ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" always show current position
set ruler

" height of the command bar
set cmdheight=2

" a buffer becomes hidden when it is abandoned
set hidden

" configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" prevent vim auto add eol
" set nofixendofline

" ignore case when searching
set ignorecase

" when searching try to be smart about cases
set smartcase

" highlight search results
set hlsearch

" makes search act like search in modern browsers
set incsearch

" don't redraw while executing macros (good performance config)
set lazyredraw

" for regular expressions turn magic on
set magic

" show matching brackets when text indicator is over them
set showmatch

" how many tenths of a second to blink when matching brackets
set mat=2

" combine commands time out
set tm=2000

" add a bit extra margin to the left
set foldcolumn=1

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" as command
set background=dark

" enable syntax highlighting
syntax enable

" set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set t_Co=256
  set guitablabel=%M\ %t
endif


" Use Unix as the standard file type
set ffs=unix,dos,mac

" no write backup
set nowritebackup
set noswapfile
set nobackup


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Be smart when using tabs ;)
set smarttab

" Use spaces instead of tabs
" set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set linebreak
set breakindent
set textwidth=500
let &showbreak='↳ '
" set cpoptions+=n

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" always show signcolumns
set signcolumn=yes


" Show < or > when characters are not displayed on the left or right.
" set listchars=trail:.,precedes:,extends:
" Same, but also show tabs and trailing spaces.
set listchars=tab:>-,trail:.,precedes:,extends:

autocmd BufWinLeave * call clearmatches()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
" map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
" map <leader>ba :bufdo bd<cr>

map <c-q> :Bclose<cr>
map <c-l> :bnext<cr>
map <c-h> :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
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
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<CR>

" Switch CWD to the directory of the open buffer
map <leader>pwd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk] or Command+[jk] on mac

" nmap <M-k> mz:m-2<cr>`z
" nmap <M-j> mz:m+<cr>`z
" vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
"
" if has("mac") || has("macunix")
"   nmap <D-j> <M-j>
"   nmap <D-k> <M-k>
"   vmap <D-j> <M-j>
"   vmap <D-k> <M-k>
" endif

" move counterlinewise
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

" focus split
" noremap gj <C-W>j
" noremap gk <C-W>k
" noremap gh <C-W>h
" noremap gl <C-W>l

" remop escape key
inoremap fd <ESC>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
" map <leader>sn ]s
" map <leader>sp [s
" map <leader>sa zg
" map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Marco
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap Q @@


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>. mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
" map <leader>pp :setlocal paste!<cr>


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
