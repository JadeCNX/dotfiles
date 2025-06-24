return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  keys = {
    { "<C-J>", false },
    { "<C-K>", false },
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_show_database_icon = 1
    vim.g.db_ui_disable_mappings = 1

    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "sql,mysql,plsql" },
      callback = function()
        require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" }, { name = "buffer" } } })
      end,
    })

    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "dbui" },
      callback = function()
        vim.keymap.set("n", "<CR>", "<Plug>(DBUI_SelectLine)", { buffer = true })
        vim.keymap.set("n", "o", "<Plug>(DBUI_SelectLine)", { buffer = true })
        vim.keymap.set("n", "<2-LeftMouse>", "<Plug>(DBUI_SelectLine)", { buffer = true })

        vim.keymap.set("n", "K", "<Plug>(DBUI_GotoPrevSibling)", { buffer = true })
        vim.keymap.set("n", "J", "<Plug>(DBUI_GotoNextSibling)", { buffer = true })
        vim.keymap.set("n", "<C-n>", "<Plug>(DBUI_GotoChildNode)", { buffer = true })
        vim.keymap.set("n", "<C-p>", "<Plug>(DBUI_GotoParentNode)", { buffer = true })
        -- vim.keymap.set("n", "<C-k>", "<Plug>(DBUI_GotoFirstSibling)", { buffer = true })
        -- vim.keymap.set("n", "<C-j>", "<Plug>(DBUI_GotoLastSibling)", { buffer = true })
        vim.keymap.set("n", "q", "<Plug>(DBUI_Quit)", { buffer = true })
        vim.keymap.set("n", "r", "<Plug>(DBUI_RenameLine)", { buffer = true })
        vim.keymap.set("n", "H", "<Plug>(DBUI_ToggleDetails)", { buffer = true })
        vim.keymap.set("n", "A", "<Plug>(DBUI_AddConnection)", { buffer = true })
        vim.keymap.set("n", "d", "<Plug>(DBUI_DeleteLine)", { buffer = true })
        vim.keymap.set("n", "R", "<Plug>(DBUI_Redraw)", { buffer = true })
        vim.keymap.set("n", "S", "<Plug>(DBUI_SelectLineVsplit)", { buffer = true })
      end,
    })
  end,
}
