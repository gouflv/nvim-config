local status, toggleterm = pcall(require, 'toggleterm')
if not status then
  return
end

local map = require('utils').map

require('toggleterm').setup({
  open_mapping = [[<c-\>]],
})

local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  cmd = 'lazygit',
  direction = "float",
  hidden = true,
})

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

map('n', '<leader>g', '<cmd>lua _LAZYGIT_TOGGLE()<CR>')
