local status, toggleterm = pcall(require, 'toggleterm')
if not status then return end

local map = require('utils').map

toggleterm.setup({
  open_mapping = [[<c-\>]],
})

-- Lazygit
local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  cmd = 'lazygit',
  direction = "float",
  on_open = function(term)
    vim.cmd('startinsert!')
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      'n',
      'q',
      '<Cmd>close<CR>',
      { noremap = true }
    )
  end
})

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

map('n', '<leader>gi', '<cmd>lua _LAZYGIT_TOGGLE()<CR>')
