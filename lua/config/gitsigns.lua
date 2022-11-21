local map = require('utils').map

local gitsigns = require('gitsigns')

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
