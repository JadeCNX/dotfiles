return {
  {
    "echasnovski/mini.align",
    config = function()
      require("mini.align").setup()
    end,
  },
  {
    "echasnovski/mini.trailspace",
    opts = { only_in_normal_buffers = true },
    keys = {
      { "<leader>ct", "<cmd>lua MiniTrailspace.trim()<cr>", desc = "Trailspace" },
    },
  },
  {
    "echasnovski/mini.bracketed",
    enabled = false,
    config = function()
      require("mini.bracketed").setup()
    end,
  },
  { "echasnovski/mini.indentscope", enabled = false },
  { "echasnovski/mini.surround", enabled = false },
  {
    "echasnovski/mini.bufremove",
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
