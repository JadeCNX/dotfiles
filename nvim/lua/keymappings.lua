
local opt_noremap_silent = {noremap = true, silent = true}
local opt_silent = { silent = true }

-- better window movement
-- vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opt_silent)
-- vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', opt_silent)
-- vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', opt_silent)
-- vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opt_silent)

-- TODO fix this
-- Terminal window navigation
vim.cmd([[
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
  inoremap <C-h> <C-\><C-N><C-w>h
  inoremap <C-j> <C-\><C-N><C-w>j
  inoremap <C-k> <C-\><C-N><C-w>k
  inoremap <C-l> <C-\><C-N><C-w>l
  tnoremap <Esc> <C-\><C-n>
]])

-- TODO fix this
-- resize with arrows
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', opt_silent)
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', opt_silent)
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', opt_silent)
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', opt_silent)

-- better indenting
-- vim.api.nvim_set_keymap('v', '<', '<gv', opt)
-- vim.api.nvim_set_keymap('v', '>', '>gv', opt)

-- I hate escape
-- vim.api.nvim_set_keymap('i', 'fd', '<ESC>', opt)
-- vim.api.nvim_set_keymap('i', 'kj', '<ESC>', opt)
-- vim.api.nvim_set_keymap('i', 'jj', '<ESC>', opt)

-- Tab switch buffer
vim.api.nvim_set_keymap('n', ']b', ':bnext<CR>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '[b', ':bprevious<CR>', opt_noremap_silent)

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', opt_noremap_silent)
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', opt_noremap_silent)

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')
-- vim.cmd('inoremap <expr> <TAB> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <S-TAB> (\"\\<C-p>\")')

-- vim.api.nvim_set_keymap('i', '<C-TAB>', 'compe#complete()', {noremap = true, silent = true, expr = true})

-- vim.cmd([[
-- map p <Plug>(miniyank-autoput)
-- map P <Plug>(miniyank-autoPut)
-- map <leader>n <Plug>(miniyank-cycle)
-- map <leader>N <Plug>(miniyank-cycleback)
-- ]])
