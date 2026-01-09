return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft.html = { "prettier_html" }
      opts.formatters_by_ft.zsh = { "shfmt" }
      opts.formatters_by_ft.xml = { "xmlformatter" }
      opts.formatters_by_ft.sql = { "sqlformatter" }
      opts.formatters.sqlformatter = {
        command = "sql-formatter",
        args = { "$FILENAME" },
      }
      opts.formatters.xmlformatter = {
        command = "xmlformat",
        args = { "--blanks", "--selfclose", "--indent=4", "-" },
      }
      opts.formatters.prettier_html = {
        command = "prettier",
        args = {
          "--print-width=180",
          "--no-bracket-spacing",
          "--bracket-same-line",
          "--no-bracket-spacing",
          "--html-whitespace-sensitivity=ignore",
          "--stdin-filepath",
          "$FILENAME",
        },
        range_args = function(_, ctx)
          return { "--range-start", ctx.range.start[1], "--range-end", ctx.range["end"][1] }
        end,
      }

      return opts
    end,
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters_by_ft.sql = {}
    end,
  },
  {
    "nanotee/sqls.nvim",
  },
}
