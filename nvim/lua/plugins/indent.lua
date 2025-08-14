return {
  {
    "nmac427/guess-indent.nvim",
    config = function()
      require("guess-indent").setup({
        auto_cmd = true,
        override_editorconfig = false,
        filetype_exclude = {
          "netrw",
          "tutor",
          "grug-far",
          "snacks_picker_input",
          "codecompanion",
          "copilot-chat",
        },
        buftype_exclude = {
          "help",
          "nofile",
          "terminal",
          "prompt",
        },
        on_tab_options = {
          ["expandtab"] = false,
        },
        on_space_options = {
          ["expandtab"] = true,
          ["tabstop"] = "detected",
          ["softtabstop"] = "detected",
          ["shiftwidth"] = "detected",
        },
      })
    end,
  },
}
