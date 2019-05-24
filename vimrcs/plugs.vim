let s:plug_file = '~/.vim/autoload/plug.vim'

if empty(glob(s:plug_file))
  exec 'silent !curl -fLo ' . s:plug_file . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

if !has('nvim')
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
endif

Plug '/usr/local/opt/fzf' " use with 'brew install fzf'
Plug 'AndrewRadev/linediff.vim', {'on': 'Linediff'}
Plug 'AndrewRadev/splitjoin.vim'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'Chiel92/vim-autoformat', {'on': 'Autoformat'}
Plug 'chrisbra/Colorizer'
Plug 'chrisbra/NrrwRgn'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'dbakker/vim-paragraph-motion'
Plug 'devjoe/vim-codequery'
Plug 'dhruvasagar/vim-table-mode'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'godlygeek/tabular'
Plug 'groenewege/vim-less', {'for': 'less'}
Plug 'honza/vim-snippets'
Plug 'jceb/vim-orgmode', {'for': 'org'}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak', {'on': ['<Plug>Sneak_f', '<Plug>Sneak_F', '<Plug>Sneak_t', '<Plug>Sneak_T']}
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
Plug 'ludovicchabant/vim-gutentags'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'mhinz/vim-signify'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mxw/vim-jsx', {'for': ['javascript', 'javascript.jsx']}
Plug 'nixprime/cpsm', { 'do': 'bash install.sh' }
Plug 'osyo-manga/vim-anzu'
Plug 'osyo-manga/vim-over'
Plug 'othree/javascript-libraries-syntax.vim', {'for': ['javascript', 'javascript.jsx']}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'plytophogy/vim-virtualenv', {'for': 'python'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install'}
Plug 'rickhowe/diffchar.vim'
Plug 'rizzatti/dash.vim', {'on':'Dash'}
Plug 'roxma/vim-paste-easy'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeToggle']}
Plug 'severin-lemaignan/vim-minimap', {'on': ['Minimap', 'MinimapToggle']}
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neomru.vim'
Plug 'SirVer/ultisnips' " ultimate snippet
Plug 'szw/vim-maximizer'
Plug 'terryma/vim-expand-region'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', {'on': ['NERDTree', 'NERDTreeToggle']}
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish' " Abbreviation substitution
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'unblevable/quick-scope' " highlight f,t move
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Flex-4', {'for': 'actionscript'}
Plug 'vim-scripts/utl.vim'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
Plug 'wellle/visual-split.vim'
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install', 'for': ['javascript', 'javascript.jsx', 'typescript'] }
Plug 'Yggdroot/indentLine'
Plug 'yuttie/comfortable-motion.vim' " Inertial-scroll
Plug 'zacharied/denite-nerdfont'
Plug 'zchee/deoplete-go', {'build': 'make', 'for': 'go'}

" Plug 'airblade/vim-gitgutter'
" Plug 'alvan/vim-clotag'
" Plug 'amix/vim-zenroom2'
" Plug 'ashisha/image.vim'
" Plug 'bagrat/vim-workspace'
" Plug 'bfredl/nvim-miniyank'
" Plug 'blindFS/vim-taskwarrior'
" Plug 'blueyed/vim-diminactive'
" Plug 'carlitux/deoplete-ternjs'
" Plug 'chr4/nginx.vim'
" Plug 'ctrlpvim/ctrlp.vim' " serach for files, buffers, tags
" Plug 'dahu/vim-fanfingtastic'
" Plug 'digitaltoad/vim-pug' " syntax highlighing for Pug (formerly Jade)
" Plug 'edkolev/tmuxline.vim'
" Plug 'ervandew/supertab'
" Plug 'google/vim-searchindex'
" Plug 'haya14busa/is.vim'
" Plug 'itchyny/lightline.vim'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'jlanzarotta/bufexplorer'
" Plug 'junegunn/vim-peekaboo'
" Plug 'koron/minimap-vim'
" Plug 'lilydjwg/colorizer'
" Plug 'lornix/vim-scrollbar'
" Plug 'maxbrunsfeld/vim-yankstack'
" Plug 'maximbaz/lightline-ale'
" Plug 'mhartington/deoplete-typescript'
" Plug 'mhinz/vim-startify'
" Plug 'mileszs/ack.vim'
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
" Plug 'nsf/gocode'
" Plug 'Quramy/tsuquyomi'
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
" Plug 'rhysd/clever-f.vim'
" Plug 'rust-lang/rust.vim'
" Plug 'Shougo/echodoc.vim'
" Plug 'Shougo/neoyank.vim'
" Plug 'Shougo/unite-outline'
" Plug 'svermeulen/vim-easyclip'
" Plug 'svermeulen/vim-extended-ft'
" Plug 'tacahiroy/ctrlp-funky'
" Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
" Plug 'terryma/vim-multiple-cursors'
" Plug 'tomtom/tlib_vim'
" Plug 'Valloric/YouCompleteMe'
" Plug 'vim-ctrlspace/vim-ctrlspace'
" Plug 'vim-flake8'
" Plug 'vim-scripts/mru.vim' " most recently use
" Plug 'vim-scripts/SyntaxRange'
" Plug 'vim-scripts/taglist.vim'
" Plug 'vim-scripts/YankRing.vim'
" Plug 'wsdjeg/FlyGrep.vim'
" Plug 'zhou13/vim-easyescape'

" Color schemes
Plug 'phanviet/vim-monokai-pro'
" Plug 'rakr/vim-one'
" Plug 'altercation/vim-colors-solarized'
" Plug 'chriskempson/base16-vim'
" Plug 'flazz/vim-colorschemes'
" Plug 'gregsexton/Atom'
" Plug 'jaxbot/semantic-highlight.vim'
" Plug 'joshdick/onedark.vim'
" Plug 'lifepillar/vim-solarized8'
" Plug 'morhetz/gruvbox'
" Plug 'sonph/onehalf', {'rtp': 'vim' }
" Plug 'vim-scripts/mayansmoke'
" Plug 'vim-scripts/peaksea'
" Plug 'vim-scripts/pyte'
" Plug 'w0ng/vim-hybrid'

" Initialize plugin system
call plug#end()

" let base16colorspace=256  " Access colors present in 256 colorspace
" let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
" let g:onedark_terminal_italics = 1
" let g:solarized_term_italics = 1
" let g:solarized_termcolors=256
" let g:solarized_visibility = 'high'
" let g:one_allow_italics = 1

" Colorscheme
set background=dark
colorscheme monokai_pro


""""""""""""""""""""""""""""""
" -> bufExplorer plugin
""""""""""""""""""""""""""""""
" let g:bufExplorerDefaultHelp=0
" let g:bufExplorerShowRelativePath=1
" let g:bufExplorerFindActive=1
" let g:bufExplorerSortBy='name'
" map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" -> MRU plugin
""""""""""""""""""""""""""""""
" let MRU_Max_Entries = 400
" map <leader>r :MRU<CR>


""""""""""""""""""""""""""""""
" -> YankStack
""""""""""""""""""""""""""""""
" let g:yankstack_yank_keys = ['y', 'd']
" let g:yankstack_map_keys = 0
" nmap <C-p> <Plug>yankstack_substitute_older_paste
" nmap <C-S-P> <Plug>yankstack_substitute_newer_paste
" nmap <M-P> <Plug>yankstack_substitute_older_paste
" nmap <M-S-P> <Plug>yankstack_substitute_newer_paste


""""""""""""""""""""""""""""""
" -> CTRL-P
""""""""""""""""""""""""""""""
" if executable('fd')
" let g:ctrlp_user_command = 'fd --type f --color=never "" %s'
" endif

" if executable('rg')
" set grepprg=rg\ --color=never
" let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
" let g:ctrlp_use_caching = 0
" elseif

" Use ag over grep
" if executable('ag')
" set grepprg=ag\ --nogroup\ --nocolor
" elseif

" " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" " ag is fast enough that CtrlP doesn't need to cache
" let g:ctrlp_use_caching = 0
" endif


" let g:ctrlp_map = '<c-f>'
" nnoremap <M-p> :CtrlPMixed<cr>
" nnoremap <M-P> :CtrlPMRU<cr>
" map <M-b> :CtrlPBuffer<cr>

" let g:ctrlp_use_caching = 0
" " let g:ctrlp_working_path_mode = 0
" let g:ctrlp_max_height = 20
" let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_switch_buffer = 'et'

" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,tags*
" set wildignore+=*/.git/*,*/tmp/*,*.swp,*/node_modules/*

" let g:ctrlp_extensions = ['mixed']
" let g:ctrlp_buffer_func = { 'enter': 'BrightHighlightOn', 'exit':  'BrightHighlightOff', }

" function! BrightHighlightOn()
" hi CursorLine guibg=darkred
" endfunction

" function! BrightHighlightOff()
" hi CursorLine guibg=#2c323c
" endfunction


""""""""""""""""""""""""""""""
" -> ctrlp-funky
""""""""""""""""""""""""""""""
" let g:ctrlp_funky_syntax_highlight = 1
" nnoremap <M-o> :CtrlPFunky<CR>


""""""""""""""""""""""""""""""
" -> Deoplete
""""""""""""""""""""""""""""""
if has('nvim')
  call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
  call deoplete#custom#var('around', {
        \   'range_above': 50,
        \   'range_below': 50,
        \   'mark_above': '[↑]',
        \   'mark_below': '[↓]',
        \   'mark_changes': '[*]',
        \})
  " call deoplete#custom#option('sources', {
  "       \ '_': ['buffer'],
  "       \ 'cpp': ['buffer', 'tag'],
  "       \})
  " call deoplete#custom#source('_', 'sorters', [])

  let g:deoplete#enable_at_startup = 1

  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
