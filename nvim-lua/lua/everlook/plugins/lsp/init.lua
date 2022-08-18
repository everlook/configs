local lsp = require('lspconfig')

local flags = {
    allow_incremental_sync = true,
    debounce_text_changes = 200,
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local custom_attach = function(client, bufnr)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0} )
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0} )
    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {buffer=0} )
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0} )
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0} )
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0} )
    -- vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0} )
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0} )
end

lsp.rust_analyzer.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = custom_attach,
})

util = require "lspconfig/util"

lsp.gopls.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = custom_attach,
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
})
