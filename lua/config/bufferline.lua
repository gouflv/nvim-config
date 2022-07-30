local getcwd = function(path)
    local reg = "([^/]+)$"
    return string.match(path, reg) or path
end

require('bufferline').setup({
    options = {
        offsets = {{
            filetype = 'NvimTree',
			text = function()
                return 'cwd> '..getcwd(vim.fn.getcwd())
			end,
            text_align = 'left',
        }},
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        indicator_icon = '',

        diagnostics = 'nvim_lsp',
    }
})
