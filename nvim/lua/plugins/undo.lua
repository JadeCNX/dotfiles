return {
  {
    "simnalamburt/vim-mundo",
    lazy = false,
    cmd = "MundoToggle",
    keys = { { "<leader>xu", "<CMD>MundoToggle<CR>", desc = "Undo Tree" } },
  },
  {
    "kevinhwang91/nvim-fundo",
    dependencies = "kevinhwang91/promise-async",
  },
}
