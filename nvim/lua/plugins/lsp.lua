return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>cu", "<cmd>lua Snacks.picker.lsp_references()<cr>", desc = "LSP References" },
    },
  },
  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>cU", "<cmd>Trouble lsp_references<cr>", desc = "LSP References (Trouble)" },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    config = function(_, opts)
      local handle = io.popen('echo "$(mise where java@21)/bin/java"')
      if handle then
        local java_path = handle:read("*a"):gsub("%s+", "")
        handle:close()

        table.insert(opts.cmd, "--java-executable=" .. java_path)
      end

      return opts
    end,
  },
}
