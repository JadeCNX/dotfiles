" Colorscheme
set background=dark
colorscheme slate

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
set noshowmatch
let g:loaded_matchparen=1

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
" set ffs=unix,dos,mac

" no write backup
set nowritebackup
set noswapfile
set nobackup


" dependency
let g:loaded_python_provider = 0
let s:python_path = '/usr/local/bin/python3'
if !empty(glob(s:python_path))
  let g:python3_host_prog = s:python_path
endif

let s:ruby_path ='/usr/local/opt/ruby/bin/ruby'
if !empty(glob(s:ruby_path))
  let g:ruby_host_prog = s:ruby_path
endif


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
set textwidth=160
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
noremap <silent> <leader><cr> :noh<cr>

" Close the current buffer
noremap <c-q> :<c-u>Bclose<cr>
" :tabclose<cr>gT

" Close all the buffers
" noremap <leader>ba :bufdo bd<cr>

" noremap <leader>bd :<C-u>Bclose<cr>
" noremap <c-l> :bnext<cr>
" noremap <c-h> :bprevious<cr>

" Useful mappings for managing tabs
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove
noremap <space>t<space> :tabnext<space>

noremap <space>1 :tabnext 1<cr>
noremap <space>2 :tabnext 2<cr>
noremap <space>3 :tabnext 3<cr>
noremap <space>4 :tabnext 4<cr>
noremap <space>5 :tabnext 5<cr>
noremap <space>6 :tabnext 6<cr>
noremap <space>7 :tabnext 7<cr>
noremap <space>8 :tabnext 8<cr>
noremap <space>9 :tabnext 9<cr>
noremap <space>0 :tabnext 10<cr>


" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<CR>

" Switch CWD to the directory of the open buffer
" noremap <leader>pwd :cd %:p:h<cr>:pwd<cr>

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



" neovim specified commands
if has('nvim')

  " inccommand shows you in realtime what changes your ex command should make
  set inccommand=nosplit

endif

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
noremap <leader>zz :setlocal spell!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Marco
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap Q @@


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
" noremap <Leader>. mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
" noremap <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
" noremap <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
" noremap <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" noremap <leader>e :e! ~/.vim/my_configs.vim<cr>
" autocmd! bufwritepost ~/.vim/my_configs.vim source ~/.vim/my_configs.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
  set undodir=~/.vim/undodir
  set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Cursor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a

if has('nvim') && !has("gui_vimr")
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
  au InsertEnter * set cul
  au InsertLeave * set nocul
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  au InsertEnter * set cul
  au InsertLeave * set nocul
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> :terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists(':terminal')
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
endif
