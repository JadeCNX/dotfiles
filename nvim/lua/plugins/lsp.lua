return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>cu", "<cmd>lua Snacks.picker.lsp_references()<cr>", desc = "LSP References" },
    },
  },
  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>cU", "<cmd>Trouble lsp_references<cr>", desc = "LSP References (Trouble)" },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    enabled = false,
  },
}
