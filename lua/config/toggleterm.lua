local status, toggleterm = pcall(require, 'toggleterm')
if not status then return end

local map = require('utils').map

toggleterm.setup({
  direction = 'float',
  open_mapping = [[<c-\>]],
  on_open = function(term)
    map('n', 'q', '<cmd>close<CR>', { buffer = term.bufnr }, 'Close terminal')
  end
})

-- Lazygit
local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  cmd = 'lazygit',
  hidden = true,
})

map('n', '<leader>gi', function() lazygit:toggle() end, 'Lazygit')
