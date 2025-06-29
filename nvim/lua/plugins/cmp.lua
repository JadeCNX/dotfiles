return {
  {
    "saghen/blink.cmp",
    lazy = true,
    opts = function(_, o)
      local conf = {
        completion = {
          documentation = { auto_show = false },
          trigger = {
            show_in_snippet = false,
          },
          list = {
            selection = {
              preselect = function()
                return not require("blink.cmp").snippet_active({ direction = 1 })
              end,
            },
          },
        },
        keymap = {
          preset = "super-tab",
          ["<Tab>"] = {
            function(cmp)
              if cmp.snippet_active() then
                return cmp.accept()
              else
                return cmp.select_and_accept()
              end
            end,
            require("lazyvim.util.cmp").map({ "snippet_forward", "ai_accept" }),
            "fallback",
          },
          ["<C-i>"] = { "show", "show_documentation", "hide_documentation" },
        },
      }

      return vim.tbl_deep_extend("force", o, conf)
    end,
  },
}
