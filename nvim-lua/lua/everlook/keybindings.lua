local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- navigate buffers
map('n', '<S-l>', ':bnext<CR>')
map('n', '<S-h>', ':bprevious<CR>')

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- quit neovim
map('n', '<C-Q>', ':q<CR>')
