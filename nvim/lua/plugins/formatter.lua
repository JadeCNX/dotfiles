return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft.html = { "prettier_html" }
      opts.formatters_by_ft.zsh = { "shfmt" }
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
}
