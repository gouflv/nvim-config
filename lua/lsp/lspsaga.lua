local map = require('utils').map

local status, saga = pcall(require, 'lspsaga')
if not status then return end

saga.init_lsp_saga({
  code_action_icon = ''
})

map('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>')

map('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
map('n', '<leader>la', '<cmd>Lspsaga code_action<CR>')
map('v', '<leader>la', '<cmd>Lspsaga range_lsp_finder<CR>')
map('n', 'rn', '<cmd>Lspsaga rename<CR>')
map('n', '<leader>ld', '<cmd>Lspsaga preview_definition<CR>')

map('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
map('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>')

