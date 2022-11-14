local map = require('utils').map

local status, gitsigns = pcall(require, 'gitsigns')
if not status then return end

gitsigns.setup()

map('n', ']c', function() gitsigns.next_hunk() end, 'Next hunk')
map('n', '[c', function() gitsigns.prev_hunk() end, 'Previous hunk')

map('n', '<leader>gir', function() gitsigns.reset_hunk() end, 'Reset hunk')
map('n', '<leader>gid', function() gitsigns.diffthis() end, 'Diff')
