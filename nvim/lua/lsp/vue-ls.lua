require('lspconfig').vuels.setup {
    cmd = {DATA_PATH .. "/lspinstall/vue/node_modules/.bin/vls", "--stdio"},
    on_attach = require'lsp'.common_on_attach,
    root_dir = require('lspconfig').util.root_pattern(".git", "."),
    settings = {documentFormatting = false},
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = O.vue.diagnostics.virtual_text,
                signs = O.vue.diagnostics.signs,
                underline = O.vue.diagnostics.underline
            })
    }
}
