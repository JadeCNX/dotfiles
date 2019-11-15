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

if has('python3')
  Plug 'SirVer/ultisnips' " ultimate snippet
  Plug 'Valloric/MatchTagAlways'
endif

let s:completion_manager = ''

if executable('node')
  let s:completion_manager = 'coc'
elseif has('python3')
  let s:completion_manager = 'deoplete'
endif

if s:completion_manager == 'deoplete'
  Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
  Plug 'carlitux/deoplete-ternjs'
  Plug 'deoplete-plugins/deoplete-tag'
  Plug 'Shougo/defx.nvim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/echodoc.vim'
  Plug 'zchee/deoplete-go', {'build': 'make', 'for': 'go'}

  " Plug 'Shougo/unite-outline'
  " Plug 'Shougo/neoyank.vim'
  " Plug 'Shougo/denite.nvim'
  " Plug 'Shougo/neomru.vim'
  " Plug 'zacharied/denite-nerdfont'

elseif s:completion_manager == 'coc'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

if empty(glob('/usr/local/opt/fzf'))
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
else
  Plug '/usr/local/opt/fzf'
endif

Plug 'AndrewRadev/linediff.vim', {'on': 'Linediff'}
Plug 'AndrewRadev/splitjoin.vim'
Plug 'bps/vim-textobj-python'
Plug 'Chiel92/vim-autoformat', {'on': 'Autoformat'}
Plug 'chrisbra/Colorizer'
Plug 'chrisbra/csv.vim'
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
Plug 'idanarye/vim-vebugger'
Plug 'itchyny/calendar.vim'
Plug 'jceb/vim-orgmode', {'for': 'org'}
Plug 'jiangmiao/auto-pairs'
Plug 'jph00/swift-apple'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
Plug 'junegunn/vim-easy-align', {'on': '<Plug>(EasyAlign)'}
Plug 'justinmk/vim-sneak', {'on': ['<Plug>Sneak_f', '<Plug>Sneak_F', '<Plug>Sneak_t', '<Plug>Sneak_T']}
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
Plug 'liuchengxu/vista.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'metakirby5/codi.vim'
Plug 'mhinz/vim-signify'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mxw/vim-jsx', {'for': ['javascript', 'javascript.jsx']}
Plug 'nixprime/cpsm', { 'do': 'bash install.sh' }
Plug 'osyo-manga/vim-anzu'
Plug 'osyo-manga/vim-over'
Plug 'othree/javascript-libraries-syntax.vim', {'for': ['javascript', 'javascript.jsx']}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'plytophogy/vim-virtualenv', {'for': 'python'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for':['javascript', 'javascript.jsx', 'typescript', 'typescript.tsx', 'json']}
Plug 'JadeCNX/diffchar.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'severin-lemaignan/vim-minimap', {'on': ['Minimap', 'MinimapToggle']}
Plug 'sheerun/vim-polyglot'
Plug 'soywod/kronos.vim'
Plug 'szw/vim-maximizer'
Plug 'terryma/vim-expand-region'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'timcharper/textile.vim', {'for': ['textile']}
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish' " Abbreviation substitution
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tweekmonster/fzf-filemru'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Flex-4', {'for': 'actionscript'}
Plug 'vim-scripts/utl.vim'
Plug 'wellle/targets.vim'
Plug 'wellle/visual-split.vim'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install', 'for': ['javascript', 'javascript.jsx', 'typescript'] }
Plug 'Yggdroot/indentLine'
Plug 'yuttie/comfortable-motion.vim' " Inertial-scroll

" Plug 'airblade/vim-gitgutter'
" Plug 'alvan/vim-clotag'
" Plug 'amix/vim-zenroom2'
" Plug 'ashisha/image.vim'
" Plug 'bagrat/vim-workspace'
" Plug 'bfredl/nvim-miniyank'
" Plug 'blindFS/vim-taskwarrior'
" Plug 'blueyed/vim-diminactive'
" Plug 'chr4/nginx.vim'
" Plug 'ctrlpvim/ctrlp.vim'
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
" Plug 'lifepillar/vim-colortemplate'
" Plug 'lilydjwg/colorizer'
" Plug 'lornix/vim-scrollbar'
" Plug 'lvht/mru'
" Plug 'lyokha/vim-xkbswitch'
" Plug 'maxbrunsfeld/vim-yankstack'
" Plug 'maximbaz/lightline-ale'
" Plug 'mhartington/deoplete-typescript'
" Plug 'mhinz/vim-startify'
" Plug 'mileszs/ack.vim'
" Plug 'nsf/gocode'
" Plug 'Quramy/tsuquyomi'
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
" Plug 'rhysd/clever-f.vim'
" Plug 'rizzatti/dash.vim', {'on':'Dash'}
" Plug 'roman/golden-ratio'
" Plug 'roxma/vim-paste-easy'
" Plug 'rust-lang/rust.vim'
" Plug 'ryvnf/readline.vim'
" Plug 'svermeulen/vim-easyclip'
" Plug 'svermeulen/vim-extended-ft'
" Plug 'tacahiroy/ctrlp-funky'
" Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
" Plug 'terryma/vim-multiple-cursors'
" Plug 'tomtom/tlib_vim'
" Plug 'tpope/vim-vinegar'
" Plug 'unblevable/quick-scope' " highlight f,t move
" Plug 'Valloric/YouCompleteMe'
" Plug 'vim-ctrlspace/vim-ctrlspace'
" Plug 'vim-flake8'
" Plug 'vim-scripts/mru.vim' " most recently use
" Plug 'vim-scripts/SyntaxRange'
" Plug 'vim-scripts/taglist.vim'
" Plug 'vim-scripts/YankRing.vim'
" Plug 'vim-vdebug/vdebug'
" Plug 'w0rp/ale'
" Plug 'wsdjeg/FlyGrep.vim'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-notes'
" Plug 'xolox/vim-session'
" Plug 'zhou13/vim-easyescape'

" Color schemes
Plug 'joshdick/onedark.vim'
" Plug 'altercation/vim-colors-solarized'
" Plug 'challenger-deep-theme/vim'
" Plug 'chriskempson/base16-vim'
" Plug 'flazz/vim-colorschemes'
" Plug 'gregsexton/Atom'
" Plug 'jaxbot/semantic-highlight.vim'
" Plug 'lifepillar/vim-solarized8'
" Plug 'morhetz/gruvbox'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'phanviet/vim-monokai-pro'
" Plug 'rakr/vim-one'
" Plug 'sainnhe/vim-color-vanilla-cake'
" Plug 'sonph/onehalf', {'rtp': 'vim' }
Plug 'srcery-colors/srcery-vim'
" Plug 'tomasiser/vim-code-dark'
" Plug 'vim-scripts/mayansmoke'
" Plug 'vim-scripts/peaksea'
" Plug 'vim-scripts/pyte'
" Plug 'w0ng/vim-hybrid'

" Initialize plugin system
call plug#end()

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

" Colorscheme
set background=dark
colorscheme srcery


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
"   let g:ctrlp_user_command = 'fd --type f --color=never "" %s'

" elseif executable('rg')
"   set grepprg=rg\ --color=never
"   let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
"   let g:ctrlp_use_caching = 0

" elseif executable('ag')
"   set grepprg=ag\ --nogroup\ --nocolor

"   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

"   " ag is fast enough that CtrlP doesn't need to cache
"   let g:ctrlp_use_caching = 0
" endif

" let g:ctrlp_map = '<c-f>'
" nnoremap <leader>p :CtrlPMixed<cr>
" nnoremap <leader>P :CtrlPMRU<cr>
" " map <M-b> :CtrlPBuffer<cr>

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
"   hi CursorLine guibg=darkred
" endfunction

" function! BrightHighlightOff()
"   hi CursorLine guibg=#2c323c
" endfunction


""""""""""""""""""""""""""""""
" -> ctrlp-funky
""""""""""""""""""""""""""""""
" let g:ctrlp_funky_syntax_highlight = 1
" nnoremap <M-o> :CtrlPFunky<CR>


""""""""""""""""""""""""""""""
" -> Deoplete
""""""""""""""""""""""""""""""
if s:completion_manager == 'deoplete'
  call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
  call deoplete#custom#var('around', {
        \   'range_above': 50,
        \   'range_below': 50,
        \   'mark_above': '[↑]',
        \   'mark_below': '[↓]',
        \   'mark_changes': '[*]',
        \})

  call deoplete#custom#source('ultisnips', 'rank', 1000)
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
if s:completion_manager == 'deoplete'
  augroup deniteresize
    autocmd!
    autocmd VimResized,VimEnter * call denite#custom#option('default',
          \'winheight', winheight(0) / 3)
  augroup end

  call denite#custom#option('default', {
        \ 'auto_resize': 1,
        \ 'winheight': 15,
        \ 'vertical_preview': 1
        \ })

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

  if executable('ag')
    " Ag command on grep source
    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
  elseif executable('rg')
    " Ripgrep command on grep source
    call denite#custom#var('grep', 'command', ['rg'])
    call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--no-heading', '--glob=!tags', '--glob=!*.temp', '-S'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
  endif

  call denite#custom#source('grep', 'converters', ['converter_abbr_word'])

  " Change mappings.
  call denite#custom#map('normal','<C-n>', '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('normal', '<C-p>', '<denite:move_to_previous_line>',  'noremap')

  call denite#custom#map('insert','<C-n>', '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>',  'noremap')

  call denite#custom#map('normal', '<C-t>', '<denite:do_action:tabopen>', 'noremap')
  call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>', 'noremap')
  call denite#custom#map('normal', '<C-h>', '<denite:do_action:split>', 'noremap')

  call denite#custom#map('insert', '<C-t>', '<denite:do_action:tabopen>', 'noremap')
  call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>', 'noremap')
  call denite#custom#map('insert', '<C-h>', '<denite:do_action:split>', 'noremap')

  call denite#custom#map('insert', '<C-e>', '<denite:do_action:preview>', 'noremap')
  call denite#custom#map('normal', '<C-e>', '<denite:do_action:preview>', 'noremap')

  " git ls-files
  call denite#custom#alias('source', 'file/rec/git', 'file/rec')
  call denite#custom#var('file/rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])

  " call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>', 'noremap')
  " call denite#custom#map('normal', '<Esc>', '<NOP>', 'noremap')
  " call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>', 'noremap')
  " call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>', 'noremap')
  " call denite#custom#map('normal', 'dw', '<denite:delete_word_after_caret>', 'noremap')

  " nnoremap <silent> <C-p> :<C-u>Denite `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<CR>

  " nnoremap <leader>* :<C-u>DeniteCursorWord grep:. -no-empty -post-action=suspend -auto-resume<CR>
  " nnoremap <leader>/ :<C-u>Denite grep:. -no-empty -post-action=suspend -auto-resume<CR>
  " nnoremap <leader>? :<C-u>DeniteBufferDir grep:. -no-empty -post-action=suspend -auto-resume<CR>

  " nnoremap <leader>og :<C-u>Denite `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<CR>
  " nnoremap <<leader>fleader>b :<C-u>Denite buffer <CR>
  " nnoremap <leader>o<leader>fo :<C-u>DeniteBufferDir file/rec <CR>
  " nnoremap <leader>p :<C-u>Denite buffer file/rec <CR>
  " nnoremap <leader>P :<C-u>Denite file_mru <CR>
  nnoremap <leader>o :<C-u>Denite outline <CR>

  " highlight deniteMatchedChar cterm=reverse gui=reverse
  " call denite#custom#option('_', 'highlight_mode_insert', 'CursorLine')
  " call denite#custom#option('_', 'highlight_matched_range', 'None')
  " call denite#custom#option('_', 'highlight_matched_char', 'None')

  " Define mappings
  autocmd FileType denite call s:denite_my_settings()
  function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q denite#do_map('quit')
    nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
  endfunction

  autocmd FileType denite-filter call s:denite_filter_my_settings()
  function! s:denite_filter_my_settings() abort
    imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
  endfunction

  " Change default action.
  " call denite#custom#kind('file', 'default_action', 'split')

  " Add custom menus
  let s:menus = {}

  let s:menus.zsh = {
        \ 'description': 'Edit your import zsh configuration'
        \ }
  let s:menus.zsh.file_candidates = [
        \ ['zshrc', '~/.config/zsh/.zshrc'],
        \ ['zshenv', '~/.zshenv'],
        \ ]

  let s:menus.my_commands = {
        \ 'description': 'Example commands'
        \ }
  let s:menus.my_commands.command_candidates = [
        \ ['Split the window', 'vnew'],
        \ ['Open zsh menu', 'Denite menu:zsh'],
        \ ['Format code', 'FormatCode', 'go,python'],
        \ ]

  call denite#custom#var('menu', 'menus', s:menus)

  " Specify multiple paths in grep source
  "call denite#start([{'name': 'grep',
  "      \ 'args': [['a.vim', 'b.vim'], '', 'pattern']}])
