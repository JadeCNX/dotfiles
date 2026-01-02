return {
  {
    "lewis6991/gitsigns.nvim",
    keys = function()
      local gitsigns = require("gitsigns")

      return {
        {
          "]g",
          function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              gitsigns.nav_hunk("next")
            end
          end,
          desc = "Next Hunk",
        },
        {
          "[g",
          function()
            if vim.wo.diff then
              vim.cmd.normal({ "[c", bang = true })
            else
              gitsigns.nav_hunk("prev")
            end
          end,
          desc = "Prev Hunk",
        },
        {
          "<leader>gl",
          function()
            gitsigns.blame_line({ full = true })
          end,
          desc = "Blame",
        },
        { "<leader>gL", gitsigns.toggle_current_line_blame, desc = "Toogle Blame" },
        -- { "<leader>gh", gitsigns.preview_hunk, desc = "Preview Hunk" },
        { "<leader>gs", gitsigns.stage_hunk, desc = "Stage Hunk" },
        { "<leader>gS", gitsigns.stage_buffer, desc = "Stage Hunk" },
        {
          "<leader>gs",
          function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end,
          desc = "Stage Hunk",
          mode = "v",
        },
        { "<leader>gr", gitsigns.reset_hunk, desc = "Reset Hunk" },
        { "<leader>gR", gitsigns.reset_buffer, desc = "Reset buffer" },
        {
          "<leader>gr",
          function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end,
          desc = "Stage Hunk",
          mode = "v",
        },
        { "<leader>gd", gitsigns.diffthis, desc = "Git Diff", mode = { "n", "v" } },
        {
          "<leader>gD",
          function()
            gitsigns.diffthis("~")
          end,
          desc = "Git Diff",
          mode = { "n", "v" },
        },
        { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
        { "<leader>gB", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
        { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
        { "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout commit(for current file)" },

        { "ih", "<cmd><C-U>Gitsigns select_hunk<CR>", desc = "Select hunk", mode = { "o", "x" } },
      }
    end,
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 100,
        ignore_whitespace = true,
      },
    },
  },
}
