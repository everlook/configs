local has_lspconfig, lsp = pcall(require, 'lspconfig')
if not has_lspconfig then
    return
end
local has_cmp_nvim, cmp_nvim = pcall(require, 'cmp_nvim_lsp')
if not has_cmp_nvim then
    return
end

require('everlook.plugins.lsp.installer')

local flags = {
    allow_incremental_sync = true,
    debounce_text_changes = 200,
}

local capabilities = cmp_nvim.default_capabilities(vim.lsp.protocol.make_client_capabilities())

local custom_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    -- client.server_capabilities.document_formatting = false
    -- client.server_capabilities.document_range_formatting = false
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, bufopts)
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", bufopts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

lsp.rust_analyzer.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = custom_attach,
})

local util = require "lspconfig/util"

lsp.gopls.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = custom_attach,
    cmd = { "gopls", "serve" },
    filetypes = { "go", "gomod" },
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

-- lsp.lua_ls.setup({
--     flags = flags,
--     capabilities = capabilities,
--     on_attach = custom_attach,
--     settings = {
--         Lua = {
--             runtime = {
--                 -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                 version = "LuaJIT",
--             },
--             diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = { "vim" },
--             },
--             workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 library = vim.api.nvim_get_runtime_file("", true),
--             },
--             -- Do not send telemetry data containing a randomized but unique identifier
--             telemetry = {
--                 enable = false,
--             },
--         },
--     },
-- })
