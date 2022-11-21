local lualine = require('lualine')

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
      -- encoding
      -- fileformat
      { 'filetype', icons_enabled = false, }
    },
    lualine_y = {
      -- progress
    },
    -- lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_c = {
      { 'filename', file_status = true, path = 1 },
    },
  }
})
