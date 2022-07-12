--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

vim.opt.timeoutlen = 2000

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
vim.opt.wrap = false

vim.opt.clipboard = ""

vim.opt.listchars = "tab:>-,trail:.,precedes:,extends:"

vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true

vim.g.VM_theme = "ocean"
vim.g.VM_skip_empty_lines = true
vim.g.VM_maps = {
  ["Add Cursor Down"] = "<m-n>",
  ["Add Cursor Up"] = "<m-p>",
  ["Select Right"] = "<m-l>",
  ["Select Left"] = "<m-h>"
}
vim.g.AutoPairsShortcutToggle = ""
vim.g.AutoPairsShortcutJump = ""

-- For neovide
if os.getenv("NEOVIDE") then
  vim.o.guifont = "DankMono Nerd Font"
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  -- vim.g.neovide_transparency = 0.8
else
  vim.g.tokyonight_transparent = true
end

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
lvim.format_on_save = false
lvim.colorscheme = "tokyonight"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.visual_block_mode["J"] = false
lvim.keys.visual_block_mode["K"] = false

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

-- lvim.autocommands.clear_matches = {
--   { "BufWinLeave", "*", "call clearmatches()" },
-- }

-- -- Return to last edit position when opening files (You want this!)
-- lvim.autocommands.last_edit_position = {
--   { "BufReadPost", "*", [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]] },
-- }

-- Disable automatic comment insertion
lvim.autocommands.disable_comment_insertion = {
  { "FileType", "*", [[setlocal formatoptions-=c formatoptions-=r formatoptions-=o]] },
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

vim.api.nvim_set_keymap("n", "Y", '"*y', { noremap = true })
vim.api.nvim_set_keymap("v", "Y", '"*y', { noremap = true })

-- https://youtu.be/YwMgnmZNWXA
vim.api.nvim_set_keymap("n", "c*", "*Ncgn", { noremap = true })
vim.api.nvim_set_keymap("v", "*", "y/0<cr>", { noremap = true, silent = true })

-- to the end of line
vim.api.nvim_set_keymap("n", "-", "$", { noremap = true })
vim.api.nvim_set_keymap("v", "-", "$", { noremap = true })

-- profiling
lvim.builtin.which_key.mappings["D"] = {
  name = "Profiling",
  D = { [[:exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>]], "Start profiling" },
  Q = { [[:exe ":profile pause"<cr>:noautocmd qall!<cr>]], "Quit profiling" }
}


-- unmap a default keymapping
lvim.keys.normal_mode["<leader>c"] = false
-- edit a default keymapping
lvim.keys.normal_mode["<C-q>"] = "<cmd>BufferKill<CR>"

lvim.builtin.which_key.setup.plugins.registers = false

lvim.builtin.which_key.mappings["c"] = {
  name = "Commenter"
}

lvim.builtin.which_key.mappings["e"] = {
  name = "Explorer",
  e = { "<cmd>NvimTreeToggle<CR>", "Explorer pane" },
  t = { "<cmd>Lf<CR>", "LF" }
}

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

lvim.builtin.which_key.mappings["/"] = { "<cmd>lua require('telescope.builtin').live_grep({ debounce = 100 })<cr>",
  "Search" }
lvim.builtin.which_key.mappings["?"] = { "<cmd>lua require('spectre').open()<CR>", "Search & Replace" }
lvim.builtin.which_key.mappings["s."] = { "<cmd>Telescope resume<cr>", "Search Resume" }
lvim.builtin.which_key.mappings["sT"] = { "<cmd>lua require('spectre').open_file_search()<cr>", "Search Current File" }

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

lvim.builtin.which_key.mappings["gB"] = { "<cmd>Git blame<cr>", "Git blame" }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = false
-- lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.gitsigns.current_line_blame_opts = {
  virt_text = true,
  virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
  delay = 180,
  ignore_whitespace = true,
}

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
  "go"
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- local function dump(o)
--   if type(o) == 'table' then
--     local s = '{ '
--     for k, v in pairs(o) do
--       if type(k) ~= 'number' then k = '"' .. k .. '"' end
--       s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
--     end
--     return s .. '} '
--   else
--     return tostring(o)
--   end
-- end

-- print("lvim.builtin.telescope.defaults.vimgrep_arguments", dump(lvim.builtin.telescope.defaults.vimgrep_arguments))

lvim.builtin.telescope.defaults.mappings.n["c-c"] = require("telescope.actions").close
lvim.builtin.telescope.defaults.vimgrep_arguments = {
  "rg",
  "--color=never",
  "--no-heading",
  "--with-filename",
  "--line-number",
  "--column",
  "--smart-case",
}

-- Disable virtual text
-- lvim.lsp.diagnostics.virtual_text = false

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

local lspconfig = require("lspconfig")
lspconfig.tsserver.setup({
  -- Needed for inlayHints. Merge this table with your settings or copy
  -- it from the source if you want to add your own init_options.
  init_options = require("nvim-lsp-ts-utils").init_options,
  --
  on_attach = function(client, bufnr)
    local ts_utils = require("nvim-lsp-ts-utils")

    -- required to fix code action ranges and filter diagnostics
    ts_utils.setup_client(client)

    -- defaults
    ts_utils.setup({
      debug = false,
      disable_commands = false,
      enable_import_on_completion = false,

      -- import all
      import_all_timeout = 5000, -- ms
      -- lower numbers = higher priority
      import_all_priorities = {
        same_file = 1, -- add to existing import statement
        local_files = 2, -- git files or files with relative path markers
        buffer_content = 3, -- loaded buffer content
        buffers = 4, -- loaded buffer names
      },
      import_all_scan_buffers = 100,
      import_all_select_source = false,
      -- if false will avoid organizing imports
      always_organize_imports = true,

      -- filter diagnostics
      filter_out_diagnostics_by_severity = {},
      filter_out_diagnostics_by_code = {},

      -- inlay hints
      auto_inlay_hints = true,
      inlay_hints_highlight = "Comment",
      inlay_hints_priority = 200, -- priority of the hint extmarks
      inlay_hints_throttle = 150, -- throttle the inlay hint request
      inlay_hints_format = { -- format options for individual hint kind
        Type = {},
        Parameter = {},
        Enum = {},
        -- Example format customization for `Type` kind:
        -- Type = {
        --     highlight = "Comment",
        --     text = function(text)
        --         return "->" .. text:sub(2)
        --     end,
        -- },
      },

      -- update imports on file move
      update_imports_on_move = false,
      require_confirmation_on_move = false,
      watch_dir = nil,
    })

    -- no default maps, so you may want to define some here
    local opts = { silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lo", ":TSLspOrganize<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lR", ":TSLspRenameFile<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lO", ":TSLspImportAll<CR>", opts)
  end,
})

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

-- null-ls timeout
vim.lsp.buf.formatting_sync(nil, 5000)

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", timeout = 10000, filetypes = { "python" } },
  -- { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    timeout = 10000,
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--bracket-same-line" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    -- filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", 'scss', 'css', 'markdown', "html", "json" },
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
    -- extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = {},
  }
}

-- Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
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
        dir = vim.fn.expand("~/.cache/lvim/session/", nil),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
    config = function()
      vim.api.nvim_set_keymap("n", "s", "<Plug>Lightspeed_omni_s", { noremap = true })
      vim.api.nvim_set_keymap("n", "S", "<Plug>Lightspeed_omni_gs", { noremap = true })
    end
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
    config = function()
      require("spectre").setup()
      vim.cmd [[
        nnoremap <leader>* <cmd>lua require('spectre').open_visual({select_word=true})<CR>
        vnoremap <leader>* <cmd>lua require('spectre').open_visual()<CR>
      ]]
      -- nnoremap <leader># <cmd>lua require('spectre').open()<CR>
      -- nnoremap <leader>P viw:lua require('spectre').open_file_seainitrch()<cr>
    end,
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gvdiffsplit",
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
      vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard", "vista", "outline" }
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

      vim.api.nvim_set_keymap("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
      vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
      vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
      vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
      vim.api.nvim_set_keymap("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
      vim.api.nvim_set_keymap("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
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
      vim.g.lf_replace_netrw = 1
    end,
    requires = "voldikss/vim-floaterm"
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
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            'class',
            'function',
            'method',
          },
        },
      }
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "lsp_signature".setup()
    end
  },
  { "gbprod/yanky.nvim",
    config = function()

      local mapping = require("yanky.telescope.mapping")

      require("yanky").setup({
        highlight = {
          on_put = true,
          on_yank = true,
          timer = 500,
        },
        picker = {
          telescope = {
            mappings = {
              default = mapping.put("p"),
              i = {
                ["<c-p>"] = mapping.put("p"),
                ["<c-k>"] = mapping.put("P"),
              },
              n = {
                ["p"] = mapping.put("p"),
                ["P"] = mapping.put("P"),
              },
            }
          }
        }
      })

      vim.api.nvim_set_keymap("n", "p", "<Plug>(YankyPutAfter)", {})
      vim.api.nvim_set_keymap("n", "P", "<Plug>(YankyPutBefore)", {})
      vim.api.nvim_set_keymap("x", "p", "<Plug>(YankyPutAfter)", {})
      vim.api.nvim_set_keymap("x", "P", "<Plug>(YankyPutBefore)", {})
      vim.api.nvim_set_keymap("n", "gp", "<Plug>(YankyGPutAfter)", {})
      vim.api.nvim_set_keymap("n", "gP", "<Plug>(YankyGPutBefore)", {})
      vim.api.nvim_set_keymap("x", "gp", "<Plug>(YankyGPutAfter)", {})
      vim.api.nvim_set_keymap("x", "gP", "<Plug>(YankyGPutBefore)", {})

      vim.api.nvim_set_keymap("n", "]p", "<Plug>(YankyCycleForward)", {})
      vim.api.nvim_set_keymap("n", "[p", "<Plug>(YankyCycleBackward)", {})
    end
  },
  { "ThePrimeagen/refactoring.nvim",
    config = function()
      require('refactoring').setup({})

      -- Remaps for the refactoring operations currently offered by the plugin
      vim.api.nvim_set_keymap("v", "<leader>le",
        [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
        { noremap = true, silent = true, expr = false })
      vim.api.nvim_set_keymap("v", "<leader>lf",
        [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
        { noremap = true, silent = true, expr = false })
      vim.api.nvim_set_keymap("v", "<leader>lv",
        [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
        { noremap = true, silent = true, expr = false })
      vim.api.nvim_set_keymap("v", "<leader>li",
        [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
        { noremap = true, silent = true, expr = false })

      -- Extract block doesn't need visual mode
      vim.api.nvim_set_keymap("n", "<leader>lb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
        { noremap = true, silent = true, expr = false })
      vim.api.nvim_set_keymap("n", "<leader>lbf",
        [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
        { noremap = true, silent = true, expr = false })

      -- Inline variable can also pick up the identifier currently under the cursor without visual mode
      vim.api.nvim_set_keymap("n", "<leader>lv", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
        { noremap = true, silent = true, expr = false })

      -- load refactoring Telescope extension
      require("telescope").load_extension("refactoring")

      -- remap to open the Telescope refactoring menu in visual mode
      vim.api.nvim_set_keymap("v", "<leader>sr",
        "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", { noremap = true })
    end
  },
  { "chrisbra/NrrwRgn",
    config = function()
      vim.g.nrrw_rgn_nomap_nr = 1
      vim.g.nrrw_rgn_nomap_Nr = 1
    end
  },
  { "p00f/nvim-ts-rainbow",
    config = function()
      require("nvim-treesitter.configs").setup {
        rainbow = {
          enable = true,
          -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
          -- colors = {}, -- table of hex strings
          -- termcolors = {} -- table of colour name strings
        }
      }
    end
  },
  { "nathom/filetype.nvim",
    config = function()
      -- In init.lua or filetype.nvim's config file
      require("filetype").setup({
        overrides = {
          extensions = {
            mm = "objc",
          },
          literal = {
            ["Dockerfile"] = "dockerfile",
            [".prettierrc"] = "yaml",
            [".env"] = "sh",
            ["fish_variables"] = "fish",
          },
          complex = {
            ["Dockerfile*"] = "dockerfile",
            [".env.*"] = "sh",
          },
          function_complex = {
            ["*.fish"] = function()
              vim.cmd("compiler fish")
              vim.cmd("set foldmethod=expr")
            end,
          },
          shebang = {
            -- Set the filetype of files with a dash shebang to sh
            dash = "sh",
          },
        },
      })
    end
  },
  { "AndrewRadev/linediff.vim" },
  { "AndrewRadev/splitjoin.vim" },
  { "AndrewRadev/switch.vim" },
  { "benknoble/vim-racket" },
  { "dag/vim-fish" },
  { "dbakker/vim-paragraph-motion" },
  { "editorconfig/editorconfig-vim" },
  { "folke/lsp-colors.nvim" },
  { "folke/tokyonight.nvim" },
  { "glts/vim-textobj-comment" },
  { "jiangmiao/auto-pairs" },
  { "jose-elias-alvarez/nvim-lsp-ts-utils" },
  { "Julian/vim-textobj-variable-segment" },
  { "junegunn/vim-easy-align" },
  { "kana/vim-textobj-indent" },
  { "kana/vim-textobj-user" },
  { "mg979/vim-visual-multi" },
  { "pantharshit00/vim-prisma" },
  { "rbong/vim-flog" },
  { "tmux-plugins/vim-tmux-focus-events" },
  { "tommcdo/vim-exchange" },
  { "tpope/vim-abolish" },
  { "tpope/vim-dadbod" },
  { "tpope/vim-repeat" },
  { "tpope/vim-rsi" },
  { "tpope/vim-unimpaired" },
  { "troydm/zoomwintab.vim" },
  { "wellle/targets.vim" },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
