return {
  {
    "mg979/vim-visual-multi",
    init = function()
      vim.g.VM_theme = "ocean"
      vim.g.VM_skip_empty_lines = true
      vim.g.VM_maps = {
        ["Add Cursor Down"] = "<M-n>",
        ["Add Cursor Up"] = "<M-p>",
        ["Select Right"] = "<M-l>",
        ["Select Left"] = "<M-h>",
      }
    end,
  },
}
