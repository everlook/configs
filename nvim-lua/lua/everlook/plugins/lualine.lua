require('lualine').setup({
    options = {
        theme = 'onedark',
        component_separators = '',
        section_separators = '',
        icons_enabled = true,
        globalstatus = true,
        disabled_filetypes = { "NvimTree", "Outline" },
    },
    sections = {
        lualine_a = {
            { 'mode', color = { gui = 'bold' } },
        },
        lualine_b = {
            { 'branch' },
            { 'diff', colored = true, symbols = { added = " ", modified = " ", removed = " " } },
        },
        lualine_c = {
            { 'filename', file_status = true },
            { 'diagnostics' },
        },
        lualine_x = {
            'filetype',
            'encoding',
            'fileformat',
        },
        lualine_y = { 'progress' },
        lualine_z = {
            { 'location', color = { gui = 'bold' } },
        },
    },
    tabline = {},
    extensions = { },
})