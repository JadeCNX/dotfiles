-- BufOnly
vim.api.nvim_command([[command! BufOnly execute ':bufdo! bd #']])

-- Restore persistence
vim.api.nvim_create_user_command("RestorePersistence", function()
  require("persistence").load()
end, {})
