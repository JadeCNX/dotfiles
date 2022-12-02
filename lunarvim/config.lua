-- timeout before show which_key and also exit current command chain
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

vim.opt.listchars = "tab:>-,trail:.,precedes:,extends:,space:⋅,eol:↴"

vim.g.loaded_perl_provider = 0

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
vim.g.loaded_matchit = 1
-- vim.g.loaded_matchparen = 1


if os.getenv("NEOVIDE") then
  vim.o.guifont = "DankMono Nerd Font"
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
end

local function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

local python_path = "/usr/local/bin/python3"
if file_exists(python_path) then
  vim.g.python3_host_prog = python_path
end

local ruby_path = "/usr/local/opt/ruby/bin/ruby"
if file_exists(ruby_path) then
  vim.g.ruby_host_prog = ruby_path
end

-- general
lvim.log.level = "error"
lvim.colorscheme = "nightfox"
lvim.format_on_save = {
  pattern = "*.go",
}

-- scroll off
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.scrollopt:append "hor"

lvim.builtin.project.patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "main.go" }

-- Trigger `autoread` when files changes on disk
-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
lvim.autocommands.auto_read = {
  { "FocusGained,BufEnter,CursorHold,CursorHoldI", "*", "if mode() != 'c' | checktime | endif" }
}

-- Notification after file change
-- https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
lvim.autocommands.auto_read_notification = {
  { "FileChangedShellPost", "*", "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None" }
}

-- Disable automatic comment insertion
lvim.autocommands.disable_comment_insertion = {
  { "FileType", "*", [[setlocal formatoptions-=c formatoptions-=r formatoptions-=o]] }
}

-- keymappings

lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["<C-q>"] = "<cmd>BufferKill<cr>"

lvim.keys.normal_mode["<leader>c"] = false

lvim.keys.visual_block_mode["J"] = false
lvim.keys.visual_block_mode["K"] = false

-- move counterlinewise
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })
vim.api.nvim_set_keymap("v", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("v", "k", "gk", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-c>", "<esc>", { noremap = false, silent = true })

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

lvim.builtin.which_key.mappings["<cr>"] = { "<cmd>noh<cr>", "No Highlight" }

lvim.builtin.which_key.setup.plugins.registers = false

-- profiling
lvim.builtin.which_key.mappings["D"] = {
  name = "Profiling",
  D = {
    [[:exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>]],
    "Start profiling"
  },
  Q = { [[:exe ":profile pause"<cr>:noautocmd qall!<cr>]], "Quit profiling" }
}

lvim.builtin.which_key.mappings["c"] = {
  name = "Commenter"
}

lvim.builtin.which_key.mappings["e"] = {
  name = "Explorer",
  e = { "<cmd>NvimTreeToggle<cr>", "Explorer pane" },
  t = { "<cmd>Lf<cr>", "LF" }
}

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" }
}

lvim.builtin.which_key.mappings["sT"] = { "<cmd>lua require('spectre').open_file_search()<cr>", "Search Current File" }

lvim.builtin.which_key.mappings["?"] = { "<cmd>lua require('spectre').open()<cr>", "Search & Replace" }
lvim.builtin.which_key.mappings["/"] = { "<cmd>lua require'telescope.builtin'.live_grep{}<cr>", "Search" }

lvim.builtin.which_key.mappings["F"] = { "<cmd>lua require'telescope.builtin'.find_files{}<cr>", "Search Files" }

lvim.builtin.which_key.mappings["s."] = { "<cmd>lua require'telescope.builtin'.resume{ sources = {'gitmoji'}}<cr>",
  "Search Resume" }
lvim.builtin.which_key.mappings["se"] = { "<cmd>lua require'telescope.builtin'.symbols{ sources = {'gitmoji'}}<cr>",
  "Search Emoji" }
lvim.builtin.which_key.mappings["ss"] = { "<cmd>lua require'telescope.builtin'.spell_suggest{}<cr>", "Spell Suggest" }

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
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<cr>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" }
}

lvim.builtin.which_key.mappings["gB"] = { "<cmd>Git blame<cr>", "Git blame" }

lvim.builtin.which_key.mappings["lo"] = { [[<cmd>lua require("typescript").actions.organizeImports()<cr>]],
  "Organiz Imports" }
