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
      interactions = {
        chat = {
          adapter = "gemini",
        },
        inline = {
          adapter = "gemini",
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
      { "<leader>aP", "<cmd>CodeCompanionActions<cr>", desc = "Code Companion", mode = { "n", "v" } },
      { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Chat", mode = { "n", "v" } },
      { "<leader>aC", "<cmd>CodeCompanionChat Add<cr>", desc = "Chat add", mode = "v" },
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
  {
    "NickvanDyke/opencode.nvim",
    enabled = false,
    dependencies = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `snacks` provider.
      ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
      { "folke/snacks.nvim" },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition" on the type or field.
      }

      -- Required for `opts.events.reload`.
      vim.o.autoread = true

      -- Recommended/example keymaps.
      vim.keymap.set({ "n", "x" }, "<C-a>", function()
        require("opencode").ask("@this: ", { submit = true })
      end, { desc = "Ask opencode…" })
      vim.keymap.set({ "n", "x" }, "<C-x>", function()
        require("opencode").select()
      end, { desc = "Execute opencode action…" })
      vim.keymap.set({ "n", "t" }, "<C-.>", function()
        require("opencode").toggle()
      end, { desc = "Toggle opencode" })

      vim.keymap.set({ "n", "x" }, "go", function()
        return require("opencode").operator("@this ")
      end, { desc = "Add range to opencode", expr = true })
      vim.keymap.set("n", "goo", function()
        return require("opencode").operator("@this ") .. "_"
      end, { desc = "Add line to opencode", expr = true })

      vim.keymap.set("n", "<S-C-u>", function()
        require("opencode").command("session.half.page.up")
      end, { desc = "Scroll opencode up" })
      vim.keymap.set("n", "<S-C-d>", function()
        require("opencode").command("session.half.page.down")
      end, { desc = "Scroll opencode down" })

      -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o…".
      vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
      vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
    end,
  },
}
