local has_null_ls, null_ls = pcall(require, 'null-ls')
if not has_null_ls then
    return
end

local formatting = null_ls.builtins.formatting
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        formatting.prettier,
        formatting.gofmt,
        formatting.shfmt,
        formatting.clang_format,
        formatting.cmake_format,
        formatting.rustfmt.with({
            extra_args = { "--edition=2021" }
        }),
        formatting.lua_format.with({
            extra_args = {
                '--no-keep-simple-function-one-line', '--no-break-after-operator', '--column-limit=100',
                '--break-after-table-lb', '--indent-width=2'
            }
        }),
        formatting.isort, formatting.codespell.with({ filetypes = { 'markdown' } })
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.format({ bufnr = bufnr })
                    -- vim.lsp.buf.formatting_sync()
                end,
            })
        end
    end,
})
