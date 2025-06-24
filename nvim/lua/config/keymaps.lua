-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("i", "fd", "<C-c>")

-- vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
-- vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
-- vim.keymap.set("n", "<leader>l", function() end)

-- vim.keymap.del("n", "f")
-- vim.keymap.del("n", "t")
-- vim.keymap.del("n", "F")
-- vim.keymap.del("n", "T")

vim.keymap.set("n", "<C-s>", ":w<cr>", { desc = "Save" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader><cr>", "<cmd>noh<cr>", { desc = "No Highlight" })

-- move counterlinewise
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })
vim.keymap.set("v", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("v", "k", "gk", { noremap = true, silent = true })

vim.keymap.set("i", "<C-c>", "<esc>", { noremap = false, silent = true })

-- move lines
-- vim.keymap.set("v", "P", ":m '<-2<CR>gv=gv", { noremap = false, silent = true })
-- vim.keymap.set("v", "N", ":m '>+1<CR>gv=gv", { noremap = false, silent = true })

-- quick marco
vim.keymap.set("n", "Q", "@@", { noremap = true })

-- :cmdline history with prefix
vim.keymap.set("c", "<C-P>", "<UP>", { noremap = true })
vim.keymap.set("c", "<C-N>", "<DOWN>", { noremap = true })

vim.keymap.set("n", "Y", '"*y', { noremap = true })
vim.keymap.set("v", "Y", '"*y', { noremap = true })

-- https://youtu.be/YwMgnmZNWXA
vim.keymap.set("n", "c*", "*Ncgn", { noremap = true })
vim.keymap.set("v", "*", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], { noremap = true, silent = true })

-- to the end of line
vim.keymap.set("n", "-", "$", { noremap = true })
vim.keymap.set("v", "-", "$", { noremap = true })
