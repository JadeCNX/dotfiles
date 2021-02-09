let s:plug_file = '~/.vim/autoload/plug.vim'

if empty(glob(s:plug_file))
  exec 'silent !curl -fLo ' . s:plug_file . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'ryanoasis/vim-devicons'
if !has('nvim')
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

if has('python3')
"   Plug 'SirVer/ultisnips' " ultimate snippet
"   Plug 'Valloric/MatchTagAlways'
endif

let s:completion_manager = ''
let s:search_manager = 'coc'
let s:syntax_manager = ''

if executable('node')
  let s:completion_manager = 'coc'
elseif has('python3')
  let s:completion_manager = 'deoplete'
endif

if has('nvim')
  " let s:syntax_manager = 'treesitter'
  " let s:completion_manager = 'nvim'
endif

if s:completion_manager == 'deoplete'
  Plug 'Shougo/defx.nvim'
  Plug 'Shougo/denite.nvim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/echodoc.vim'
  " Plug 'Shougo/neomru.vim'
  " Plug 'Shougo/neoyank.vim'
  " Plug 'Shougo/unite-outline'
  Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
  Plug 'carlitux/deoplete-ternjs'
  Plug 'deoplete-plugins/deoplete-tag'
  " Plug 'zacharied/denite-nerdfont'
  Plug 'zchee/deoplete-go', {'build': 'make', 'for': 'go'}
  Plug 'nixprime/cpsm', { 'do': 'bash install.sh' }

elseif s:completion_manager == 'coc'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

elseif s:completion_manager == 'nvim'
  " Plug 'aca/completion-tabnine', { 'do': './install.sh' }
  " Plug 'albertoCaroM/completion-tmux'
  " Plug 'kristijanhusak/completion-tags'
  " Plug 'kristijanhusak/vim-dadbod-completion'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  " Plug 'steelsojka/completion-buffers'
  " Plug 'prabirshrestha/vim-lsp'
  " Plug 'mattn/vim-lsp-settings'
endif

if s:syntax_manager == 'treesitter'
  " Plug 'nvim-treesitter/nvim-treesitter-refactor'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  " Plug 'nvim-treesitter/playground'
  Plug 'p00f/nvim-ts-rainbow'
  " Plug 'romgrk/nvim-treesitter-context'
else
  Plug 'sheerun/vim-polyglot'
endif

if executable('ctags')
  Plug 'ludovicchabant/vim-gutentags'
endif

if s:search_manager == 'fzf'
  if empty(glob('/usr/local/opt/fzf'))
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  else
    Plug '/usr/local/opt/fzf'
  endif
  Plug 'junegunn/fzf.vim'
  Plug 'tweekmonster/fzf-filemru'

  " Plug 'jistr/vim-nerdtree-tabs'
  Plug 'preservim/nerdtree', {'on': ['NERDTree', 'NERDTreeFind', 'NERDTreeToggle', 'NERDTreeFocus']}
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight', {'on': ['NERDTree', 'NERDTreeFind', 'NERDTreeToggle', 'NERDTreeFocus']}
  Plug 'Xuyuanp/nerdtree-git-plugin'
endif

" if executable('go') && (has('nvim') || has('sign'))
"   Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
" endif

if has('nvim')
  " Plug 'APZelos/blamer.nvim'
  " Plug 'bfredl/nvim-miniyank'
  " Plug 'kassio/neoterm'
  if s:search_manager == 'clap'
    Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
  endif
  Plug 'norcalli/nvim-colorizer.lua'
endif

