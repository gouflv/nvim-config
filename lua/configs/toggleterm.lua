local status, toggleterm = pcall(require, 'toggleterm')
if not status then return end

local map = require('utils').map

toggleterm.setup({
  direction = 'float',
  open_mapping = [[<c-\>]],
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
  end
})

-- Lazygit
local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  cmd = 'lazygit',
  direction = 'float',
  hidden = true
})

map('n', '<leader>gi', function() lazygit:toggle() end)
