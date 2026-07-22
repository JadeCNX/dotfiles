return {
  {
    "folke/sidekick.nvim",
    opts = {
      cli = {
        mux = {
          backend = "tmux",
          enabled = true,
        },
        win = {
          keys = {
            buffers = { "<space>,", "buffers", mode = "nt", desc = "open buffer picker" },
          },
        },
        tools = {
          agy = {
            cmd = { "agy" },
            is_proc = "\\<agy\\>",
            url = "https://github.com/google-gemini/antigravity",
            continue = { "--continue" },
          },
        },
      },
    },
    keys = {
      {
        "<leader>ay",
        function()
          require("sidekick.cli").toggle({ name = "agy", focus = true })
        end,
        desc = "Sidekick Toggle Antigravity",
      },
    },
    config = function(_, opts)
      require("sidekick").setup(opts)
      vim.api.nvim_create_user_command("Agy", function()
        require("sidekick.cli").toggle({ name = "agy", focus = true })
      end, {})
    end,
  },
}
