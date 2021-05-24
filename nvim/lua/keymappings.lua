
local opt_noremap_silent = {noremap = true, silent = true}
local opt_silent = { silent = true }

-- vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', opt_noremap_silent)
-- vim.g.mapleader = ' '

-- no hl
-- vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', opt)

-- explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', opt_noremap_silent)

-- telescope
vim.api.nvim_set_keymap('n', '<Leader>p', ':Telescope find_files<CR>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '-', ':RnvimrToggle<CR>', opt_noremap_silent)

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
-- vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', opt)
-- vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', opt)

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

-- LSP
vim.api.nvim_set_keymap('n', '<leader>wa', '<cmd>Lspsaga code_action<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>wA', '<cmd>Lspsaga range_code_action<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>wd', '<cmd>Telescope lsp_document_diagnostics<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>wD', '<cmd>Telescope lsp_workspace_diagnostics<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>wf', '<cmd>LspFormatting<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>wi', '<cmd>LspInfo<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>wl', '<cmd>Lspsaga lsp_finder<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>wL', '<cmd>Lspsaga show_line_diagnostics<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>wp', '<cmd>Lspsaga preview_definition<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>wq', '<cmd>Telescope quickfix<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>wr', '<cmd>Lspsaga rename<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>wt', '<cmd>LspTypeDefinition<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>wx', '<cmd>cclose<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>ws', '<cmd>Telescope lsp_document_symbols<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>wS', '<cmd>Telescope lsp_workspace_symbols<cr>', opt_noremap_silent)

-- DEBUG
vim.api.nvim_set_keymap('n', '<leader>db', '<cmd>DebugToggleBreakpoint<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>dc', '<cmd>DebugContinue<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>di', '<cmd>DebugStepInto<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>DebugStepOver<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>dr', '<cmd>DebugToggleRepl<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>ds', '<cmd>DebugStart<cr>', opt_noremap_silent)

-- SEARCH
vim.api.nvim_set_keymap('n', '<leader>sb', '<cmd>Telescope git_branches<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>sc', '<cmd>Telescope colorscheme<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>sd', '<cmd>Telescope lsp_document_diagnostics<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>sD', '<cmd>Telescope lsp_workspace_diagnostics<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>sf', '<cmd>Telescope find_files<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>sm', '<cmd>Telescope marks<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>sM', '<cmd>Telescope man_pages<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>sr', '<cmd>Telescope oldfiles<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>sR', '<cmd>Telescope registers<cr>', opt_noremap_silent)
vim.api.nvim_set_keymap('n', '<leader>st', '<cmd>Telescope live_grep<cr>', opt_noremap_silent)