endif

""""""""""""""""""""""""""""""
" -> FZF
""""""""""""""""""""""""""""""
" File search
nmap <silent> <leader>p :FilesMru --tiebreak=end<CR>
nnoremap  <silent> <leader>P :History<cr>

" Mapping selecting mappings
" nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-w> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

if executable('ag')
  vmap <leader>* :<C-u>call <SID>fzfGrebFromSelected(visualmode(), 'Ag')<CR>
  nmap <leader>* :exe 'Ag '.expand('<cword>')<CR>
  nmap <leader>/ :<C-u>Ag<CR>
  " nmap <leader>? :<C-u>Ag<CR>

  command! -bang -nargs=* Ag
        \ call fzf#vim#ag(<q-args>,
        \                 <bang>0 ? fzf#vim#with_preview('up:60%')
        \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
        \                 <bang>0)

elseif executable('rg')
  vmap <leader>* :<C-u>call <SID>fzfGrebFromSelected(visualmode(), 'Rg')<CR>
  nmap <leader>* :exe 'Rg '.expand('<cword>')<CR>
  nmap <leader>/ :<C-u>Rg<CR>
  " nmap <leader>? :<C-u>Rg<CR>

  " Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
  command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
        \   <bang>0 ? fzf#vim#with_preview('up:60%')
        \           : fzf#vim#with_preview('right:50%:hidden', '?'),
        \   <bang>0)
