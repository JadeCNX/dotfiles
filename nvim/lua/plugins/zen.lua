return {
  {
    "Pocco81/true-zen.nvim",
    keys = {
      { "<leader>zz", "<cmd>TZFocus<cr>", desc = "Zen Focus" },
      { "<leader>za", "<cmd>TZAtaraxis<cr>", desc = "Zen Ataraxis" },
      { "<leader>zm", "<cmd>TZMinimalist<cr>", desc = "Zen Minimalist" },
      { "<leader>zw", [[<cmd>exec &wrap==0 ? "set wrap" : "set nowrap"<cr>]], desc = "Toggle wrap" },
      { "<leader>zn", [[ <cmd>'<,'>TZNarrow<cr> ]], desc = "Zen Narrow", mode = { "n", "v" } },
      {
        "<leader>zr",
        [[<cmd>exec &rnu==0 ? "set relativenumber" : "set norelativenumber"<cr>]],
        desc = "Toggle relative line numbers",
      },
    },
  },
}
