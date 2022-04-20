--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

vim.opt.timeoutlen = 1000

-- Show line number
vim.opt.number = true

-- Show relative line number
vim.opt.relativenumber = true

-- show command
vim.opt.showcmd = true

-- start horizontal split below
vim.opt.splitbelow = true

-- start vertical split right
vim.opt.splitright = true

-- number of lines of history
vim.opt.history = 1000

-- Set to auto read when a file is changed from the outside
vim.opt.autoread = true

vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.textwidth = 160
vim.opt.showbreak = "↳ "

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = true

vim.opt.clipboard = ""

vim.opt.listchars = "tab:>-,trail:.,precedes:,extends:"

local function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then io.close(f) return true else return false end
end

local python_path = "/usr/local/bin/python3"
if file_exists(python_path) then
  vim.g.python3_host_prog = python_path
end

local ruby_path = "/usr/local/bin/python3"
if file_exists(ruby_path) then
  vim.g.ruby_host_prog = ruby_path
end

-- general
lvim.log.level = "warn"
-- lvim.format_on_save = true
lvim.colorscheme = "onedarker"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- Trigger `autoread` when files changes on disk
-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
lvim.autocommands.auto_read = {
  { "FocusGained,BufEnter,CursorHold,CursorHoldI", "*", "if mode() != 'c' | checktime | endif" },
}

-- Notification after file change
-- https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
lvim.autocommands.auto_read_notification = {
  { "FileChangedShellPost", "*", "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None" },
}

lvim.autocommands.clear_matches = {
  { "BufWinLeave", "*", "call clearmatches()" },
}

-- Return to last edit position when opening files (You want this!)
lvim.autocommands.last_edit_position = {
  { "BufReadPost", "*", [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]] },
}

-- Disable automatic comment insertion
lvim.autocommands.disable_comment_insertion = {
  { "FileType", "*", [[setlocal formatoptions-=c formatoptions-=r formatoptions-=o]] },
}

-- DockerFile
lvim.autocommands.dockerfile = {
  { "BufNewFile,BufRead", "*.dockerfile", [[set filetype=dockerfile]] },
}

-- env file
lvim.autocommands.env_file = {
  { "BufNewFile,BufRead", ".env,.env.*", [[set filetype=sh]] },
}

-- objc file
lvim.autocommands.objc_file = {
  { "BufNewFile,BufRead", "*.mm", [[set filetype=objc]] },
}

-- .prettierrc
lvim.autocommands.prettierrc_file = {
  { "BufNewFile,BufRead", ".prettierrc", [[set filetype=yaml]] },
}


-- scroll off
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 3
vim.opt.scrollopt:append "hor"

