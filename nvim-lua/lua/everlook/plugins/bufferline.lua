local has_bufferline, bufferline = pcall(require, 'bufferline')
if not has_bufferline then
    return
end

bufferline.setup({
    options = {
        numbers = "none",
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        separator_style = "thin",
        enforce_regular_tabs = true,
        always_show_bufferline = true,
    }
})
