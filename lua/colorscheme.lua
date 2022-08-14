local status = pcall(vim.cmd, [[
  colorscheme gruvbox
]])

if not status then
  vim.cmd([[
    colorscheme defaut
  ]])
end