return {
  {
    "christoomey/vim-tmux-navigator",
    keys = function()
      return {
        { "<C-H>", "<cmd>TmuxNavigateLeft<cr>", mode = { "n", "v", "t" }, desc = "Navigate Left" },
        { "<C-L>", "<cmd>TmuxNavigateRight<cr>", mode = { "n", "v", "t" }, desc = "Navigate Right" },
        { "<C-J>", "<cmd>TmuxNavigateDown<cr>", mode = { "n", "v", "t" }, desc = "Navigate Down" },
        { "<C-K>", "<cmd>TmuxNavigateUp<cr>", mode = { "n", "v", "t" }, desc = "Navigate Up" },
      }
    end,
    init = function()
      vim.g.tmux_navigator_disable_when_zoomed = 1
      vim.g.tmux_navigator_preserve_zoom = 1
    end,
  },
}
