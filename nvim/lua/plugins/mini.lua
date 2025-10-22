return {
  {
    "nvim-mini/mini.align",
    config = function()
      require("mini.align").setup()
    end,
  },
  {
    "nvim-mini/mini.trailspace",
    opts = { only_in_normal_buffers = true },
    keys = {
      { "<leader>ct", "<cmd>lua MiniTrailspace.trim()<cr>", desc = "Trailspace" },
    },
  },
  {
    "nvim-mini/mini.bracketed",
    enabled = false,
    config = function()
      require("mini.bracketed").setup()
    end,
  },
  { "nvim-mini/mini.indentscope", enabled = false },
  { "nvim-mini/mini.surround", enabled = false },
  {
    "nvim-mini/mini.bufremove",
    keys = {
      {
        "<C-q>",
        function()
          require("mini.bufremove").delete(0, false)
        end,
        desc = "Delete Buffer",
      },
    },
  },
}
