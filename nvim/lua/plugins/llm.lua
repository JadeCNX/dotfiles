return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      copilot_node_command = vim.g.node_host_prog,
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    build = "make tiktoken",
    cmd = "CopilotChat",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "nvim-lua/plenary.nvim",
      "ravitemer/mcphub.nvim",
      "Davidyz/VectorCode",
    },
    keys = {
      { "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
      { "<leader>C", "", desc = "+ai", mode = { "n", "x" } },
      {
        "<leader>CC",
        function()
          return require("CopilotChat").toggle()
        end,
        desc = "Toggle",
        mode = { "n", "x" },
      },
      {
        "<leader>Cx",
        function()
          return require("CopilotChat").reset()
        end,
        desc = "Clear",
        mode = { "n", "x" },
      },
      {
        "<leader>Cc",
        function()
          vim.ui.input({
            prompt = "Quick Chat: ",
          }, function(input)
            if input ~= "" then
              require("CopilotChat").ask(input)
            end
          end)
        end,
        desc = "Quick Chat",
        mode = { "n", "x" },
      },
      {
        "<leader>Cp",
        function()
          require("CopilotChat").select_prompt()
        end,
        desc = "Prompt Actions",
        mode = { "n", "x" },
      },
      { "<leader>Ce", "<cmd>CopilotChatExplain<CR>", desc = "Explains", mode = { "n", "v" } },
      { "<leader>Cr", "<cmd>CopilotChatReview<CR>", desc = "Review", mode = { "n", "v" } },
      { "<leader>Cf", "<cmd>CopilotChatFix<CR>", desc = "Fix", mode = { "n", "v" } },
      { "<leader>Co", "<cmd>CopilotChatOptimize<CR>", desc = "Optimize", mode = { "n", "v" } },
      { "<leader>Cd", "<cmd>CopilotChatDocs<CR>", desc = "Docs", mode = { "n", "v" } },
      { "<leader>Ct", "<cmd>CopilotChatTests<CR>", desc = "Tests", mode = { "n", "v" } },
    },
    opts = function()
      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)
      return {
        model = "gpt-4.1",
        -- temperature = 0.1,
        auto_insert_mode = true,
        show_help = true,
        log_level = "error",
        headers = {
          user = "  " .. user .. " ", -- Header to use for user questions
          assistant = "  Copilot ", -- Header to use for AI answers
          tool = "## Tool ", -- Header to use for tool calls
        },
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
      }
    end,
    config = function(_, opts)
      local chat = require("CopilotChat")

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-chat",
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
        end,
      })

      chat.setup(opts)
    end,
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/mcphub.nvim",
      "ravitemer/codecompanion-history.nvim",
      "Davidyz/VectorCode",
    },
    opts = {
      ignore_warnings = true,
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
      { "<leader>a", desc = "+AI Chat", icon = "󰭺" },
      { "<leader>ap", "<cmd>CodeCompanionActions<cr>", desc = "Code Companion", mode = { "n", "v" } },
      { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Chat", mode = { "n", "v" } },
      { "<leader>aA", "<cmd>CodeCompanionChat Add<cr>", desc = "Chat add", mode = "v" },
    },
  },
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest",
    config = function()
      require("mcphub").setup({
        extensions = {
          copilotchat = {
            enabled = true,
            convert_tools_to_functions = true,
            convert_resources_to_functions = true,
            add_mcp_prefix = false,
          },
        },
      })
    end,
    keys = {
      { "<leader>aH", "<cmd>MCPHub<cr>", desc = "MCP Hub", mode = { "n" } },
    },
  },
  {
    "Davidyz/VectorCode",
    version = "*",
    build = "uv tool upgrade vectorcode", -- This helps keeping the CLI up-to-date
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
