local map = require('utils').map

local status, saga = pcall(require, 'lspsaga')
if not status then return end

local saga_diagnostic = require('lspsaga.diagnostic')

saga.init_lsp_saga({
  code_action_icon = '',
  finder_request_timeout = 3000,
  rename_in_select = false,
})

map('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
map('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>')
map('n', 'gpd', '<cmd>Lspsaga peek_definition<CR>')
map('n', 'ga', '<cmd>Lspsaga code_action<CR>')
map('n', 'rn', '<cmd>Lspsaga rename<CR>')

local goto_opts = { severity = vim.diagnostic.severity.ERROR }
map('n', '[d', function() saga_diagnostic.goto_prev(goto_opts) end, 'Goto previous diagnostic')
map('n', ']d', function() saga_diagnostic.goto_next(goto_opts) end, 'Goto next diagnostic')
