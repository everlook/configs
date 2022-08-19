local has_gitsigns, gitsigns = pcall(require, 'gitsigns')
if not has_gitsigns then
    return
end

local map = vim.keymap.set

gitsigns.setup({
    on_attach = function(buf)
        -- Navigation
        map('n', ']c', "&diff ? ']c' : '<CMD>Gitsigns next_hunk<CR>'", { buffer = buf, expr = true })
        map('n', '[c', "&diff ? '[c' : '<CMD>Gitsigns prev_hunk<CR>'", { buffer = buf, expr = true })
    end,
})
