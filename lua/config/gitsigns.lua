local map = require('utils').map

local status, gitsigns = pcall(require, 'gitsigns')
if not status then return end

gitsigns.setup()

map('n', ']c', function()
  if vim.wo.diff then
    return ']c'
  else
    gitsigns.next_hunk()
  end
end, 'Next hunk')

map('n', '[c', function()
  if vim.wo.diff then
    return '[c'
  else
    gitsigns.prev_hunk()
  end
end, 'Previous hunk')

map('n', '<leader>gir', function() gitsigns.reset_hunk() end, 'Reset hunk')
map('n', '<leader>gid', function() gitsigns.diffthis() end, 'Diff')