" Plug 'airblade/vim-gitgutter'
" Plug 'alvan/vim-closetag'
" Plug 'alvan/vim-clotag'
" Plug 'amix/vim-zenroom2'
Plug 'AndrewRadev/linediff.vim', {'on': 'Linediff'}
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'andymass/vim-matchup'
" Plug 'ashisha/image.vim'
Plug 'bagrat/vim-buffet'
" Plug 'bagrat/vim-workspace'
" Plug 'blindFS/vim-taskwarrior'
" Plug 'blueyed/vim-diminactive'
Plug 'bps/vim-textobj-python'
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
Plug 'chamindra/marvim'
Plug 'Chiel92/vim-autoformat', {'on': 'Autoformat'}
" Plug 'chr4/nginx.vim'
" Plug 'chrisbra/Colorizer'
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'chrisbra/NrrwRgn'
Plug 'chrisbra/unicode.vim'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'cohama/lexima.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'dahu/vim-fanfingtastic'
Plug 'dart-lang/dart-vim-plugin'
Plug 'dbakker/vim-paragraph-motion'
" Plug 'dense-analysis/ale'
" Plug 'devjoe/vim-codequery'
Plug 'dhruvasagar/vim-table-mode'
" Plug 'digitaltoad/vim-pug' " syntax highlighing for Pug (formerly Jade)
" Plug 'dimonomid/auto-pairs-gentle'
Plug 'dyng/ctrlsf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
" Plug 'edkolev/tmuxline.vim'
" Plug 'ervandew/supertab'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'glts/vim-textobj-comment'
Plug 'godlygeek/tabular'
" Plug 'google/vim-codefmt'
" Plug 'google/vim-glaive'
" Plug 'google/vim-maktaba'
" Plug 'google/vim-searchindex'
Plug 'groenewege/vim-less', {'for': 'less'}
Plug 'guns/xterm-color-table.vim', {'on': 'XtermColorTable'}
" Plug 'haya14busa/is.vim'
" Plug 'haya14busa/vim-asterisk'
Plug 'honza/vim-snippets'
Plug 'idanarye/vim-vebugger'
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'itchyny/calendar.vim'
" Plug 'itchyny/lightline.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'
" Plug 'JadeCNX/diffchar.vim'
Plug 'JadeCNX/vim-sleuth'
Plug 'JadeCNX/vim-template'
Plug 'jceb/vim-orgmode', {'for': 'org'}
Plug 'jiangmiao/auto-pairs'
" Plug 'jlanzarotta/bufexplorer'
Plug 'jph00/swift-apple', {'for': 'swift'}
Plug 'Julian/vim-textobj-variable-segment'
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
Plug 'junegunn/vim-easy-align', {'on': '<Plug>(EasyAlign)'}
" Plug 'junegunn/vim-peekaboo'
Plug 'justinmk/vim-sneak', {'on': ['<Plug>Sneak_f', '<Plug>Sneak_F', '<Plug>Sneak_t', '<Plug>Sneak_T']}
" Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
" Plug 'kiteco/vim-plugin'
" Plug 'koron/minimap-vim'
" Plug 'lifepillar/vim-colortemplate'
" Plug 'lilydjwg/colorizer'
Plug 'liuchengxu/vista.vim', {'on': 'Vista'}
" Plug 'lornix/vim-scrollbar'
" Plug 'luochen1990/rainbow'
" Plug 'lvht/mru'
" Plug 'lyokha/vim-xkbswitch'
" Plug 'machakann/vim-sandwich'
" Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
" Plug 'maxbrunsfeld/vim-yankstack'
" Plug 'maximbaz/lightline-ale'
" Plug 'MaxMEllon/vim-jsx-pretty', {'for': ['javascript', 'javascript.jsx', 'typescript', 'typescriptreact']}
" Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'metakirby5/codi.vim'
" Plug 'mhartington/deoplete-typescript'
Plug 'mhinz/vim-signify'
" Plug 'mhinz/vim-startify'
" Plug 'michaeljsmith/vim-indent-object'
" Plug 'mileszs/ack.vim'
" Plug 'mxw/vim-jsx', {'for': ['javascript', 'javascript.jsx']}
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/jsonc.vim'
" Plug 'nsf/gocode'
" Plug 'osyo-manga/vim-anzu'
Plug 'osyo-manga/vim-over'
" Plug 'othree/javascript-libraries-syntax.vim', {'for': ['javascript', 'javascript.jsx']}
" Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'plytophogy/vim-virtualenv', {'for': 'python'}
Plug 'preservim/nerdcommenter'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for':['javascript', 'javascript.jsx', 'typescript', 'typescriptreact', 'json', 'html']}
" Plug 'puremourning/vimspector', { 'do': ':VimspectorInstall --verbose' }
" Plug 'Quramy/tsuquyomi'
" Plug 'Raimondi/delimitMate'
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
" Plug 'rhysd/clever-f.vim'
" Plug 'rhysd/git-messenger.vim'
" Plug 'rizzatti/dash.vim', {'on':'Dash'}
" Plug 'roxma/vim-paste-easy'
" Plug 'rstacruz/vim-closer'
" Plug 'rstacruz/vim-hyperstyle'
" Plug 'rust-lang/rust.vim'
" Plug 'ryvnf/readline.vim'
" Plug 'segeljakt/vim-isotope' " Insert superscripts and subscripts with ease
" Plug 'severin-lemaignan/vim-minimap', {'on': ['Minimap', 'MinimapToggle']}
" Plug 'ShirajG/golden-ratio'
Plug 'simnalamburt/vim-mundo', {'on': ['MundoToggle']}
Plug 'skywind3000/asyncrun.vim'
Plug 'soywod/kronos.vim', {'on': ['Kronos']}
Plug 'stefandtw/quickfix-reflector.vim'
" Plug 'svermeulen/vim-easyclip'
" Plug 'svermeulen/vim-extended-ft'
" Plug 'szw/vim-maximizer'
" Plug 'tacahiroy/ctrlp-funky'
" Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'timcharper/textile.vim', {'for': ['textile']}
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tommcdo/vim-exchange'
" Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-abolish' " Abbreviation substitution
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
" Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-vinegar'
Plug 'troydm/zoomwintab.vim'
" Plug 'unblevable/quick-scope' " highlight f,t move
" Plug 'Valloric/YouCompleteMe'
Plug 'vigoux/LanguageTool.nvim', {'on': ['LanguageToolCheck', 'LanguageToolSummary']}
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'vim-ctrlspace/vim-ctrlspace'
" Plug 'vim-jp/vital.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'vim-scripts/auto-pairs-gentle'
Plug 'vim-scripts/Flex-4', {'for': 'actionscript'}
" Plug 'vim-scripts/mru.vim' " most recently use
" Plug 'vim-scripts/SyntaxRange'
" Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/utl.vim'
" Plug 'vim-scripts/YankRing.vim'
" Plug 'vim-vdebug/vdebug'
Plug 'vim/killersheep'
Plug 'vimwiki/vimwiki'
" Plug 'vn-ki/coc-clap'
" Plug 'wellle/context.vim'
Plug 'wellle/targets.vim'
Plug 'wellle/visual-split.vim'
Plug 'wesQ3/vim-windowswap'
" Plug 'wsdjeg/FlyGrep.vim'
Plug 'xolox/vim-misc'
" Plug 'xolox/vim-notes'
" Plug 'xolox/vim-session'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install', 'on': ['ImportCont']}
" Plug 'Yggdroot/indentLine'
Plug 'yssl/QFEnter'
" Plug 'yuttie/comfortable-motion.vim' " Inertial-scroll
" Plug 'zhou13/vim-easyescape'

" Color schemes
" Plug 'altercation/vim-colors-solarized'
" Plug 'arzg/vim-colors-xcode'
" Plug 'ayu-theme/ayu-vim'
" Plug 'challenger-deep-theme/vim'
" Plug 'chriskempson/base16-vim'
" Plug 'christianchiarulli/nvcode-color-schemes.vim'
" Plug 'flazz/vim-colorschemes'
" Plug 'gregsexton/Atom'
" Plug 'jaxbot/semantic-highlight.vim'
Plug 'joshdick/onedark.vim'
" Plug 'kyoz/purify', { 'rtp': 'vim' }
" Plug 'lifepillar/vim-solarized8'
" Plug 'morhetz/gruvbox'
" Plug 'NLKNguyen/papercolor-theme'
Plug 'phanviet/vim-monokai-pro'
" Plug 'rakr/vim-one'
" Plug 'raphamorim/lucario'
" Plug 'sainnhe/edge'
" Plug 'sainnhe/sonokai'
" Plug 'sainnhe/vim-color-vanilla-cake'
" Plug 'sonph/onehalf', {'rtp': 'vim' }
" Plug 'srcery-colors/srcery-vim'
" Plug 'tomasiser/vim-code-dark'
" Plug 'vim-scripts/mayansmoke'
" Plug 'vim-scripts/peaksea'
" Plug 'vim-scripts/pyte'
" Plug 'w0ng/vim-hybrid'

