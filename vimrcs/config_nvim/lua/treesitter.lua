require'nvim-treesitter.configs'.setup {
		ensure_installed = "all",
		highlight = {
			enable = true,
		},
		refactor = {
			highlight_definitions = { enable = true },
			-- highlight_current_scope = { enable = true },
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
		indent = {
			enable = true
		},
		rainbow = {
			enable = true,
			disable = {'bash'}
		},
		playground = {
			enable = true,
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = false -- Whether the query persists across vim sessions
		},
	}
