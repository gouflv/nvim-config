local status, lualine = pcall(require, 'lualine')
if not lualine then
    return
end

lualine.setup({
    options = {
        section_separators = '',
        component_separators = ''
    },
    sections = {
        lualine_b = {
            { 'branch', icons_enabled = false, },
            'diff',
            'diagonstics',
        },
        lualine_x = {
            { 'filetype', icons_enabled = false, }
        },
        lualine_y = {},
        -- lualine_z = {},
    }
})
