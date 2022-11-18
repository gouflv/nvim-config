local status, auto_save = pcall(require, 'auto-save')
if not status then return end

auto_save.setup({
  enabled = false
})