" Initialize plugin system
call plug#end()

" call glaive#Install()

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
" -> bufExplorer plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:bufExplorerDefaultHelp=0
" let g:bufExplorerShowRelativePath=1
" let g:bufExplorerFindActive=1
" let g:bufExplorerSortBy='name'
" map <leader>o :BufExplorer<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> MRU plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let MRU_Max_Entries = 400
" map <leader>r :MRU<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> YankStack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:yankstack_yank_keys = ['y', 'd']
" let g:yankstack_map_keys = 0
" nmap <C-p> <Plug>yankstack_substitute_older_paste
" nmap <C-S-P> <Plug>yankstack_substitute_newer_paste
" nmap <M-P> <Plug>yankstack_substitute_older_paste
" nmap <M-S-P> <Plug>yankstack_substitute_newer_paste


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> CTRL-P
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> ctrlp-funky
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ctrlp_funky_syntax_highlight = 1
" nnoremap <M-o> :CtrlPFunky<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
  inoremap <expr><S-TAB> pumvisible() ? '<C-p>' : '<S-TAB>'
  inoremap <expr><TAB>  pumvisible() ? '<C-n>' : '<TAB>'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Denite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if s:search_manager  == 'fzf'
  " File search
  nmap <silent> <leader>p :FilesMru --tiebreak=end<CR>
  nmap <silent> <leader>P :History<cr>
  nmap <silent> <leader>b :Buffers<cr>
  nmap <silent> <leader>B :GFiles<cr>
  nmap <silent> <leader>l :Filetypes<cr>

  " Mapping selecting mappings
  " nmap <leader><tab> <plug>(fzf-maps-n)
  " xmap <leader><tab> <plug>(fzf-maps-x)
  " omap <leader><tab> <plug>(fzf-maps-o)

  " Insert mode completion
  imap <c-x><c-w> <plug>(fzf-complete-word)
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)

  if executable('fd')
    imap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
  else
    imap <c-x><c-f> <plug>(fzf-complete-path)
  endif

  if executable('rg')
    function! RipgrepFzf(query, fullscreen)
      let command_fmt = 'rg --column --line-number --vimgrep --no-heading --color=always --smart-case -- %s || true'
      let initial_command = printf(command_fmt, shellescape(a:query))
      let reload_command = printf(command_fmt, '{q}')
      let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
      call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
    endfunction

    function! RipgrepNoIgnoreFzf(query, fullscreen)
      let command_fmt = 'rg -H --no-heading --vimgrep --column --line-number --smart-case --hidden -g "!.git/"' -- %s || true'
      let initial_command = printf(command_fmt, shellescape(a:query))
      let reload_command = printf(command_fmt, '{q}')
      let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
      call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
    endfunction

    command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
    command! -nargs=* -bang RGNoIgnore call RipgrepFzf(<q-args>, <bang>0)

    vmap <leader>* :<C-u>call <SID>fzfGrebFromSelected(visualmode(), 'RG')<CR>
    nmap <leader>* :exe 'RG '.expand('<cword>')<CR>
    nmap <leader>/ :<C-u>RG<CR>
    nmap <leader>? :<C-u>RGNoIgnore<CR>
    " nmap <leader>? :<C-u>RG<CR>

  elseif executable('ag')
    command! -bang -nargs=* Ag
          \ call fzf#vim#ag(<q-args>,
          \                 <bang>0 ? fzf#vim#with_preview('up:60%')
          \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
          \                 <bang>0)

    vmap <leader>* :<C-u>call <SID>fzfGrebFromSelected(visualmode(), 'Ag')<CR>
    nmap <leader>* :exe 'Ag '.expand('<cword>')<CR>
    nmap <leader>/ :<C-u>Ag<CR>
    nmap <leader>? :<C-u>GGrep<CR>
    " nmap <leader>? :<C-u>Ag<CR>

  else
    command! -bang -nargs=* GGrep
          \ call fzf#vim#grep(
          \   'git grep --line-number '.shellescape(<q-args>), 0,
          \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)
    vmap <leader>* :<C-u>call <SID>fzfGrebFromSelected(visualmode(), 'GGrep')<CR>
    nmap <leader>* :exe 'GGrep '.expand('<cword>')<CR>
    nmap <leader>/ :<C-u>GGrep<CR>
    nmap <leader>? :<C-u>GGrep<CR>
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
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> fzf-filemru
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if s:search_manager != 'fzf'
  let g:fzf_filemru_bufwrite = 1
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-clap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if s:search_manager == 'clap'
  nmap <silent> <leader>p :Clap files<CR>
  nmap <silent> <leader>P :Clap files --type f -uu -g "!.git/" .<cr>
  nmap <silent> <leader>b :Clap buffers<cr>
  nmap <silent> <leader>B :Clap history<cr>
  nmap <silent> <leader>l :Clap filetypes<cr>
  nmap <silent> <leader>: :Clap command<cr>
  nmap <silent> <leader>; :Clap command_history<cr>
  nmap <silent> <leader>/ :Clap grep<cr>
  nmap <silent> <leader>? :Clap grep2<cr>
  nmap <silent> <leader>* :Clap grep ++query=<cword><cr>
  vmap <silent> <leader>* :Clap grep ++query=@visual<cr>

  " coc-clap
  " nmap <leader>wa :<C-u>Clap coc_actions<CR>
  " nmap <leader>wc :<C-u>Clap coc_commands<CR>
  " nmap <leader>we :<C-u>Clap coc_diagnostics<cr>
  " nmap <leader>o :<C-u>Clap coc_outline<CR>
  " nmap <leader>O :<C-u>Clap coc_services<CR>

  " let g:clap_theme = 'material_design_dark'
  let g:clap_layout = { 'relative': 'editor' }
  let g:clap_popup_border = 'nil'
  let g:clap_insert_mode_only = v:true
  " let g:clap_provider_grep_opts = '-H --no-heading --vimgrep --smart-case --hidden -g "!.git/"'
  let g:clap_search_box_border_style = 'nil'
  let g:clap_disable_run_rooter = v:true

  let g:clap_forerunner_status_sign = { 'running': '!', 'done': '•', 'using_cache': '*' }

  if has('nvim')
    autocmd FileType clap_input inoremap <silent> <buffer> <C-n> <C-R>=clap#navigation#linewise('down')<CR>
    autocmd FileType clap_input inoremap <silent> <buffer> <C-p> <C-R>=clap#navigation#linewise('up')<CR>
  else
    let g:clap_popup_move_manager = {
          \ "\<C-N>": "\<Down>",
          \ "\<C-P>": "\<Up>",
          \ }
  endif
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> cpsm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> emmet-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_mode='a'
" let g:user_emmet_leader_key='<C-Z>'
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> snipMate (beside <TAB> support <CTRL-j>)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
" snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if s:completion_manager != 'coc'
  " let g:NERDTreeWinPos = "right"
  let NERDTreeShowHidden=1
  let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\~$']
  let NERDTreeNodeDelimiter="\x07"
  let NERDTreeMinimalUI=1

  let g:NERDTreeWinSize=35

  map <leader>ee :NERDTreeToggle<cr>
  map <leader>ef :NERDTreeFind<cr>
  " map <leader>nb :NERDTreeFromBookmark<Space>

  " autocmd VimLeave * NERDTreeClose
  " autocmd VimLeavePre * NERDTreeClose
  " autocmd VimEnter * NERDTree
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> nerdtree-tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:nerdtree_tabs_open_on_console_startup=1
" map <Leader>n <plug>NERDTreeTabsToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> nerdtree-highlights
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeLimitedSyntax = 1 " Disable uncommon file extensions highlighting
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Startify plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd VimEnter *
"             \   if !argc()
"             \ |   NERDTree
"             \ |   Startify
"             \ |   wincmd w
"             \ | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> polyglot
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:polyglot_disabled = ['jsx']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:multi_cursor_next_key="\<C-s>"
let g:multi_cursor_quit_key='<Esc>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> surround.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vmap Si S(i_<esc>f)
" au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-sandwich
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" runtime macros/sandwich/keymap/surround.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let airline_theme='onedark'
" let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#coc#enabled = 0
" let g:airline#extensions#tabline#alt_sep = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#keymap_ignored_filetypes = ['vimfiler', 'nerdtree', 'vista', 'Mundo', 'list', 'quickfix', 'MundoDiff', 'coc-explorer']
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
" let g:airline#extensions#tabline#show_tab_count = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tabs = 0
" let g:airline#extensions#tabline#tab_nr_type = 2 " tab number
" let g:airline#extensions#tabline#tabnr_formatter = 'tabnr'
let g:airline#extensions#vista#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#zoomwintab#enabled = 1
let g:webdevicons_enable = 1