endif


""""""""""""""""""""""""""""""
" -> Denite
""""""""""""""""""""""""""""""
if has('nvim')
  augroup deniteresize
    autocmd!
    autocmd VimResized,VimEnter * call denite#custom#option('default',
          \'winheight', winheight(0) / 3)
  augroup end

  " call denite#custom#option('default', {
  " \ 'prompt': '❯'
  " \ })

  " Change ignore_globs Note: This filtering is slow.
  call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
        \ [ '.git/', '.ropeproject/', '__pycache__/', 'node_modules/',
        \   'venv/', 'images/', '*.min.*', 'tags', '*.temp'])

  " Ripgrep search file command.
  " call denite#custom#var('file/rec', 'command', ['rg', '--files', '--no-ignore', '-i', '--hidden', '--follow' , '--glob=!.git', '--glob=!node_modules'])

  call denite#custom#var('file/rec', 'command', [ 'fd', '--type', 'f', '--color=never', '' ])

  " Ag search file command.
  " call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '--path-to-ignore', '~/.gitignore_global', '-g', ''])

  " call denite#custom#source('file/rec', 'matchers', ['matcher/fuzzy', 'matcher/project_files', 'matcher_ignore_globs'])
  call denite#custom#source('file/rec', 'matchers', ['matcher/cpsm'])
  call denite#custom#source('file/rec', 'sorters', ['sorter/sublime'])

  " Ag command on grep source
  " call denite#custom#var('grep', 'command', ['ag'])
  " call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
  " call denite#custom#var('grep', 'recursive_opts', [])
  " call denite#custom#var('grep', 'pattern_opt', [])
  " call denite#custom#var('grep', 'separator', ['--'])
  " call denite#custom#var('grep', 'final_opts', [])

  " Ripgrep command on grep source
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--no-heading', '--glob=!tags', '--glob=!*.temp', '-S'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])

  call denite#custom#source('grep', 'converters', ['converter_abbr_word'])

  " Change mappings.
  call denite#custom#map('normal','<C-n>', '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('normal', '<C-p>', '<denite:move_to_previous_line>',  'noremap')
  call denite#custom#map('insert','<C-n>', '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>',  'noremap')

  call denite#custom#map('insert', '<C-t>', '<denite:do_action:tabopen>', 'noremap')
  call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>', 'noremap')
  call denite#custom#map('insert', '<C-h>', '<denite:do_action:split>', 'noremap')

  " git ls-files
  call denite#custom#alias('source', 'file/rec/git', 'file/rec')
  call denite#custom#var('file/rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])

  " call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>', 'noremap')
  " call denite#custom#map('normal', '<Esc>', '<NOP>', 'noremap')
  " call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>', 'noremap')
  " call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>', 'noremap')
  " call denite#custom#map('normal', 'dw', '<denite:delete_word_after_caret>', 'noremap')

  " nnoremap <silent> <C-p> :<C-u>Denite `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<CR>

  nnoremap <leader>* :<C-u>DeniteCursorWord grep:. -no-empty -highlight-mode-insert=Search -post-action=suspend<CR>
  nnoremap <leader>/ :<C-u>Denite grep:. -no-empty -highlight-mode-insert=Search -post-action=suspend<CR>
  nnoremap <leader>? :<C-u>DeniteBufferDir grep:. -no-empty -highlight-mode-insert=Search -post-action=suspend<CR>

  " nnoremap <leader>og :<C-u>Denite `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<CR>
  nnoremap <M-p> :<C-u>Denite file/rec -highlight-mode-insert=Search<CR>
  " nnoremap <<leader>fleader>b :<C-u>Denite buffer -highlight-mode-insert=Search<CR>
  " nnoremap <leader>o<leader>fo :<C-u>DeniteBufferDir file/rec -highlight-mode-insert=Search<CR>
  nnoremap <M-P> :<C-u>Denite file_mru -highlight-mode-insert=Search<CR>
  nnoremap <M-o> :<C-u>Denite outline -highlight-mode-insert=Search<CR>

  " highlight deniteMatchedChar cterm=reverse gui=reverse
  " call denite#custom#option('_', 'highlight_mode_insert', 'CursorLine')
  " call denite#custom#option('_', 'highlight_matched_range', 'None')
  " call denite#custom#option('_', 'highlight_matched_char', 'None')
