local has_nvim_tree, nvim_tree = pcall(require, 'nvim-tree')
if not has_nvim_tree then
    return
end

nvim_tree.setup({
    diagnostics = {
        enable = true,
    },
    update_focused_file = {
        enable = true,
    },
    view = {
        width = 35,
        side = 'left',
    },
    actions = {
        open_file = {
            quit_on_open = false,
            window_picker = {
                enable = false,
            },
        },
    },
})

vim.keymap.set('n', '<leader>e', '<CMD>NvimTreeToggle<CR>')
