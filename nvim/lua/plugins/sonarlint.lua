return {
  {
    "https://gitlab.com/schrieveslaach/sonarlint.nvim.git",
    name = "sonarlint.nvim",
    dependencies = { "neovim/nvim-lspconfig", "mason-org/mason.nvim" },
    ft = { "python", "cpp", "c", "java", "cs", "dockerfile" },
    config = function()
      require("sonarlint").setup({
        server = {
          cmd = {
            "sonarlint-language-server",
            "-stdio",
            "-analyzers",
            vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
            vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
            vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
          },
        },
        filetypes = { "python", "cpp", "c", "java", "cs", "dockerfile" },
      })
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "sonarlint-language-server" } },
  },
}
