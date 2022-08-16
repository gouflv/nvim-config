local status, bufferline = pcall(require, 'bufferline')
if not status then return end

local getcwd = function(path)
  local reg = "([^/]+)$"
  return string.match(path, reg) or path
end

bufferline.setup({
  options = {
    offsets = { {
      filetype = 'NvimTree',
      text = function()
        return getcwd(vim.fn.getcwd())
      end,
      text_align = 'left',
    } },
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = false,
    indicator_icon = '',
  }
})
