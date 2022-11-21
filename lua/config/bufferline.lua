local bufferline = require('bufferline')

local getcwd = function(path)
  local reg = '([^/]+)$'
  return string.match(path, reg) or path
end

bufferline.setup({
  options = {
    offsets = {
      {
        filetype = 'NvimTree',
        -- text = function()
        --   return getcwd(vim.fn.getcwd())
        -- end,
        -- text_align = 'left',
        text = '',
      }
    },
    -- show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false
  }
})
