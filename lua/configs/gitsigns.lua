local map = require('utils').map

local status, gitsigns = pcall(require, 'gitsigns')
if not status then return end

gitsigns.setup()

map('n', ']c', "<cmd>lua require'gitsigns'.next_hunk()<cr>")
map('n', '[c', "<cmd>lua require'gitsigns'.prev_hunk()<cr>")
