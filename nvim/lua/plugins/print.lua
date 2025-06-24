return {
  {
    "andrewferrier/debugprint.nvim",
    opts = {
      keymaps = {
        normal = {
          plain_below = "glp",
          plain_above = "glP",
          variable_below = "gll",
          variable_above = "glL",
          variable_below_alwaysprompt = "",
          textobj_below = "glo",
          variable_above_alwaysprompt = "",
          textobj_above = "glo",
          toggle_comment_debug_prints = "",
          delete_debug_prints = "",
        },
        insert = {
          plain = "<C-G>L",
          variable = "<C-G>l",
        },
        visual = {
          variable_below = "gll",
          variable_above = "glL",
        },
      },
      -- commands = {
      --   toggle_comment_debug_prints = "ToggleCommentDebugPrints",
      --   delete_debug_prints = "DeleteDebugPrints",
      --   reset_debug_prints_counter = "ResetDebugPrintsCounter",
      -- },
    },
  },
}
