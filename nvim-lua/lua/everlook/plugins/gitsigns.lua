local map = vim.keymap.set

require('gitsigns').setup({
    on_attach = function(buf)
        -- Navigation
        map('n', ']c', "&diff ? ']c' : '<CMD>Gitsigns next_hunk<CR>'", { buffer = buf, expr = true })
        map('n', '[c', "&diff ? '[c' : '<CMD>Gitsigns prev_hunk<CR>'", { buffer = buf, expr = true })
    end,
})