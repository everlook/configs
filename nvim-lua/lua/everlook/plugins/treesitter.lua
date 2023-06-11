local has_treesitter, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if not has_treesitter then
    return
end

treesitter_configs.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
        "c",
        "lua",
        "rust",
        "toml",
        'go',
        'javascript',
        'markdown',
        'html',
        'json',
        'bash',
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = { "javascript" },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
}

-- vvim.opt.foldmethod = "expr"
-- vim.opt.foldlevelstart = 1
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
