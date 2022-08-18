vim.keymap.set("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files()<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>lua require'telescope.builtin'.buffers()<cr>")
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>")