else
  command! -bang -nargs=* GGrep
        \ call fzf#vim#grep(
        \   'git grep --line-number '.shellescape(<q-args>), 0,
        \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)
  vmap <leader>* :<C-u>call <SID>fzfGrebFromSelected(visualmode(), 'GGrep')<CR>
  nmap <leader>* :exe 'GGrep '.expand('<cword>')<CR>
  nmap <leader>/ :<C-u>GGrep<CR>
  " nmap <leader>? :<C-u>GGrep<CR>
endif

function! s:fzfGrebFromSelected(type, cmd)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute cmd.' '.word
endfunction

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

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
" -> Nerdtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\~$']
let NERDTreeNodeDelimiter="\x07"
let NERDTreeMinimalUI=1

let g:NERDTreeWinSize=35

map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
" map <leader>nb :NERDTreeFromBookmark<Space>

" autocmd VimLeave * NERDTreeClose
autocmd VimLeavePre * NERDTreeClose
" autocmd VimEnter * NERDTree


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
let airline_theme='srcery'
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

" let g:airline#extensions#tmuxline#enabled = 1
" let airline#extensions#tmuxline#color_template = 'replace'
" let airline#extensions#tmuxline#snapshot_file = "~/.tmux-statusline-colors.conf"

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" 
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

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
" if has('nvim')
"   let g:deoplete#sources#go#gocode_binary = "/Users/jade/go/bin/gocode"
" endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> ALE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ale_completion_enabled = 1
" let g:ale_linters = {
"       \   'javascript': ['tsserver', 'prettier', 'eslint'],
"       \   'python': ['autopep8', 'pylint'],
"       \   'go': ['gofmt', 'goimports', 'golint', 'golangserver', 'go vet'],
"       \   'typescript': ['typecheck', 'prettier', 'eslint'],
"       \   'vim': ['vint'],
"       \   'xml': ['xmllint'],
"       \   'scss': ['prettier', 'stylelint'],
"       \   'sass': ['stylelint'],
"       \   'json': ['prettier']
"       \}

