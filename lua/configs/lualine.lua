local status, lualine = pcall(require, 'lualine')
if not status then return end

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
    lualine_c = {
      { 'filename', file_status = true, path = 1 },
    },
    lualine_x = {
      { 'filetype', icons_enabled = false, }
    },
    lualine_y = {}, -- hide progress
    -- lualine_z = {},    -- hide location
  }
})
