local map = require('utils').map

local saga = require('lspsaga')

local saga_diagnostic = require('lspsaga.diagnostic')

saga.init_lsp_saga({
  code_action_icon = '',
  code_action_keys = { quit = '<Esc>', exec = '<CR>' },
  finder_request_timeout = 3000,
  rename_in_select = false,
})

local goto_opts = { severity = vim.diagnostic.severity.ERROR }

map('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
map('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>')
map('n', 'gpd', '<cmd>Lspsaga peek_definition<CR>')
map('n', 'ga', '<cmd>Lspsaga code_action<CR>')
map('n', 'rn', '<cmd>Lspsaga rename<CR>')
map('n', '[e', function() saga_diagnostic.goto_prev(goto_opts) end, 'Goto previous error')
map('n', ']e', function() saga_diagnostic.goto_next(goto_opts) end, 'Goto next error')
map('n', '[d', function() saga_diagnostic.goto_prev() end, 'Goto previous diagnostic')
map('n', ']d', function() saga_diagnostic.goto_next() end, 'Goto next diagnostic')
