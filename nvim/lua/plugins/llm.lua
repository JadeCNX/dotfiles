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
          claude_code = {
            cmd = { "claude" },
            is_proc = "\\<claude\\>",
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
      {
        "<leader>ac",
        function()
          require("sidekick.cli").toggle({ name = "claude_code", focus = true })
        end,
        desc = "Sidekick Toggle Claude Code",
      },
    },
    config = function(_, opts)
      require("sidekick").setup(opts)
      vim.api.nvim_create_user_command("Agy", function()
        require("sidekick.cli").toggle({ name = "agy", focus = true })
      end, {})
    end,
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/codecompanion-history.nvim",
    },
    opts = {
      log_level = "DEBUG",
      display = {
        chat = {
          show_settings = true,
        },
      },
      interactions = {
        chat = {
          adapter = "claude_code",
        },
        inline = {
          adapter = "claude_code",
        },
      },
      adapters = {
        claude_code = function()
          return require("codecompanion.adapters").extend("claude_code", {
            env = {
              api_key = "CLAUDE_CODE_OAUTH_TOKEN",
            },
          })
        end,
      },
      extensions = {
        history = {
          enabled = true,
          opts = {
            -- Keymap to open history from chat buffer (default: gh)
            keymap = "<leader>ah",
            -- Automatically generate titles for new chats
            auto_generate_title = false,
            ---On exiting and entering neovim, loads the last chat on opening chat
            continue_last_chat = true,
            ---When chat is cleared with `gx` delete the chat from history
            delete_on_clearing_chat = false,
            -- Picker interface ("telescope" or "default")
            picker = "default",
            ---Enable detailed logging for history extension
            enable_logging = false,
            ---Directory path to save the chats
            dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
          },
        },
      },
    },
    keys = {
      { "<leader>aP", "<cmd>CodeCompanionActions<cr>", desc = "Code Companion", mode = { "n", "v" } },
      { "<leader>an", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Chat", mode = { "n", "v" } },
      { "<leader>aN", "<cmd>CodeCompanionChat Add<cr>", desc = "Chat add", mode = "v" },
    },
  },
}
