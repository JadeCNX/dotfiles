require('lv-globals')
vim.cmd('luafile ~/.config/nvim/lv-settings.lua')

require('settings')
require('plugins')
require('lv-utils')
require('keymappings')
-- require('lv-nvimtree') -- This plugin must be required somewhere before colorscheme.  Placing it after will break navigation keymappings
-- require('colorscheme') -- This plugin must be required somewhere after nvimtree. Placing it before will break navigation keymappings
require('lv-galaxyline')
-- require('lv-comment')
require('lv-barbar')
-- require('lv-dashboard')
-- require('lv-gitsigns')
-- require('lv-autopairs')
require('lv-which-key')
require('lv-scrollview')
require('lv-colorizer')
require('lv-numb')
-- require('lv-gitblame')

-- TODO is there a way to do this without vimscript
vim.cmd('source ~/.config/nvim/vimscript/functions.vim')

-- LSP
if vim.g.neovim_builtin_feature_enable then
  require('lv-telescope')
  require('lv-treesitter')
  require('lv-rnvimr')

  require('lv-autocommands')
  require('lv-compe')

  require('lsp')
  require('lsp.angular-ls')
  require('lsp.bash-ls')
  require('lsp.clangd')
  require('lsp.css-ls')
  require('lsp.dart-ls')
  require('lsp.docker-ls')
  require('lsp.efm-general-ls')
  require('lsp.elm-ls')
  require('lsp.emmet-ls')
  require('lsp.graphql-ls')
  require('lsp.go-ls')
  require('lsp.html-ls')
  require('lsp.json-ls')
  require('lsp.js-ts-ls')
  require('lsp.kotlin-ls')
  require('lsp.latex-ls')
  require('lsp.lua-ls')
  require('lsp.php-ls')
  require('lsp.python-ls')
  require('lsp.ruby-ls')
  require('lsp.rust-ls')
  require('lsp.svelte-ls')
  require('lsp.terraform-ls')
  require('lsp.tailwindcss-ls')
  require('lsp.vim-ls')
  require('lsp.vue-ls')
  require('lsp.yaml-ls')
  require('lsp.elixir-ls')
end