let g:airline_highlighting_cache = 1
let g:airline_powerline_fonts = 1

let g:airline_statusline_ontop = 1

" let g:airline#extensions#tabline#buf_label_first = 1
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline#extensions#tabline#fnamecollapse = 1
" let g:airline#extensions#tabline#fnamemod = ':t:r'
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#left_sep = ' '

" let g:airline#extensions#tmuxline#enabled = 1
" let airline#extensions#tmuxline#color_template = 'visual'
" let airline#extensions#tmuxline#snapshot_file = '~/.tmux-statusline-colors.conf'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" 
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '
let g:airline#extensions#tabline#close_symbol = '⏻' " '﯇   X '

" nmap <leader>1 <Plug>AirlineSelectTab1
" nmap <leader>2 <Plug>AirlineSelectTab2
" nmap <leader>3 <Plug>AirlineSelectTab3
" nmap <leader>4 <Plug>AirlineSelectTab4
" nmap <leader>5 <Plug>AirlineSelectTab5
" nmap <leader>6 <Plug>AirlineSelectTab6
" nmap <leader>7 <Plug>AirlineSelectTab7
" nmap <leader>8 <Plug>AirlineSelectTab8
" nmap <leader>9 <Plug>AirlineSelectTab9

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set diffopt += vertical
nnoremap  <silent> <leader>gs :Gstatus<cr>
nnoremap  <silent> <leader>gb :Gblame<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Goyo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:goyo_width=100
" let g:goyo_margin_top = 2
" let g:goyo_margin_bottom = 2
" nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = 'goimports'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> deoplete-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if has('nvim')
"   let g:deoplete#sources#go#gocode_binary = '/Users/jade/go/bin/gocode'
" endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ale_completion_enabled = 1
let g:ale_sign_error = '☠ '
let g:ale_sign_warning = '⚠️ '

let g:ale_echo_msg_error_str = '☠ '
let g:ale_echo_msg_warning_str = '⚠️ '
let g:ale_echo_msg_format = '%severity%[%linter%] %s'

let g:ale_completion_tsserver_autoimport = 1

set omnifunc=ale#completion#OmniFunc

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
let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:gitgutter_enabled=0
" nnoremap <silent> <leader>d :GitGutterToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Easy Motion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys = 'sdfjkla;eruiopcvnmty'
" map , <Plug>(easymotion-prefix)
" nmap <leader>j <Plug>(easymotion-overwin-f)

