local is_headless = #vim.api.nvim_list_uis() == 0

return {
  {
    "cormacrelf/dark-notify",
    name = "dark_notify",
    enabled = not is_headless,
    priority = 10,
    config = function()
      require("dark_notify").run({
        schemes = {
          dark = vim.g.dark_colorscheme,
          light = vim.g.light_colorscheme,
        },
      })
    end,
  },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   lazy = true,
  --   priority = 1000,
  --   opts = {
  --     compile = true,
  --     undercurl = true,
  --     transparent = true,
  --     commentStyle = { italic = true },
  --     functionStyle = { italic = true },
  --     keywordStyle = { italic = true },
  --     statementStyle = { bold = true },
  --     dimInactive = true,
  --   },
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    enabled = true,
    opts = {
      flavour = "mocha",
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true,
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    enabled = true,
    opts = {
      dark_variant = "moon",
      styles = {
        bold = true,
        italic = true,
        transparency = true,
      },
      extend_background_behind_borders = true,
    },
  },
  { "nyoom-engineering/oxocarbon.nvim", priority = 1000, lazy = true },
  -- { "loctvl842/monokai-pro.nvim", lazy = true },
  -- { "maxmx03/solarized.nvim", lazy = true },
  -- { "projekt0n/github-nvim-theme", name = "github-theme", lazy = true },
  -- { "RRethy/base16-nvim", priority = 1000, lazy = true },
  -- { "tanvirtin/monokai.nvim", priority = 1000, lazy = true },
  -- { "yorik1984/newpaper.nvim", lazy = true },
  -- {
  --   "loctvl842/monokai-pro.nvim",
  --   lazy = true,
  --   enabled = true,
  --   opts = {
  --     transparent_background = true,
  --     terminal_colors = true,
  --     filter = "octagon", -- classic | octagon | pro | machine | ristretto | spectrum
  --   },
  -- },
  {
    "olimorris/onedarkpro.nvim",
    opts = {
      options = {
        cursorline = true, -- Use cursorline highlighting?
        transparency = true, -- Use a transparent background?
        terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
        lualine_transparency = true, -- Center bar transparency?
        highlight_inactive_windows = true, -- When the window is out of focus, change the normal background?
      },
    },
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      italic_comments = true,
      cache = true,
    },
  },
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.italic_strings = false
      vim.g.transparent_background = true
    end,
  },
  { "nuvic/flexoki-nvim", name = "flexoki" },
}
