return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      copilot_node_command = vim.g.node_host_prog,
    },
  },
  {
    "David-Kunz/gen.nvim",
    enabled = false,
    keys = {
      { "<leader>GG", "<cmd>Gen<cr>", desc = "Gen", mode = { "n", "v" } },
      { "<leader>GS", "<cmd>Gen Enhance_Grammar_Spelling<CR>", desc = "Spelling", mode = { "n", "v" } },
      { "<leader>GW", "<cmd>Gen Enhance_Wording<CR>", desc = "Wording", mode = { "n", "v" } },
      { "<leader>GC", "<cmd>Gen Enhance_Code<CR>", desc = "Coding", mode = { "n", "v" } },
      { "<leader>GR", "<cmd>Gen Review_Code<CR>", desc = "Reviewing", mode = { "n", "v" } },
    },
    opts = {
      model = "codellama", -- The default model to use.
      display_mode = "float", -- The display mode. Can be "float" or "split".
      show_prompt = true, -- Shows the Prompt submitted to Ollama.
      show_model = false, -- Displays which model you are using at the beginning of your chat session.
      no_auto_close = false, -- Never closes the window automatically.
      debug = false, -- Prints errors and the command which is run.
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    tag = "v3.2.0",
    build = "make tiktoken",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      {
        "<leader>Cc",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "Quick chat",
      },
      {
        "<leader>Ch",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.help_actions())
        end,
        desc = "Help actions",
      },
      {
        "<leader>Cp",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "Prompt actions",
      },
      { "<leader>CC", "<cmd>CopilotChat<CR>", desc = "Toggle Copilot Chat", mode = { "n", "v" } },
      { "<leader>Ce", "<cmd>CopilotChatExplain<CR>", desc = "Explains", mode = { "n", "v" } },
      { "<leader>Cr", "<cmd>CopilotChatReview<CR>", desc = "Review", mode = { "n", "v" } },
      { "<leader>Cf", "<cmd>CopilotChatFix<CR>", desc = "Fix", mode = { "n", "v" } },
      { "<leader>Co", "<cmd>CopilotChatOptimize<CR>", desc = "Optimize", mode = { "n", "v" } },
      { "<leader>Cd", "<cmd>CopilotChatDocs<CR>", desc = "Docs", mode = { "n", "v" } },
      { "<leader>Ct", "<cmd>CopilotChatTests<CR>", desc = "Tests", mode = { "n", "v" } },
      { "<leader>Cm", "<cmd>CopilotChatCommit<CR>", desc = "Commit All", mode = { "n", "v" } },
      { "<leader>Cs", "<cmd>CopilotChatCM<CR>", desc = "Commit", mode = { "n", "v" } },
      { "<leader>CS", "<cmd>CopilotChatCCM<CR>", desc = "Convesion Commit", mode = { "n", "v" } },
    },
    opts = function()
      require("CopilotChat.integrations.cmp").setup()

      require("CopilotChat").setup({
        mappings = {
          complete = {
            insert = "",
          },
        },
      })

      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)
      return {
        model = "gpt-4",
        auto_insert_mode = true,
        show_help = true,
        question_header = "  " .. user .. " ",
        answer_header = "  Copilot ",
        log_level = "error",
        window = {
          layout = "horizontal",
          width = 0.4,
          height = 0.4,
        },
        mapping = {
          reset = {
            normal = "<C-,>",
            insert = "<C-,>",
          },
        },
        selection = function(source)
          local select = require("CopilotChat.select")
          return select.visual(source) or select.buffer(source)
        end,
        prompts = {
          CM = {
            prompt = "#git:staged\n\nWrite commit message for the change without commas or colons. Avoid using word `refactor`. Summary the change in unordered list format. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
          },
          CCM = {
            prompt = "#git:staged\n\nWrite commit message for the change with commitizen convention. Summary the change in unordered list format. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
          },
        },
      }
    end,
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    enabled = false,
    lazy = false,
    version = false,
    opts = {
      provider = "copilot",
      auto_suggestions_provider = "copilot",
      hints = { enabled = false },
    },
    keys = {
      { "<leader>ax", "<cmd>AvanteClear<cr>", desc = "avante: clear", mode = { "n", "v" } },
    },
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "echasnovski/mini.icons",
      "zbirenbaum/copilot.lua",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/mcphub.nvim",
      "ravitemer/codecompanion-history.nvim",
    },
    opts = {
      strategies = {
        chat = {
          adapter = "copilot",
        },
        inline = {
          adapter = "copilot",
        },
      },
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
        history = {
          enabled = true,
          opts = {
            -- Keymap to open history from chat buffer (default: gh)
            keymap = "<leader>ah",
            -- Automatically generate titles for new chats
            auto_generate_title = true,
            ---On exiting and entering neovim, loads the last chat on opening chat
            continue_last_chat = false,
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
      { "<leader>ap", "<cmd>CodeCompanionActions<cr>", desc = "Code Companion", mode = { "n", "v" } },
      { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Chat", mode = { "n", "v" } },
      { "<leader>aA", "<cmd>CodeCompanionChat Add<cr>", desc = "Chat add", mode = "v" },
    },
  },
}
