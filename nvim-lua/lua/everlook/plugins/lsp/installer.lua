local has_lsp_installer, nvim_lsp_installer = pcall(require, 'nvim-lsp-installer')
if not has_lsp_installer then
    return
end

nvim_lsp_installer.setup({
    ensure_installed = {
        'rust_analyzer',
        'golps',
        'sumneko_lua',
    },
})