-- move counterlinewise
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })
vim.api.nvim_set_keymap("v", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("v", "k", "gk", { noremap = true })

-- quick marco
vim.api.nvim_set_keymap("n", "Q", "@@", { noremap = true })

-- :cmdline history with prefix
vim.api.nvim_set_keymap("c", "<C-P>", "<UP>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-N>", "<DOWN>", { noremap = true })

-- https://youtu.be/YwMgnmZNWXA
vim.api.nvim_set_keymap("n", "c*", "*Ncgn", { noremap = true })
vim.api.nvim_set_keymap("v", "*", "y/0<cr>", { noremap = true, silent = true })

-- to the end of line
vim.api.nvim_set_keymap("n", "-", "$", { noremap = true })
vim.api.nvim_set_keymap("v", "-", "$", { noremap = true })

-- profiling
vim.api.nvim_set_keymap("n", "<leader>DD", [[:exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>DQ", [[:exe ":profile pause"<cr>:noautocmd qall!<cr>]], { noremap = true })

-- unmap a default keymapping
lvim.keys.normal_mode["<leader>c"] = false
-- edit a default keymapping
lvim.keys.normal_mode["<C-q>"] = "<cmd>BufferKill<CR>"

lvim.builtin.which_key.mappings["c"] = {
  name = "Commenter"
}

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}
-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.comment.active = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Disable virtual text
lvim.lsp.diagnostics.virtual_text = false

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    -- extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    -- filetypes = { "javascript", "python" },
  },
}

-- Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
  },
  {
    'wfxr/minimap.vim',
    run = "cargo install --locked code-minimap",
    cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
    config = function()
      vim.cmd("let g:minimap_width = 10")
      vim.cmd("let g:minimap_auto_start = 1")
      vim.cmd("let g:minimap_auto_start_win_enter = 1")
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard", "vista" }
      vim.g.indent_blankline_buftype_exclude = { "terminal" }
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = false
    end
  },
  {
    "tpope/vim-surround",
    keys = { "c", "d", "y" }
  },
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
  },
  {
    "simnalamburt/vim-mundo",
    cmd = "MundoToggle",
  },
  {
    "monaqa/dial.nvim",
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group {
        -- default augends used when no group name is specified
        default = {
          augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
          augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
          augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
          augend.constant.new {
            elements = { "and", "or" },
            word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
            cyclic = true, -- "or" is incremented into "and".
          },
          augend.constant.new {
            elements = { "&&", "||" },
            word = false,
            cyclic = true,
          },
        },

        typescript = {
          augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
          augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
          augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
          augend.constant.new { elements = { "let", "const" } },
          augend.constant.new {
            elements = { "&&", "||" },
            word = false,
            cyclic = true,
          },
        },
        visual = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.alpha,
          augend.constant.alias.Alpha,
        },
      }

      vim.cmd [[
        nmap <C-a> <Plug>(dial-increment)
        nmap <C-x> <Plug>(dial-decrement)
        vmap <C-a> <Plug>(dial-increment)
        vmap <C-x> <Plug>(dial-decrement)
        vmap g<C-a> <Plug>(dial-increment-additional)
        vmap g<C-x> <Plug>(dial-decrement-additional)
        
        autocmd FileType typescript lua vim.api.nvim_buf_set_keymap(0, "n", "<C-a>", require("dial.map").inc_normal("typescript"), {noremap = true})
      ]]

    end,
  },
  {
    "felipec/vim-sanegx",
    event = "BufRead",
  },
  {
    "ptzz/lf.vim",
    config = function()
      vim.g.lf_map_keys = 0
      vim.g.lf_replace_netrw = 0
    end
  },
  {
    "preservim/nerdcommenter",
    config = function()
      vim.g.NERDSpaceDelims = 1
      vim.g.NERDDefaultAlign = 'both'
    end
  },
  { "alexghergh/nvim-tmux-navigation",
    config = function()
      require('nvim-tmux-navigation').setup {
        disable_when_zoomed = true
      }
      vim.cmd [[
      nnoremap <silent> <C-h> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>
      nnoremap <silent> <C-j> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>
      nnoremap <silent> <C-k> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>
      nnoremap <silent> <C-l> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>
    ]]
    end
  },
  {
    "ellisonleao/glow.nvim",
    ft = { "markdown" }
  },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup {
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'overlay', -- 'eol' | 'overlay' | 'right_align'
          delay = 225,
          ignore_whitespace = true,
        },
      }
    end
  },
  { "AndrewRadev/linediff.vim" },
  { "AndrewRadev/splitjoin.vim" },
  { "AndrewRadev/switch.vim" },
  { "chrisbra/NrrwRgn" },
  { "dbakker/vim-paragraph-motion" },
  { "editorconfig/editorconfig-vim" },
  { "glts/vim-textobj-comment" },
  { "jiangmiao/auto-pairs" },
  { "Julian/vim-textobj-variable-segment" },
  { "junegunn/vim-easy-align" },
  { "kana/vim-textobj-indent" },
  { "kana/vim-textobj-user" },
  { "pantharshit00/vim-prisma" },
  { "rbong/vim-flog" },
  { "stefandtw/quickfix-reflector.vim" },
  { "terryma/vim-multiple-cursors" },
  { "tmux-plugins/vim-tmux-focus-events" },
  { "tpope/vim-abolish" },
  { "tpope/vim-dadbod" },
  { "tpope/vim-obsession" },
  { "tpope/vim-repeat" },
  { "tpope/vim-rsi" },
  { "tpope/vim-unimpaired" },
  { "wellle/targets.vim" },
  { "wellle/visual-split.vim" },
  { "yssl/QFEnter" },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
