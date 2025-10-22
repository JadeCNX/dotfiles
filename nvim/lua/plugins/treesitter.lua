return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    rainbow = {
      enable = true,
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
      colors = {
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
      },
      -- termcolors = {} -- table of colour name strings
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = true,
    opts = { max_lines = 3, mode = "topline" },
  },
}