lvim.builtin.which_key.mappings["lO"] = { [[<cmd>lua require("typescript").actions.fixAll()<cr>]], "Fix All" }
lvim.builtin.which_key.mappings["lm"] = { [[<cmd>lua require("typescript").actions.addMissingImports()<cr>]],
  "Add Missing Imports" }
lvim.builtin.which_key.mappings["lM"] = { [[<cmd>lua require("typescript").actions.removeUnused()<cr>]], "Remove Unused" }

lvim.builtin.which_key.mappings["l"]["f"] = {
  function()
    require("lvim.lsp.utils").format { timeout_ms = 5000 }
  end,
  "LSP format",
}

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
-- lvim.builtin.alpha.active = false
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true

lvim.builtin.nvimtree.setup.view.side = "left"

lvim.builtin.gitsigns.word_diff = true
lvim.builtin.gitsigns.current_line_blame = true
lvim.builtin.gitsigns.current_line_blame_opts = {
  virt_text = true,
  virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
  delay = 180,
  ignore_whitespace = true
}

-- if you don't want all the parsers change this to a table of the ones you want
-- lvim.builtin.treesitter.ensure_installed = "all"
-- lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.rainbow.colors = {

  -- -- oceanic-next
  -- "#ec5f67",
  -- "#f99157",
  -- "#fac863",
  -- "#99c794",
  -- "#62b3b2",
  -- "#6699cc",
  -- "#c594c5",
  -- "#ab7967",

  -- -- monokai-pro
  "#fc618d",
  "#fd9353",
  "#fce566",
  "#7bd88f",
  "#5ad4e6",
  "#948ae3",
}

lvim.builtin.treesitter.matchup.enable = true
lvim.builtin.treesitter.textobjects.select = {
  enable = true,
  lookahead = true,
  keymaps = {
    ["af"] = "@function.outer",
    ["if"] = "@function.inner",
    ["ac"] = "@class.outer",
    ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
  },
  selection_modes = {
    ['@parameter.outer'] = 'v',
    ['@function.outer'] = 'V',
    ['@class.outer'] = '<c-v>',
  }
}

lvim.builtin.telescope.defaults.preview = { treesitter = false }
lvim.builtin.telescope.defaults.mappings.n["c-c"] = require("telescope.actions").close

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
  { exe = "black", filetypes = { "python" } },
  { exe = "isort", filetypes = { "python" } },
  { exe = "beautysh" },
  {
    exe = "prettier",
    -- extra_args = { "--bracket-same-line" },
    filetypes = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
      'scss',
      'css',
      'markdown',
      "html",
      "jsonc",
      "json"
    },
  }
}

lvim.lsp.null_ls.setup = {
  debug = false,
  default_timeout = 5000,
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { exe = "cspell",
  --   diagnostic_config = {
  --     -- see :help vim.diagnostic.config()
  --     underline = true,
  --     virtual_text = false,
  --     signs = true,
  --     update_in_insert = false,
  --     severity_sort = true,
  --   }
  -- },
  { exe = "eslint",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
    diagnostic_config = {
      underline = true,
      virtual_text = true,
      signs = true,
      update_in_insert = false,
      severity_sort = true,
    }
  },
  { exe = "pylama", filetypes = { "python" } },
  { exe = "shellcheck", filetypes = { "sh", "bash" } },
  { exe = "zsh", filetype = { "zsh" } },
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  { exe = "eslint", filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" } },
  -- { exe = "cspell" },
}

for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
    {
      name = 'Launch',
      type = 'jsnode',
      request = 'launch',
      program = '${file}',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      console = 'integratedTerminal',
    },
    {
      -- For this to work you need to make sure the node process is started with the `--inspect` flag.
      name = 'Attach to process',
      type = 'jsnode',
      request = 'attach',
      processId = require 'dap.utils'.pick_process,
    },
  }
end


-- Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle"
  },
  -- {
  --   "tzachar/cmp-tabnine",
  --   run = "./install.sh",
  --   requires = "hrsh7th/nvim-cmp",
  --   event = "InsertEnter"
  -- },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    module = "persistence",
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand("~/.cache/lvim/session/", nil),
        options = { "buffers", "curdir", "tabpages", "winsize" }
      }
    end
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup(
        {
          auto_enable = true,
          preview = {
            win_height = 12,
            win_vheight = 12,
            delay_syntax = 80,
            border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" }
          },
          func_map = {
            vsplit = "",
            ptogglemode = "z,",
            stoggleup = ""
          },
          filter = {
            fzf = {
              action_for = { ["ctrl-s"] = "split" },
              extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " }
            }
          }
        }
      )
    end
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup(
        {
          lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
          lastplace_ignore_filetype = {
            "gitcommit",
            "gitrebase",
            "svn",
            "hgcommit"
          },
          lastplace_open_folds = true
        }
      )
    end
  },
  {
    "windwp/nvim-spectre",
    config = function()
      require("spectre").setup()
      vim.cmd [[
        nnoremap <leader>* <cmd>lua require('spectre').open_visual({select_word=true})<cr>
        vnoremap <leader>* <cmd>lua require('spectre').open_visual()<cr>
      ]]
    end
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
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
    "metakirby5/codi.vim",
    config = function()
      vim.g["codi#aliases"] = {
        ["javascriptreact"] = 'javascript',
        ["typescriptreact"] = 'typescript'
      }
      vim.g["codi#interpreters"] = {
        ["python"] = { bin = 'python3' },
      }
    end
  },
  {
    "simnalamburt/vim-mundo",
    cmd = "MundoToggle"
  },
  {
    "monaqa/dial.nvim",
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group {
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.new { elements = { "and", "or" }, word = true, cyclic = true },
          augend.constant.new { elements = { "&&", "||" }, word = false, cyclic = true },
          augend.constant.new { elements = { "true", "false" }, word = false, cyclic = true },
          augend.constant.new { elements = { "True", "False" }, word = false, cyclic = true },
          augend.constant.new { elements = { "TRUE", "FALSE" }, word = false, cyclic = true },
          augend.constant.new { elements = { "let", "const" }, cyclic = true },
        },
        visual = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.alpha,
          augend.constant.alias.Alpha
        },
      }

      vim.api.nvim_set_keymap("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
      vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
      vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
      vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
      vim.api.nvim_set_keymap("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
      vim.api.nvim_set_keymap("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
    end
  },
  {
    "felipec/vim-sanegx",
    event = "BufRead"
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
      vim.g.NERDDefaultAlign = "both"
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
        show_numbers = true,
        show_cursorline = true
      }
    end
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true,
        throttle = true,
        max_lines = 0,
        patterns = {
          default = {
            "class",
            "function",
            "method"
          }
        }
      }
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup(
        {
          'css';
          'html';
          'javascript';
          'javascriptreact';
          'typescript';
          'typescriptreact';
        },
        {
          RGB = true,
          RRGGBB = true,
          RRGGBBAA = true,
          rgb_fn = true,
          hsl_fn = true,
          css = true,
          css_fn = true
        }
      )
    end
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline"
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "lsp_signature".setup()
    end
  },
  {
    "ThePrimeagen/refactoring.nvim",
    config = function()
      require("refactoring").setup({})

      vim.api.nvim_set_keymap(
        "v",
        "<leader>le",
        [[ <esc><cmd>lua require('refactoring').refactor('Extract Function')<cr>]],
        { noremap = true, silent = true, expr = false }
      )
      vim.api.nvim_set_keymap(
        "v",
        "<leader>lE",
        [[ <esc><cmd>lua require('refactoring').refactor('Extract Function To File')<cr>]],
        { noremap = true, silent = true, expr = false }
      )
      vim.api.nvim_set_keymap(
        "v",
        "<leader>lv",
        [[ <esc><cmd>lua require('refactoring').refactor('Extract Variable')<cr>]],
        { noremap = true, silent = true, expr = false }
      )
      vim.api.nvim_set_keymap(
        "v",
        "<leader>li",
        [[ <esc><cmd>lua require('refactoring').refactor('Inline Variable')<cr>]],
        { noremap = true, silent = true, expr = false }
      )

      vim.api.nvim_set_keymap(
        "n",
        "<leader>lb",
        [[ <esc><cmd>lua require('refactoring').refactor('Extract Block')<cr>]],
        { noremap = true, silent = true, expr = false }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>lbf",
        [[ <esc><cmd>lua require('refactoring').refactor('Extract Block To File')<cr>]],
        { noremap = true, silent = true, expr = false }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>lv",
        [[ <esc><cmd>lua require('refactoring').refactor('Inline Variable')<cr>]],
        { noremap = true, silent = true, expr = false }
      )

      require("telescope").load_extension("refactoring")

      vim.api.nvim_set_keymap(
        "v",
        "<leader>sr",
        "<cmd>lua require('telescope').extensions.refactoring.refactors()<cr>",
        { noremap = true }
      )
    end
  },
  {
    "chrisbra/NrrwRgn",
    config = function()
      vim.g.nrrw_rgn_nomap_nr = 1
      vim.g.nrrw_rgn_nomap_Nr = 1
    end
  },
  {
    "nathom/filetype.nvim",
    config = function()
      require("filetype").setup(
        {
          overrides = {
            extensions = {
              mm = "objc",
              conf = "sh"
            },
            literal = {
              ["Dockerfile"] = "dockerfile",
              [".prettierrc"] = "yaml",
              [".env"] = "sh",
              ["fish_variables"] = "fish",
              ["Jenkinsfile"] = "groovy"
            },
            complex = {
              ["Dockerfile*"] = "dockerfile",
              [".env.*"] = "sh",
              ["Jenkinsfile*"] = "groovy"
            },
            function_complex = {
              ["*.fish"] = function()
                vim.cmd("compiler fish")
                vim.cmd("set foldmethod=expr")
              end
            },
            shebang = {
              dash = "sh"
            }
          }
        }
      )
    end
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    config = function()
      require("typescript").setup({
        disable_commands = false,
        debug = false,
        go_to_source_definition = {
          fallback = true,
        }
      })
    end
  },
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  { "ggandor/leap.nvim",
    config = function()
      require('leap').add_default_mappings()
    end
  },
  { "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end
  },
  { "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup {}
    end
  },
  { "EdenEast/nightfox.nvim",
    config = function()
      require('nightfox').setup({
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          }
        }
      })
    end
  },
  { "Wansmer/treesj",
    config = function()
      require 'treesj'.setup {
        use_default_keymaps = false,
      }

      local langs = require 'treesj.langs'['presets']

      vim.api.nvim_create_autocmd({ 'FileType' }, {
        pattern = '*',
        callback = function()
          local opts = { buffer = true }
          if langs[vim.bo.filetype] then
            vim.keymap.set('n', 'gS', '<Cmd>TSJSplit<CR>', opts)
            vim.keymap.set('n', 'gJ', '<Cmd>TSJJoin<CR>', opts)
          else
            vim.keymap.set('n', 'gS', '<Cmd>SplitjoinSplit<CR>', opts)
            vim.keymap.set('n', 'gJ', '<Cmd>SplitjoinJoin<CR>', opts)
          end
        end,
      })
    end
  },
  { "AndrewRadev/linediff.vim" },
  { "AndrewRadev/splitjoin.vim" },
  { "AndrewRadev/switch.vim" },
  { "christoomey/vim-tmux-navigator" },
  { "dag/vim-fish" },
  { "dbakker/vim-paragraph-motion" },
  { "eandrju/cellular-automaton.nvim" },
  { "editorconfig/editorconfig-vim" },
  { "glts/vim-textobj-comment" },
  { "jiangmiao/auto-pairs" },
  { "Julian/vim-textobj-variable-segment" },
  { "junegunn/vim-easy-align" },
  { "kana/vim-textobj-indent" },
  { "kana/vim-textobj-user" },
  { "kristijanhusak/vim-dadbod-ui" },
  { "mfussenegger/nvim-jdtls" },
  { "mg979/vim-visual-multi" },
  { "nvim-telescope/telescope-symbols.nvim" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "p00f/nvim-ts-rainbow", },
  { "pantharshit00/vim-prisma" },
  { "rbong/vim-flog" },
  { "tmux-plugins/vim-tmux-focus-events" },
  { "tommcdo/vim-exchange" },
  { "tpope/vim-abolish" },
  { "tpope/vim-dadbod" },
  { "tpope/vim-repeat" },
  { "tpope/vim-rsi" },
  { "tpope/vim-sleuth" },
  { "tpope/vim-unimpaired" },
  { "troydm/zoomwintab.vim" },
  { "vim-scripts/LargeFile" },
  { "wellle/targets.vim" }
  -- { "zbirenbaum/copilot." },
  -- { "tpope/vim-surround" },
}
