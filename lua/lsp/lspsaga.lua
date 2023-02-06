local map = require('utils').map

local saga = require('lspsaga')

saga.setup({
  request_timeout = 3000,
  lightbulb = {
    enable = false,
  },
  code_action = {
    keys = { quit = '<Esc>', exec = '<CR>' }
  },
  rename = {
    in_select = false
  }
})

local goto_opts = { severity = vim.diagnostic.severity.ERROR }

map('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
map('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>')
map('n', 'gpd', '<cmd>Lspsaga peek_definition<CR>')
map('n', 'ga', '<cmd>Lspsaga code_action<CR>')
map('n', 'rn', '<cmd>Lspsaga rename<CR>')
map('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev', 'Goto previous error')
map('n', ']e', '<cmd>Lspsaga diagnostic_jump_next', 'Goto previous error')
map('n', '[d', function() require('lspsaga.diagnostic'):goto_prev(goto_opts) end, 'Goto previous diagnostic')
map('n', ']d', function() require('lspsaga.diagnostic'):goto_next(goto_opts) end, 'Goto next diagnostic')
