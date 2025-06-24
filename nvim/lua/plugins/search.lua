return {
  {
    "MagicDuck/grug-far.nvim",
    keys = {
      {
        "<leader>*",
        function()
          require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
        end,
        desc = "Find current word",
      },
      {
        "<leader>*",
        function()
          require("lazyvim.util").pick("grep_string", { word_match = "-w" })
        end,
        desc = "Find selected word",
        mode = "v",
      },
    },
  },
}