" let g:ale_fixers = {
"       \   'javascript': [
"       \       'eslint',
"       \       'importjs'
"       \   ],
"       \}
" \   'go': [
" \       'gofmt',
" \       'goimports'
" \   ]
" \       'prettier'

" nmap <silent> <leader>aa <Plug>(ale_next_wrap)
" nmap <silent> <leader>af <Plug>(ale_fix)

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
nmap <leader>j <Plug>(easymotion-overwin-f)

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
" let g:colorizer_auto_filetype='css,html,javascript,javascript.jsx'
" let g:colorizer_nomap = 1
let g:colorizer_hex_pattern = ['#', '\%(\x\{6}\|\x\{3}\)', '']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> ultisnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger = '<NOP>'
let g:UltiSnipsListSnippets = '<NOP>'
let g:UltiSnipsJumpForwardTrigger = '<TAB>'
let g:UltiSnipsJumpBackwardTrigger = '<S-TAB>'
" let g:UltiSnipsListSnippets = '<C-S-E>'
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom_snippets"]

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
let g:indentLine_char = "┊"
let g:indentLine_setColors = 1
let g:indentLine_fileTypeExclude = ['calendar']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> devicons
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsOS = 'Darwin'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> LanguageClient-neovim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if s:completion_manager == 'deoplete'
  let g:LanguageClient_serverCommands = {
        \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
        \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio', '--logfile /tmp/lsp/javascript-typescript-stdio.log'],
        \ 'javascript.jsx': ['/usr/local/bin/javascript-typescript-stdio', '--logfile /tmp/lsp/javascript-typescript-stdio.log'],
        \ 'python': ['/usr/local/bin/pyls', '--log-file /tmp/lsp/pyls.log'],
        \ 'go': ['go-langserver'],
        \ 'c': ['/usr/local/bin/ccls', '--log-file=/tmp/lsp/cc.log'],
        \ 'cpp': ['/usr/local/bin/ccls', '--log-file=/tmp/lsp/cc.log'],
        \ 'cuda': ['/usr/local/bin/ccls', '--log-file=/tmp/lsp/cc.log'],
        \ 'objc': ['/usr/local/bin/ccls', '--log-file=/tmp/lsp/cc.log'],
        \}
  " \ 'c': ['/usr/local/bin/ccls', '--log-file=/usr/local/var/log/cquery/cq.log', '--init={"cacheDirectory":"/var/cquery/", "completion": {"filterAndSort": false}}' ],
  " \ 'cpp': ['/usr/local/bin/ccls', '--log-file=/usr/local/var/log/cquery/cq.log', '--init={"cacheDirectory":"/var/cquery/", "completion": {"filterAndSort": false}}' ]

  " Automatically start language servers.
  let g:LanguageClient_autoStart = 1
  " let g:LanguageClient_selectionUI = 'quickfix'

  " autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
  " autocmd FileType javascript.jsx setlocal omnifunc=LanguageClient#complete
  " " autocmd FileType go setlocal omnifunc=LanguageClient#complete
  " autocmd FileType python setlocal omnifunc=LanguageClient#complete
  " autocmd FileType rust setlocal omnifunc=LanguageClient#complete

  " autocmd FileType c setlocal omnifunc=LanguageClient#complete
  " autocmd FileType cpp setlocal omnifunc=LanguageClient#complete
  " autocmd FileType cuda setlocal omnifunc=LanguageClient#complete
  " autocmd FileType objc setlocal omnifunc=LanguageClient#complete


  " if !executable('javascript-typescript-stdio')
  " echo "javascript-typescript-stdio not installed!\n"
  " endif

  nnoremap <silent> <leader>ww :call LanguageClient_contextMenu()<CR>
  nnoremap <silent> <leader>wh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> <leader>wd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <leader>wr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <silent> <leader>O :Denite documentSymbol -highlight-mode-insert=Search -mode=insert<CR>
  nnoremap <silent> <leader>wS :Denite workspaceSymbol -highlight-mode-insert=Search -mode=insert<CR>

  augroup LanguageClient_config_ccls
    au!
    au BufEnter * let b:Plugin_LanguageClient_started = 0
    au User LanguageClientStarted setl signcolumn=yes
    au User LanguageClientStarted let b:Plugin_LanguageClient_started = 1
    au User LanguageClientStopped setl signcolumn=auto
    au User LanguageClientStopped let b:Plugin_LanguageClient_started = 0
    au CursorMoved * if b:Plugin_LanguageClient_started | sil call LanguageClient#textDocument_documentHighlight() | endif

    nnoremap <silent> <leader>wxh  :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'L'})<cr>
    nnoremap <silent> <leader>wxj  :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'D'})<cr>
    nnoremap <silent> <leader>wxk  :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'U'})<cr>
    nnoremap <silent> <leader>wxl  :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'R'})<cr>
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
" map f <Plug>Sneak_f
" map F <Plug>Sneak_F
" map t <Plug>Sneak_t
" map T <Plug>Sneak_T


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
let g:tagbar_left = 1
let g:tagbar_previewwin_pos = ""
" let g:tagbar_vertical = 25


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
let g:AutoPairsMapSpace = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-autoformat
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:formatter_yapf_style = 'google'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> quick-scope
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
" -> golden-ratio
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:golden_ratio_exclude_nonmodifiable = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> coc.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if s:completion_manager == 'coc'
  let g:coc_global_extensions = [
        \ 'coc-ccls',
        \ 'coc-css',
        \ 'coc-docker',
        \ 'coc-emmet',
        \ 'coc-gocode',
        \ 'coc-highlight',
        \ 'coc-html',
        \ 'coc-json',
        \ 'coc-lists',
        \ 'coc-phpls',
        \ 'coc-prettier',
        \ 'coc-python',
        \ 'coc-rls',
        \ 'coc-snippets',
        \ 'coc-tag',
        \ 'coc-tslint',
        \ 'coc-tsserver',
        \ 'coc-vimlsp',
        \ 'coc-yaml',
        \ 'coc-yank',
        \ 'https://github.com/dsznajder/vscode-es7-javascript-react-snippets' ]
  " \ 'coc-word',
  " \ 'coc-dictionary',
  " \ 'coc-git',

  " inoremap <silent><expr> <TAB>
  "       \ pumvisible() ? "\<C-n>" :
  "       \ <SID>check_back_space() ? "\<TAB>" :
  "       \ coc#refresh()
  " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  " function! s:check_back_space() abort
  "   let col = col('.') - 1
  "   return !col || getline('.')[col - 1]  =~# '\s'
  " endfunction

  " To enable highlight current symbol on CursorHold, add:
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " nmap <leader>p :<C-u>CocList files --ignore-case<CR>
  " nmap <leader>P :<C-u>CocList mru --ignore-case<CR>

  vmap <leader>* :<C-u>call <SID>cocGrepFromSelected(visualmode())<CR>
  nmap <leader>* :exe 'CocList grep '.expand('<cword>')<CR>
  " nmap <leader>/ :<C-u>CocList grep<CR>
  nmap <leader>? :<C-u>CocList grep<CR>

  " command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

  " function! s:GrepArgs(...)
  "   let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
  "         \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  "   return join(list, "\n")
  " endfunction

  " navigate diagnostics
  nmap [w <Plug>(coc-diagnostic-prev)
  nmap ]w <Plug>(coc-diagnostic-next)

  nmap <leader>w. <C-u>:CocListResume<CR>
  nmap <leader>wa <Plug>(coc-codeaction)
  nmap <leader>wr <Plug>(coc-rename)
  nmap <leader>wx <Plug>(coc-fix-current)

  nmap <leader>wd <Plug>(coc-definition)
  nmap <leader>wt <Plug>(coc-type-definition)
  nmap <leader>wi <Plug>(coc-implementation)
  nmap <leader>wg <Plug>(coc-references)

  nmap <leader>we :<C-u>CocList diagnostics<cr>

  nmap <leader>o :<C-u>CocList outline --ignore-case<CR>
  nmap <leader>O :<C-u>CocList symbols<CR>

  " Remap for do action format
  nmap <leader>wf <Plug>(coc-format-selected)<CR>
  vmap <leader>wf <Plug>(coc-format-selected)<CR>

  " show documentation in preview window
  nnoremap <leader>wh :call <SID>show_documentation()<CR>

  nnoremap <leader>wj :<C-u>CocNext<CR>
  nnoremap <leader>wk :<C-u>CocPrev<CR>
  nnoremap <leader>wp :<C-u>CocListResume<CR>

  function! s:show_documentation()
    if &filetype == 'vim'
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " function! s:cocGrepFromSelected(type)
  "   let saved_unnamed_register = @@
  "   if a:type ==# 'v'
  "     normal! `<v`>y
  "   elseif a:type ==# 'char'
  "     normal! `[v`]y
  "   else
  "     return
  "   endif
  "   let word = substitute(@@, '\n$', '', 'g')
  "   let word = escape(word, '| ')
  "   let @@ = saved_unnamed_register
  "   execute 'CocList grep '.word
  " endfunction

  " Use <C-l> for trigger snippet expand.
  imap <C-l> <Plug>(coc-snippets-expand)

  " Use <C-j> for select text for visual placeholder of snippet.
  vmap <C-j> <Plug>(coc-snippets-select)

  " Use <C-j> for jump to next placeholder, it's default of coc.nvim
  let g:coc_snippet_next = '<c-j>'

  " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
  let g:coc_snippet_prev = '<c-k>'

  " Use <C-j> for both expand and jump (make expand higher priority.)
  imap <C-j> <Plug>(coc-snippets-expand-jump)
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-vebugger
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vebugger_leader='<Leader>d'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> diffchar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:DiffColors=3
let g:DiffModeSync=1
let g:DiffCharNoKeyMap=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Calendar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> diffchar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:rainbow_conf = {
      \   'separately': {
      \       'csv': {
      \           'parentheses': ['start=/\v[^,]+|(,\ze,)/ step=/\v\,/ end=/$/ keepend'],
      \       },
      \   }
      \}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vista.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vista#renderer#enable_icon = 1
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-xkbswitch
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:XkbSwitchEnabled = 1
" let g:XkbSwitchLoadRIMappings = 0
" let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
" inoremap ดก <ESC>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-latex-live-preview
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:livepreview_previewer = 'open -a Preview'
let g:livepreview_engine = 'mactex'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-session
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" If you don't want help windows to be restored:
" set sessionoptions-=help

" Don't persist options and mappings because it can corrupt sessions.
" set sessionoptions-=options

" Don't save hidden and unloaded buffers in sessions.
" set sessionoptions-=buffers

" let g:session_autosave='yes'
" let g:session_autoload='yes'

" let g:session_persist_font = 0
" let g:session_persist_colors = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Override color
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi Comment gui=italic
hi Identifier gui=italic
hi StorageClass gui=italic
hi Todo gui=inverse,bold,italic
hi Type gui=italic
hi Underlined gui=underline
hi Function gui=italic
hi Italic gui=italic

" transparent background
if !has("gui_running") && !has("gui_vimr")
  hi Normal guibg=NONE ctermbg=NONE
  hi NonText guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE

  " hi LineNr guibg=NONE ctermbg=NONE
  " hi SignColumn guibg=NONE ctermbg=NONE
  " hi Normal guibg=#212121
  " hi NonText guibg=#212121
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

