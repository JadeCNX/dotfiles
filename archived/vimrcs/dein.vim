let s:dein_path = glob('~/.cache/dein')
let s:dein_script = glob(s:dein_path . '/repos/github.com/Shougo/dein.vim')

if empty(s:dein_script)
  exec 'silent !curl -s https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | sh -s ' . s:dein_path
endif

" Required:
let &runtimepath .= ',' . escape(s:dein_script, '\,')

" Required:
if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)

  " Let dein manage dein
  " Required:
  call dein#add(s:dein_script)
  call dein#add('wsdjeg/dein-ui.vim')

  " Add or remove your plugins here like this:
  " if !has('nvim')
    " call dein#add('roxma/nvim-yarp')
    " call dein#add('roxma/vim-hug-neovim-rpc')
    " call dein#add('Shougo/vimproc.vim', { 'build': 'make' })
  " endif

  " call dein#add('/usr/local/opt/fzf')  " use with 'brew install fzf'
  " call dein#add('amix/vim-zenroom2')
  " call dein#add('AndrewRadev/linediff.vim')
  " call dein#add('AndrewRadev/splitjoin.vim')
  " call dein#add('ashisha/image.vim')
  " call dein#add('autozimu/LanguageClient-neovim', {'rev': 'next', 'build': 'bash install.sh'})
  " call dein#add('Chiel92/vim-autoformat')
  " call dein#add('chrisbra/Colorizer')
  " call dein#add('chrisbra/NrrwRgn')
  " call dein#add('ConradIrwin/vim-bracketed-paste')
  " call dein#add('dbakker/vim-paragraph-motion')
  " call dein#add('devjoe/vim-codequery')
  " call dein#add('dhruvasagar/vim-table-mode')
  " call dein#add('easymotion/vim-easymotion')
  " call dein#add('editorconfig/editorconfig-vim')
  " call dein#add('edkolev/tmuxline.vim')
  " call dein#add('fatih/vim-go')
  " call dein#add('godlygeek/tabular')
  " call dein#add('groenewege/vim-less')
  " call dein#add('haya14busa/vim-easyoperator-line')
  " call dein#add('haya14busa/vim-easyoperator-phrase')
  " call dein#add('honza/vim-snippets')
  " call dein#add('jceb/vim-orgmode')
  " call dein#add('jiangmiao/auto-pairs')
  " call dein#add('junegunn/fzf.vim')
  " call dein#add('junegunn/goyo.vim')
  " call dein#add('junegunn/vim-easy-align')
  " call dein#add('justinmk/vim-sneak')
  " call dein#add('kchmck/vim-coffee-script')
  " call dein#add('ludovicchabant/vim-gutentags')
  " call dein#add('luochen1990/rainbow')
  " call dein#add('majutsushi/tagbar')
  " call dein#add('mattn/emmet-vim')
  " call dein#add('mbbill/undotree')
  " call dein#add('mhinz/vim-signify')
  " call dein#add('michaeljsmith/vim-indent-object')
  " call dein#add('mxw/vim-jsx')
  " call dein#add('nixprime/cpsm', { 'build': 'bash install.sh' })
  " call dein#add('osyo-manga/vim-anzu')
  " call dein#add('osyo-manga/vim-over')
  " call dein#add('othree/javascript-libraries-syntax.vim')
  " call dein#add('plasticboy/vim-markdown')
  " call dein#add('plytophogy/vim-virtualenv')
  " call dein#add('prettier/vim-prettier', { 'build': 'yarn install'})
  " call dein#add('rickhowe/diffchar.vim')
  " call dein#add('rizzatti/dash.vim')
  " call dein#add('roxma/vim-paste-easy')
  " call dein#add('ryanoasis/vim-devicons')
  " call dein#add('scrooloose/nerdcommenter')
  " call dein#add('scrooloose/nerdtree')
  " call dein#add('severin-lemaignan/vim-minimap')
  " call dein#add('sheerun/vim-polyglot')
  " call dein#add('Shougo/denite.nvim')
  " call dein#add('Shougo/deoplete.nvim')
  " call dein#add('Shougo/neomru.vim')
  " call dein#add('Shougo/unite-outline')
  " call dein#add('SirVer/ultisnips') " ultimate snippet
  " call dein#add('szw/vim-maximizer')
  " call dein#add('terryma/vim-expand-region')
  " call dein#add('terryma/vim-multiple-cursors')
  " call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
  " call dein#add('tmux-plugins/vim-tmux-focus-events')
  " call dein#add('tommcdo/vim-exchange')
  " call dein#add('tpope/vim-abolish') " Abbreviation substitution
  " call dein#add('tpope/vim-fugitive')
  " call dein#add('tpope/vim-obsession')
  " call dein#add('tpope/vim-repeat')
  " call dein#add('tpope/vim-sleuth')
  " call dein#add('tpope/vim-speeddating')
  " call dein#add('tpope/vim-surround')
  " call dein#add('tpope/vim-unimpaired')
  " call dein#add('unblevable/quick-scope')
  " call dein#add('vim-airline/vim-airline')
  " call dein#add('vim-airline/vim-airline-themes')
  " call dein#add('vim-scripts/Flex-4')
  " call dein#add('vim-scripts/utl.vim')
  " call dein#add('w0rp/ale')
  " call dein#add('wellle/targets.vim')
  " call dein#add('wellle/visual-split.vim')
  " call dein#add('wsdjeg/FlyGrep.vim')
  " call dein#add('yardnsm/vim-import-cost', { 'build': 'npm install' })
  " call dein#add('Yggdroot/indentLine')
  " call dein#add('yuttie/comfortable-motion.vim') " Inertial-scroll
  " call dein#add('zacharied/denite-nerdfont')
  " call dein#add('zchee/deoplete-go', {'build': 'make'})

  " " call dein#add('airblade/vim-gitgutter')
  " " call dein#add('alvan/vim-clotag')
  " " call dein#add('bagrat/vim-workspace')
  " " call dein#add('blindFS/vim-taskwarrior')
  " " call dein#add('blueyed/vim-diminactive')
  " " call dein#add('carlitux/deoplete-ternjs')
  " " call dein#add('chr4/nginx.vim')
  " " call dein#add('ctrlpvim/ctrlp.vim')
  " " call dein#add('dahu/vim-fanfingtastic')
  " " call dein#add('digitaltoad/vim-pug')
  " " call dein#add('ervandew/supertab')
  " " call dein#add('maxbrunsfeld/vim-yankstack')
  " " call dein#add('google/vim-searchindex')
  " " call dein#add('haya14busa/is.vim')
  " " call dein#add('itchyny/lightline.vim')
  " " call dein#add('jistr/vim-nerdtree-tabs')
  " " call dein#add('jlanzarotta/bufexplorer')
  " " call dein#add('koron/minimap-vim')
  " " call dein#add('lilydjwg/colorizer')
  " " call dein#add('lornix/vim-scrollbar')
  " " call dein#add('maximbaz/lightline-ale')
  " " call dein#add('mhartington/deoplete-typescript')
  " " call dein#add('mhinz/vim-startify')
  " " call dein#add('mileszs/ack.vim')
  " " call dein#add('nsf/gocode')
  " " call dein#add('Quramy/tsuquyomi')
  " " call dein#add('rdnetto/YCM-Generator', { 'rev': 'stable'})
  " " call dein#add('rhysd/clever-f.vim')
  " " call dein#add('rust-lang/rust.vim')
  " " call dein#add('Shougo/echodoc.vim')
  " " call dein#add('svermeulen/vim-extended-ft')
  " " call dein#add('tacahiroy/ctrlp-funky')
  " " call dein#add('ternjs/tern_for_vim', {'build': 'npm install'})
  " " call dein#add('tomtom/tlib_vim')
  " " call dein#add('Valloric/YouCompleteMe')
  " " call dein#add('vim-ctrlspace/vim-ctrlspace')
  " " call dein#add('vim-flake8')
  " " call dein#add('vim-scripts/mru.vim')
  " " call dein#add('vim-scripts/SyntaxRange')
  " " call dein#add('vim-scripts/taglist.vim')
  " " call dein#add('zhou13/vim-easyescape')

  " Color schemes
  call dein#add('rakr/vim-one')
  " call dein#add('altercation/vim-colors-solarized')
  " call dein#add('chriskempson/base16-vim')
  " call dein#add('flazz/vim-colorschemes')
  " call dein#add('gregsexton/Atom')
  " call dein#add('jaxbot/semantic-highlight.vim')
  " call dein#add('joshdick/onedark.vim')
  " call dein#add('lifepillar/vim-solarized8')
  " call dein#add('morhetz/gruvbox')
  " call dein#add('phanviet/vim-monokai-pro')
  " call dein#add('sonph/onehalf', {'rtp': 'vim' })
  " call dein#add('vim-scripts/mayansmoke')
  " call dein#add('vim-scripts/peaksea')
  " call dein#add('vim-scripts/pyte')
  " call dein#add('w0ng/vim-hybrid')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
" if dein#check_install()
"   call dein#install()
" endif

"End dein Scripts-------------------------

" let base16colorspace=256  " Access colors present in 256 colorspace
" let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
" let g:onedark_terminal_italics = 1
" let g:solarized_term_italics = 1
" let g:solarized_termcolors=256
" let g:solarized_visibility = 'high'
let g:one_allow_italics = 1

" Colorscheme
set background=dark
colorscheme one


 