endif

""""""""""""""""""""""""""""""
" -> FZF
""""""""""""""""""""""""""""""
" File search
nmap <M-p> :Files<CR>

" Mapping selecting mappings
" nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-w> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)


" Advanced customization using autoload functions
" inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})


""""""""""""""""""""""""""""""
" -> cpsm
""""""""""""""""""""""""""""""
" let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

""""""""""""""""""""""""""""""
" -> emmet-vim
""""""""""""""""""""""""""""""
let g:user_emmet_mode='a'
" let g:user_emmet_leader_key='<C-Z>'
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall


""""""""""""""""""""""""""""""
" -> snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
" ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
" snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Nerd Tree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\~$']
let g:NERDTreeWinSize=35
map <leader>n :NERDTreeToggle<cr>
" map <leader>nb :NERDTreeFromBookmark<Space>
" map <leader>nf :NERDTreeFind<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> nerdtree-tab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:nerdtree_tabs_open_on_console_startup=1
" map <Leader>n <plug>NERDTreeTabsToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> nerdtree-highlights
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeLimitedSyntax = 1 " Disable uncommon file extensions highlighting
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name


""""""""""""""""""""""""""""""
" -> Startify plugin
""""""""""""""""""""""""""""""
" autocmd VimEnter *
"             \   if !argc()
"             \ |   NERDTree
"             \ |   Startify
"             \ |   wincmd w
"             \ | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-multiple-cursors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:multi_cursor_next_key="\<C-s>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> surround.vim config
" Annotate strings with gettext
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#fnamemod = ':t:r'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_buffers = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#keymap_ignored_filetypes = ['vimfiler', 'nerdtree']
let g:airline_highlighting_cache = 1
let g:airline#extensions#whitespace#enabled = 0

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> lightline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:lightline = {
" \ 'colorscheme': 'powerline',
" \ 'active': {
" \     'left': [
" \          ['mode', 'paste'],
" \          ['fugitive', 'readonly', 'absolutepath', 'modified']
" \    ],
" \     'right': [
" \          [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
" \          [ 'lineinfo' ],
" \          ['percent']
" \    ]
" \ },
" \ 'component': {
" \   'fugitive': '%{exists("*fugitive#head")?" ".fugitive#head():""}',
" \   'lineinfo': ' %3l:%-2v',
" \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
" \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
" \ },
" \ 'component_visible_condition': {
" \   'readonly': '(&filetype!="help"&& &readonly)',
" \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
" \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
" \ },
" \ 'separator': { 'left': '', 'right': '' },
" \ 'subseparator': { 'left': '', 'right': '' }
" \ }

" let g:lightline.component_type = {
" \     'linter_checking': 'left',
" \     'linter_warnings': 'warning',
" \     'linter_errors': 'error',
" \     'linter_ok': 'left',
" \ }

" let g:lightline.component_expand = {
" \  'linter_checking': 'lightline#ale#checking',
" \  'linter_warnings': 'lightline#ale#warnings',
" \  'linter_errors': 'lightline#ale#errors',
" \  'linter_ok': 'lightline#ale#ok',
" \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set diffopt += vertical


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Goyo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:goyo_width=100
" let g:goyo_margin_top = 2
" let g:goyo_margin_bottom = 2
" nnoremap <silent> <leader>z :Goyo<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Vim-go
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> deoplete-go
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
  let g:deoplete#sources#go#gocode_binary = "/Users/jade/go/bin/gocode"
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> ALE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ale_completion_enabled = 1
let g:ale_linters = {
      \   'javascript': ['tsserver', 'prettier', 'eslint'],
      \   'python': ['autopep8', 'pylint'],
      \   'go': ['gofmt', 'goimports', 'golint', 'golangserver', 'go vet'],
      \   'typescript': ['typecheck', 'prettier', 'eslint'],
      \   'vim': ['vint'],
      \   'xml': ['xmllint'],
      \   'scss': ['prettier', 'stylelint'],
      \   'sass': ['stylelint'],
      \   'json': ['prettier']
      \}

let g:ale_fixers = {
      \   'javascript': [
      \       'eslint',
      \       'importjs'
      \   ],
      \}
" \   'go': [
" \       'gofmt',
" \       'goimports'
" \   ]
" \       'prettier'

nmap <silent> <leader>aa <Plug>(ale_next_wrap)
nmap <silent> <leader>af <Plug>(ale_fix)

" Disabling highlighting
" let g:ale_set_highlights = 0

" Only run linting when saving the file
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Git gutter (Git diff)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:gitgutter_enabled=0
" nnoremap <silent> <leader>d :GitGutterToggle<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Easy Motion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_smartcase = 1
" map , <Plug>(easymotion-prefix)
nmap <leader>j <Plug>(easymotion-overwin-w)

map  <Leader>f <Plug>(easymotion-overwin-f)
nmap <Leader>F <Plug>(easymotion-overwin-f2)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> nerdcommenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'both'

" Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
" let g:NERDToggleCheckAllLines = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Colorizer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:colorizer_auto_color = 0
" let g:colorizer_skip_comments = 1
let g:colorizer_auto_filetype='css,html,javascript,javascript.jsx'
" let g:colorizer_nomap = 1
let g:colorizer_hex_pattern = ['#', '\%(\x\{6}\|\x\{3}\)', '']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> ultisnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:UltiSnipsExpandTrigger = '<C-E>'
" let g:UltiSnipsListSnippets = '<C-S-E>'
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom_snippets"]
let g:UltiSnipsListSnippets = '<C-l>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> EditorConfig
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:EditorConfig_verbose = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> GutentTags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:gutentags_project_root = []
let g:gutentags_ctags_exclude = ['none_modules/*', '.*']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> comfortable-motion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
" noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
" let g:comfortable_motion_interval = 9000 / 60
" let g:comfortable_motion_friction = 0.0
" let g:comfortable_motion_air_drag = 4.0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> indentLine
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = "¦"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> devicons
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsOS = 'Darwin'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> LanguageClient-neovim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
  let g:LanguageClient_serverCommands = {
        \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
        \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
        \ 'javascript.jsx': ['/usr/local/bin/javascript-typescript-stdio'],
        \ 'python': ['/usr/local/bin/pyls'],
        \ 'go': ['go-langserver'],
        \ 'c': ['/usr/local/bin/ccls', '--log-file=/tmp/cc.log'],
        \ 'cpp': ['/usr/local/bin/ccls', '--log-file=/tmp/cc.log'],
        \ 'cuda': ['/usr/local/bin/ccls', '--log-file=/tmp/cc.log'],
        \ 'objc': ['/usr/local/bin/ccls', '--log-file=/tmp/cc.log'],
        \}
  " \ 'c': ['/usr/local/bin/ccls', '--log-file=/usr/local/var/log/cquery/cq.log', '--init={"cacheDirectory":"/var/cquery/", "completion": {"filterAndSort": false}}' ],
  " \ 'cpp': ['/usr/local/bin/ccls', '--log-file=/usr/local/var/log/cquery/cq.log', '--init={"cacheDirectory":"/var/cquery/", "completion": {"filterAndSort": false}}' ]

  " Automatically start language servers.
  let g:LanguageClient_autoStart = 1
  let g:LanguageClient_selectionUI = 'quickfix'

  autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
  autocmd FileType javascript.jsx setlocal omnifunc=LanguageClient#complete
  " autocmd FileType go setlocal omnifunc=LanguageClient#complete
  autocmd FileType python setlocal omnifunc=LanguageClient#complete
  autocmd FileType rust setlocal omnifunc=LanguageClient#complete

  " if !executable('javascript-typescript-stdio')
  " echo "javascript-typescript-stdio not installed!\n"
  " endif

  nnoremap <silent> <leader>ww :call LanguageClient_contextMenu()<CR>
  nnoremap <silent> <leader>wh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> <leader>wd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <leader>wr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <silent> <leader>ws :Denite documentSymbol -highlight-mode-insert=Search -mode=insert<CR>
  nnoremap <silent> <leader>wS :Denite workspaceSymbol -highlight-mode-insert=Search -mode=insert<CR>

  augroup LanguageClient_config_ccls
    au!
    au BufEnter * let b:Plugin_LanguageClient_started = 0
    au User LanguageClientStarted setl signcolumn=yes
    au User LanguageClientStarted let b:Plugin_LanguageClient_started = 1
    au User LanguageClientStopped setl signcolumn=auto
    au User LanguageClientStopped let b:Plugin_LanguageClient_started = 0
    au CursorMoved * if b:Plugin_LanguageClient_started | sil call LanguageClient#textDocument_documentHighlight() | endif

    nn <silent> xh :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'L'})<cr>
    nn <silent> xj :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'D'})<cr>
    nn <silent> xk :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'U'})<cr>
    nn <silent> xl :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'R'})<cr>
  augroup END

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> tsuquyomi
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:tsuquyomi_javascript_support = 1
" let g:tsuquyomi_auto_open = 1
" let g:tsuquyomi_disable_quickfix = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> deoplete-ternjs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if has('nvim')
"     let g:tern#command = ["tern"]
"     let g:tern#arguments = ["--persistent"]
"     let g:deoplete#sources#ternjs#include_keywords = 1
"     let g:deoplete#sources#ternjs#docs = 1
"     let g:deoplete#sources#ternjs#filetypes = [ 'javascript', 'jsx', 'javascript.jsx', 'vue' ]
" endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Sneak
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> closetag
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
" let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
" let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
" let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
" let g:closetag_xhtml_filetypes = 'xhtml,jsx,javascript.jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
" let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
" let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
" let g:closetag_close_shortcut = '<leader>>'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> semantic-highlighing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let s:semanticGUIColors = [ '#72d572', '#c5e1a5', '#e6ee9c', '#fff59d', '#ffe082', '#ffcc80', '#ffab91', '#bcaaa4', '#b0bec5', '#ffa726', '#ff8a65', '#f9bdbb', '#f9bdbb', '#f8bbd0', '#e1bee7', '#d1c4e9', '#ffe0b2', '#c5cae9', '#d0d9ff', '#b3e5fc', '#b2ebf2', '#b2dfdb', '#a3e9a4', '#dcedc8' , '#f0f4c3', '#ffb74d' ]
" let g:semanticTermColors = [28,1,2,3,4,5,6,7,25,9,10,34,12,13,14,15,16,125,124,19]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> ctrlspace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <silent><C-p> :CtrlSpace O<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:tagbar_left = 1
let g:tagbar_vertical = 25


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> maximizer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:maximizer_set_default_mapping = 0
nnoremap <silent><leader>m :MaximizerToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> incsearch
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> anzu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
" map N <Plug>(is-nohl)<Plug>(anzu-N-with-echo)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-over
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <leader>su <C-u>:OverCommandLine<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> clever-f
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:clever_f_across_no_line = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> AutoPairs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairsShortcutToggle = ''


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-autoformat
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:formatter_yapf_style = 'google'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> QuickScope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:qs_lazy_highlight = 1
" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-table-mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:table_mode_corner_corner='+'
" let g:table_mode_header_fillchar='='


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-easy-align
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" -> rainbow
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_strikethrough = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> FlyGrep
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:spacevim_debug_level = 1
" let g:FlyGrep_input_delay = 100
" nnoremap <leader>/ :<C-u>FlyGrep<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-tmux-navigator
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmux_navigator_disable_when_zoomed = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Override color
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !has("gui_running") && !has("gui_vimr")
  hi Normal guibg=NONE
  hi NonText guibg=NONE
  " hi LineNr guibg=NONE
  " hi SignColumn guibg=NONE
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