map <C-F> <Plug>(easymotion-overwin-f)
" nmap <Leader>F <Plug>(easymotion-overwin-f2)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> nerdcommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Colorizer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:colorizer_auto_color = 0
" let g:colorizer_skip_comments = 1
" let g:colorizer_auto_filetype='css,html,javascript,javascript.jsx'
" let g:colorizer_nomap = 1
" let g:colorizer_hex_pattern = ['#', '\%(\x\{6}\|\x\{3}\)', '']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsExpandTrigger = '<F12>'
" let g:UltiSnipsListSnippets = '<F12>'
" let g:UltiSnipsJumpForwardTrigger = ''
" let g:UltiSnipsJumpBackwardTrigger = ''
" let g:UltiSnipsListSnippets = '<C-S-E>'
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom_snippets"]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> EditorConfig
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:EditorConfig_verbose = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> GutentTags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:gutentags_project_root = []
let g:gutentags_ctags_exclude = ['none_modules/*', '.*']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> comfortable-motion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
" noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
" let g:comfortable_motion_interval = 9000 / 60
" let g:comfortable_motion_friction = 0.0
" let g:comfortable_motion_air_drag = 4.0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> indentline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:indentLine_enabled = 1
" let g:indentLine_char = "│"
" let g:indentLine_fileTypeExclude = ['calendar', 'fzf', 'nerdtree', 'Mundo', 'list', 'quickfix', 'vista', 'help', 'coc-explorer']
" let g:indentLine_color_gui = '#333333'
" let g:indentLine_setColors = 0

"" for 'tab' indent line
" set list lcs=tab:\│\  " Last one is space!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-indent-guides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_default_mapping = 0
let g:indent_guides_auto_colors = 0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'vista', 'Mundo', 'quickfix', 'MundoDiff', 'coc-explorer']
let g:indent_guides_guide_size = 1
" let g:indent_guides_start_level = 2

" indent guides
execute 'autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#30343c'
execute 'autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#30343c'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> devicons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsOS = 'Darwin'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> LanguageClient-neovim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

  autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
  autocmd FileType javascript.jsx setlocal omnifunc=LanguageClient#complete
  " autocmd FileType go setlocal omnifunc=LanguageClient#complete
  autocmd FileType python setlocal omnifunc=LanguageClient#complete
  autocmd FileType rust setlocal omnifunc=LanguageClient#complete

  autocmd FileType c setlocal omnifunc=LanguageClient#complete
  autocmd FileType cpp setlocal omnifunc=LanguageClient#complete
  autocmd FileType cuda setlocal omnifunc=LanguageClient#complete
  autocmd FileType objc setlocal omnifunc=LanguageClient#complete


  " if !executable('javascript-typescript-stdio')
  " echo 'javascript-typescript-stdio not installed!\n'
  " endif

  nnoremap <silent> <leader>wa :call LanguageClient_contextMenu()<CR>
  nnoremap <silent> <leader>wh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> <leader>wd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <leader>wn :call LanguageClient#textDocument_rename()<CR>
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

    " nnoremap <silent> <leader>wxh  :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'L'})<cr>
    " nnoremap <silent> <leader>wxj  :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'D'})<cr>
    " nnoremap <silent> <leader>wxk  :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'U'})<cr>
    " nnoremap <silent> <leader>wxl  :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'R'})<cr>
  augroup END

endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> tsuquyomi
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:tsuquyomi_javascript_support = 1
" let g:tsuquyomi_auto_open = 1
" let g:tsuquyomi_disable_quickfix = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> deoplete-ternjs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if has('nvim')
"     let g:tern#command = ['tern']
"     let g:tern#arguments = ['--persistent']
"     let g:deoplete#sources#ternjs#include_keywords = 1
"     let g:deoplete#sources#ternjs#docs = 1
"     let g:deoplete#sources#ternjs#filetypes = [ 'javascript', 'jsx', 'javascript.jsx', 'vue' ]
" endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Sneak
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map f <Plug>Sneak_f
" map F <Plug>Sneak_F
" map t <Plug>Sneak_t
" map T <Plug>Sneak_T


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> closetag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> semantic-highlighing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let s:semanticGUIColors = [ '#72d572', '#c5e1a5', '#e6ee9c', '#fff59d', '#ffe082', '#ffcc80', '#ffab91', '#bcaaa4', '#b0bec5', '#ffa726', '#ff8a65', '#f9bdbb', '#f9bdbb', '#f8bbd0', '#e1bee7', '#d1c4e9', '#ffe0b2', '#c5cae9', '#d0d9ff', '#b3e5fc', '#b2ebf2', '#b2dfdb', '#a3e9a4', '#dcedc8' , '#f0f4c3', '#ffb74d' ]
" let g:semanticTermColors = [28,1,2,3,4,5,6,7,25,9,10,34,12,13,14,15,16,125,124,19]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> ctrlspace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <silent><C-p> :CtrlSpace O<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:tagbar_left = 1
" let g:tagbar_previewwin_pos = ''
" let g:tagbar_vertical = 25


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> maximizer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:maximizer_set_default_mapping = 0
" nnoremap <silent><leader>m :MaximizerToggle!<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> incsearch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> anzu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
" map N <Plug>(is-nohl)<Plug>(anzu-N-with-echo)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-over
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <leader>su :<C-u>OverCommandLine<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> clever-f
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:clever_f_across_no_line = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> auto-pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairsShortcutBackInsert = ''
let g:AutoPairsShortcutToggle = ''
" let g:AutoPairsMapSpace = 0
" let g:AutoPairsFlyMode = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-autoformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>ff :<C-u>Autoformat<CR>
vnoremap <leader>ff :<C-u>'<,'>Autoformat<CR>

" let g:autoformat_verbosemode=1
let g:formatdef_prettier = '"prettier --stdin-filepath=".expand("%:p")'
" let g:formatdef_prettier_ts = '"prettier --parser=typescript --semi=true --single-quote=true --bracket-spacing=true --jsx-bracket-same-line=false --arrow-parens=avoid --trailing-comma=none --config-precedence=file-override --prose-wrap=preserve --html-whitespace-sensitivity css --stdin --stdin-filepath ".expand("%:p").(&textwidth ? " --print-width ".&textwidth : "")." --tab-width=".shiftwidth()'
let g:formatters_css = ['prettier', 'cssbeautify']
let g:formatters_scss = ['prettier', 'sassconvert']
let g:formatters_html = ['prettier']
let g:formatters_typescript = ['prettier', 'tsfmt']
let g:formatters_typescriptreact = ['prettier', 'tsfmt']
let g:formatters_markdown = ['prettier', 'remark_markdown']
let g:formatters_javascript = [
      \ 'prettier',
      \ 'eslint_local',
      \ 'jsbeautify_javascript',
      \ 'jscs',
      \ 'standard_javascript',
      \ 'xo_javascript',
      \ ]
