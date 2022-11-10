local status, toggleterm = pcall(require, 'toggleterm')
if not status then return end

local map = require('utils').map

toggleterm.setup({
  direction = 'float',
  open_mapping = [[<c-\>]],
  on_open = function(term)
    local opt = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', opt)
  end
})

-- Lazygit
local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  cmd = 'lazygit',
  direction = 'float'
})

map('n', '<leader>gi', function() lazygit:toggle() end)
