-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "*.xml" },
  command = "setlocal sw=4",
})

-- Trigger `autoread` when files changes on disk
-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = { "*" },
  command = "if mode() != 'c' | checktime | endif",
})

-- Notification after file change
-- https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
  pattern = { "*" },
  command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None",
})

-- Disable automatic comment insertion
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "*" },
  command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
})

-- gx mapping to open URLs under cursor (like netrw's gx)
local function gx_browse(url)
  local viewer
  if vim.g.netrw_browsex_viewer then
    viewer = vim.g.netrw_browsex_viewer
  elseif vim.fn.has("unix") == 1 and vim.fn.executable("xdg-open") == 1 then
    viewer = "xdg-open"
  elseif vim.fn.has("macunix") == 1 and vim.fn.executable("open") == 1 then
    viewer = "open"
  elseif vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 then
    viewer = "start"
  else
    return
  end
  vim.fn.jobstart({ viewer, url }, { detach = true })
end

vim.keymap.set("n", "gx", function()
  local url = vim.fn.expand("<cWORD>")
  gx_browse(url)
end, { silent = true, desc = "Open URL under cursor" })
