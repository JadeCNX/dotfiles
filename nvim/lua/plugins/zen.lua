return {
  {
    "Pocco81/true-zen.nvim",
    keys = {
      { "<leader>zz", "<cmd>TZFocus<cr>", desc = "Zen Focus" },
      { "<leader>za", "<cmd>TZAtaraxis<cr>", desc = "Zen Ataraxis" },
      { "<leader>zm", "<cmd>TZMinimalist<cr>", desc = "Zen Minimalist" },
      { "<leader>zn", [[ <cmd>'<,'>TZNarrow<cr> ]], desc = "Zen Narrow", mode = { "n", "v" } },
    },
  },
}