let g:formatters_json = [
      \ 'prettier',
      \ 'jsbeautify_json',
      \ 'fixjson',
      \ ]
let g:formatters_python = ['black', 'yapf', 'autopep8']
let g:formatdef_luaformatter = '"lua-format ".expand("%:p")'
let g:formatters_lua = ['luaformatter']
let g:formatdef_yq = '"yq e ".expand("%:p")'
let g:formatters_yaml = ['yq']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-codefmt
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Glaive codefmt plugin[mappings]
" Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"

" augroup autoformat_settings
"   autocmd FileType bzl AutoFormatBuffer buildifier
"   autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
"   autocmd FileType dart AutoFormatBuffer dartfmt
"   autocmd FileType go AutoFormatBuffer gofmt
"   autocmd FileType gn AutoFormatBuffer gn
"   autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
"   autocmd FileType java AutoFormatBuffer google-java-format
"   autocmd FileType python AutoFormatBuffer yapf
"   " Alternative: autocmd FileType python AutoFormatBuffer autopep8
"   autocmd FileType rust AutoFormatBuffer rustfmt
"   autocmd FileType vue AutoFormatBuffer prettier
" augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> quick-scope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:qs_lazy_highlight = 1
" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-table-mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:table_mode_corner_corner='+'
" let g:table_mode_header_fillchar='='


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:easy_align_delimiters = {
      \ '>': { 'pattern': '>>\|=>\|>' },
      \ '/': {
      \     'pattern':         '//\+\|/\*\|\*/',
      \     'delimiter_align': 'l',
      \     'ignore_groups':   ['!Comment'] },
      \ ']': {
      \     'pattern':       '[[\]]',
      \     'left_margin':   0,
      \     'right_margin':  0,
      \     'stick_to_left': 0
      \   },
      \ ')': {
      \     'pattern':       '[()]',
      \     'left_margin':   0,
      \     'right_margin':  0,
      \     'stick_to_left': 0
      \   },
      \ 'd': {
      \     'pattern':      ' \(\S\+\s*[;=]\)\@=',
      \     'left_margin':  0,
      \     'right_margin': 0
      \   },
      \ 't': {
      \     'pattern':      ' ',
      \     'left_margin':  0,
      \     'right_margin': 0
      \   }
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> rainbow
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:rainbow_active = 0 "0 if you want to enable it later via :RainbowToggle
" "  '#98BC37'
" let g:rainbow_conf = {
"       \   'separately': {
"       \       'csv': {
"       \           'parentheses': ['start=/\v[^,]+|(,\ze,)/ step=/\v\,/ end=/$/ keepend']
"       \       },
"       \       'html': {
"       \           'parentheses': 0
"       \       },
"       \       'mxml': {
"       \           'parentheses': 0
"       \       },
"       \       'xml': {
"       \           'parentheses': 0
"       \       },
"       \       'bak': {
"       \           'parentheses': 0
"       \       }
"       \   }
"       \}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_strikethrough = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> FlyGrep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:spacevim_debug_level = 1
" let g:FlyGrep_input_delay = 100
" nnoremap <leader>/ :<C-u>FlyGrep<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-tmux-navigator
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmux_navigator_disable_when_zoomed = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> lens.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:animate#easing_func = 'animate#ease_out_cubic'
let g:lens#disabled_filetypes = ['nerdtree', 'vista', 'Mundo', 'list', 'MundoDiff', 'coc-explorer']
" let g:lens#disabled_buftypes = ['quickfix', 'terminal']
let g:lens#disabled = 1

nnoremap <silent> <M-k> :<C-u>call animate#window_delta_height(10)<CR>
nnoremap <silent> <M-j> :<C-u>call animate#window_delta_height(-10)<CR>
nnoremap <silent> <M-h> :<C-u>call animate#window_delta_width(10)<CR>
nnoremap <silent> <M-l> :<C-u>call animate#window_delta_width(-10)<CR>
nnoremap <silent> <M-;> :<C-u>call lens#run()<CR>

let g:fzf_layout = {
      \ 'window': 'new | wincmd J | resize 1 | call animate#window_percent_height(0.5)'
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> golden-ratio
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:golden_ratio_exclude_nonmodifiable = 1
" let g:golden_ratio_constant = 1.618


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if s:completion_manager == 'coc'
  let g:coc_global_extensions = [
        \ 'coc-clangd',
        \ 'coc-cmake',
        \ 'coc-css',
        \ 'coc-cssmodules',
        \ 'coc-db',
        \ 'coc-docker',
        \ 'coc-eslint',
        \ 'coc-explorer',
        \ 'coc-flutter',
        \ 'coc-git',
        \ 'coc-gocode',
        \ 'coc-html',
        \ 'coc-json',
        \ 'coc-lists',
        \ 'coc-phpls',
        \ 'coc-pyright',
        \ 'coc-rls',
        \ 'coc-snippets',
        \ 'coc-spell-checker',
        \ 'coc-stylelint',
        \ 'coc-tag',
        \ 'coc-tailwindcss',
        \ 'coc-tsserver',
        \ 'coc-vimlsp',
        \ 'coc-xml',
        \ 'coc-yaml',
        \ 'coc-yank',
        \ 'https://github.com/cstrap/python-snippets',
        \ 'https://github.com/infeng/vscode-react-typescript',
        \ 'https://github.com/xabikos/vscode-javascript'
        \ ]

  " \ 'coc-actions',
  " \ 'coc-ccls',
  " \ 'coc-dictionary',
  " \ 'coc-emmet',
  " \ 'coc-highlight',
  " \ 'coc-kite',
  " \ 'coc-omni',
  " \ 'coc-pairs',
  " \ 'coc-prettier',
  " \ 'coc-python',
  " \ 'coc-tabnine',
  " \ 'coc-template',
  " \ 'coc-tslint',
  " \ 'coc-ultisnips',
  " \ 'coc-word',

  " To enable highlight current symbol on CursorHold, add:
  autocmd CursorHold * silent call CocActionAsync('highlight')

  if s:search_manager == 'coc'
    function! s:cocGrepFromSelected(type)
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
      execute 'CocList grep '.word
    endfunction

    nmap <leader>p :<C-u>CocList files --ignore-case<CR>
    nmap <leader>P :<C-u>CocList files --ignore-case -uu<CR>
    nmap <leader>b :<C-u>CocList buffers --ignore-case<CR>
    nmap <leader>B :<C-u>CocList mru --ignore-case -A<CR>
    vmap <leader>* :<C-u>call <SID>cocGrepFromSelected(visualmode())<CR>
    nmap <leader>* :exe 'CocList grep --smart-case '.expand('<cword>')<CR>
    nmap <leader># :exe 'CocList grep -w --smart-case '.expand('<cword>')<CR>
    nmap <leader>/ :<C-u>CocList -I grep --smart-case<CR>
    nmap <leader>? :<C-u>CocList -I grep -u --smart-case<CR>
    nmap <leader>l :<C-u>CocList filetypes<CR>
    nmap <leader>gg :<C-u>CocList grep\

  endif

  nmap <leader>wa :<C-u>CocAction<CR>
  nmap <leader>wc :<C-u>CocCommand<CR>
  nmap <leader>we :<C-u>CocDiagnostics<cr>
  nmap <leader>o :<C-u>CocList outline --ignore-case<CR>
  nmap <leader>O :<C-u>CocList symbols<CR>

  " command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

  " function! s:GrepArgs(...)
  "   let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
  "         \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  "   return join(list, "\n")
  " endfunction

  " navigate diagnostics
  nmap [w <Plug>(coc-diagnostic-prev)
  nmap ]w <Plug>(coc-diagnostic-next)

  nmap <leader>w. :<C-u>CocListResume<CR>
  nmap <leader>wn <Plug>(coc-rename)
  nmap <leader>wq <Plug>(coc-fix-current)
  nmap <leader>wh <Plug>(coc-float-hide)

  nmap <leader>wd <Plug>(coc-definition)
  " nmap <leader>wt <Plug>(coc-type-definition)
  " nmap <leader>wi <Plug>(coc-implementation)
  nmap <leader>wr <Plug>(coc-references)


  " Remap for do action format
  nmap <leader>wf <Plug>(coc-format-selected)<CR>
  vmap <leader>wf <Plug>(coc-format-selected)<CR>

  nmap <leader>zz :<C-u>CocCommand cSpell.toggleEnableSpellChecker<CR>

  " show documentation in preview window
  nnoremap <leader>wh :call <SID>show_documentation()<CR>

  nnoremap <leader>wj :<C-u>CocNext<CR>
  nnoremap <leader>wk :<C-u>CocPrev<CR>

  " Create mappings for function text object, requires document symbols feature of languageserver.
  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap af <Plug>(coc-funcobj-a)

  " navigate chunks of current buffer
  nmap [g <Plug>(coc-git-prevchunk)
  nmap ]g <Plug>(coc-git-nextchunk)
  " show chunk diff at current position
  nmap <leader>gi <Plug>(coc-git-chunkinfo)
  " show commit contains current position
  nmap <leader>gc <Plug>(coc-git-commit)
  " create text object for git chunks
  omap ig <Plug>(coc-git-chunk-inner)
  xmap ig <Plug>(coc-git-chunk-inner)
  omap ag <Plug>(coc-git-chunk-outer)
  xmap ag <Plug>(coc-git-chunk-outer)

  nnoremap <silent> <leader>wy :call StatusDiagnosticToClipboard()<CR>

  nmap <leader>w; :<C-u>CocCommand clangd.switchSourceHeader<CR>

  function! s:show_documentation()
    if &filetype == 'vim'
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  function! StatusDiagnosticToClipboard()
    call setreg('+','')
    let diagList=CocAction('diagnosticList')
    let line=line('.')
    for diagItem in diagList
      if line == diagItem['lnum']
        let str=diagItem['message']
        call setreg('+',str)
        return
      endif
    endfor
  endfunction

  " Use <C-l> for trigger snippet expand.
  " imap <C-l> <Plug>(coc-snippets-expand)

  " Use <C-j> for select text for visual placeholder of snippet.
  " vnoremap <C-j> <Plug>(coc-snippets-select)

  " Use <C-j> for jump to next placeholder, it's default of coc.nvim
  let g:coc_snippet_next = '<c-j>'

  " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
  let g:coc_snippet_prev = '<c-k>'

  " Use <C-j> for both expand and jump (make expand higher priority.)
  " inoremap <C-j> <Plug>(coc-snippets-expand-jump)

  " Enter for expand.
  " inoremap <expr> <cr> pumvisible() ? coc#_select_confirm() : '<cr>'
  inoremap <expr> <c-j> pumvisible() ? coc#_select_confirm() : coc#refresh()


  " inoremap <silent><expr> <TAB>
  "       \ pumvisible() ? '<C-y>' :
  "       \ <SID>check_back_space() ? '<TAB>' :
  "       \ coc#refresh()
  " inoremap <expr> <S-TAB> pumvisible() ? '<C-p>' : '<C-h>'
  inoremap <expr> <C-n> pumvisible() ? '<C-n>' : coc#refresh()
  inoremap <expr> <C-p> pumvisible() ? '<C-p>' : coc#refresh()

  " inoremap <silent><expr> <TAB> pumvisible()  ? coc#_select_confirm() : '<TAB>'
  " \ <SID>check_back_space() ? '<TAB>' :
  " \ coc#refresh()

  " inoremap <silent><expr> <TAB>
  "       \ pumvisible() ? '<C-n>' :
  "       \ coc#expandableOrJumpable() ? '<C-y>' :
  "       \ <SID>check_back_space() ? '<TAB>' :
  "       \ coc#refresh()
  " \ pumvisible() ? coc#_select_confirm() :
  " \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  augroup cocgroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    " autocmd set formatexpr=CocAction('formatSelected')
    autocmd FileType typescriptreact,typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  nmap <leader>ee :CocCommand explorer --toggle --sources=file+<CR>

  " autocmd VimLeavePre * bufdo if &ft == 'coc-explorer' | bdelete | endif
  " autocmd VimLeave * NERDTreeClose
  " let g:node_client_debug = 1
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-vebugger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vebugger_leader='<Leader>d'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> diffchar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:DiffColors=3
" let g:DiffModeSync=1
" let g:DiffCharNoKeyMap=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Calendar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vista.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vista#renderer#enable_icon = 1
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" let g:vista_echo_cursor_strategy = 'both'
" let g:vista_highlight_whole_line = 1
" let g:vista#renderer#enable_icon = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> switch.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType javascriptreact,typescriptreact let b:switch_custom_definitions = [
      \ {
      \   '\(\k\+=\){\(\w[a-zA-Z0-9.]*\)}':      '\1{`${\2}`}',
      \   '\(\k\+=\){`${\(\w[a-zA-Z0-9.]*\)}`}': '\1{\2}',
      \ },
      \ ['let', 'const', 'var'],
      \ ['else', 'else if']
      \ ]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-xkbswitch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:XkbSwitchEnabled = 1
" let g:XkbSwitchLoadRIMappings = 0
" let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
" let g:XkbSwitchIMappings = ['rh']
" inoremap ดก <ESC>
" let g:XkbSwitchIMappingsTr = {
"           \ 'th':
"           \ {'<': 'qwertyuiop[]asdfghjkl;''zxcvbnm,.`/'.
"           \       'QERTYUIOP{ASDFGHJKL:CVBN<>?~@#$^&|'.
"           \       '14567890-=@#$%^&*()_+',
"           \  '>': 'ๆไำพะัีรนยบลฟหกดเ้่าสวงผปแอิืทมใฝ'.
"           \       '๐ฎฑธํ๊ณฯญฐฤฆฏโฌ็๋ษศซฉฮฺ์ฒฬฦ'.
"           \       'ๅภถุึคตจขช๑๒๓๔ู฿๕๖๗๘๙'}
"           \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-latex-live-preview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:livepreview_previewer = 'open -a Preview'
let g:livepreview_engine = 'mactex'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-matchup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:matchup_matchpref = {
      \ 'html': {
      \ 'tagnameonly' : 1,
      \ 'nolist' : 1
      \ },
      \ 'xml': {
      \ 'tagnameonly' : 1,
      \ 'nolist' : 1
      \ }
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-windowswap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:windowswap_map_keys = 0 "prevent default bindings
" nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
" nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>wx :call WindowSwap#EasyWindowSwap()<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-wiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:vimwiki_list = [{'path': '~/Dropbox/.notes'}]
let g:vimwiki_list = [{'path': '~/Dropbox/.notes',
      \ 'syntax': 'markdown', 'ext': '.md'}]

augroup pandoc_syntax
  autocmd! FileType vimwiki set syntax=markdown.pandoc
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-notes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :let g:notes_directories = ['~/Dropbox/.notes']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> marvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:marvim_store = '/usr/local/.marvim' " change store place.
" let g:marvim_store = '~/.vim/marvim'
" let g:marvim_find_key = '<space>kk' " change find key from <F2> to 'space'
" let g:marvim_store_key = '<space>ks'     " change store key from <F3> to 'ms'
" let g:marvim_register = 'q'       " change used register from 'q' to 'c'
" let g:marvim_prefix = 0           " disable default syntax based prefix


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> blamer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:blamer_enabled = 1
" let g:blamer_delay = 500
" let g:blamer_show_in_visual_modes = 0
" " let g:blamer_prefix = ' > '
" let g:blamer_relative_time = 1
" highlight Blamer guifg=gray30 gui=italic


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-session
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-hexokinase
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:Hexokinase_highlighters = ['backgroundfull']
" let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact']
" let g:Hexokinase_highlighters = ['sign_column']
" set signcolumn=yes:9 " Neovim only
" let g:Hexokinase_highlighters = ['foreground']
" let g:Hexokinase_highlighters = ['foregroundfull']
" let g:Hexokinase_highlighters = ['background']
" let g:Hexokinase_highlighters = ['backgroundfull']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-template
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:templates_directory = ['~/.vim/templates']
let g:templates_detect_git = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vimspector
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'vscode-node-debug2', 'debugger-for-chrome' ]
" let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
" :VimspectorInstall! --verbose --all
" nvm install --lts 10; nvm use --lts 10; ./install_gadget.py --force-enable-node


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
" -> vim-buffet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "離"
let g:buffet_left_trunc_icon = ""
let g:buffet_right_trunc_icon = ""
let g:buffet_new_buffer_name = ''
let g:buffet_modified_icon = ' '
function! g:BuffetSetCustomColors()
  execute 'hi BuffetCurrentBuffer guifg=' . s:color3 . ' guibg=' . s:color1
  execute 'hi BuffetBuffer guifg=' . s:color4 . ' guibg=' . s:color3
  execute 'hi BuffetTab guifg=' . s:color4 . ' guibg=' . s:color2
  execute 'hi BuffetActiveBuffer guifg=' . s:color3 . ' guibg=' . s:color4
  execute 'hi BuffetTrunc guifg=' . s:color4 . ' guibg=#30343c'
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> nvim-completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if s:completion_manager == 'nvim'
  imap <tab> <Plug>(completion_smart_tab)
  imap <s-tab> <Plug>(completion_smart_s_tab)

  " let g:completion_enable_auto_popup = 0
  " let g:completion_enable_snippet = 'UltiSnips'

  let g:completion_confirm_key = "\<C-j>"
  let g:completion_matching_smart_case = 1


  " Use <Tab> and <S-Tab> to navigate through popup menu
  " inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

  " Set completeopt to have a better completion experience
  set completeopt=menuone,noinsert,noselect

  " Avoid showing message extra message when using completion
  set shortmess+=c

endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Override color
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

