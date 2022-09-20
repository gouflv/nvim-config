local map = require('utils').map

local status, telescope = pcall(require, 'telescope')
if not status then return end

telescope.setup({
  defaults = {
    file_ignore_patterns = { ".git/", "node_modules" },
  }
})

map('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
map('n', '<leader>fo', '<cmd>Telescope oldfiles<CR>')
map('n', '<leader>fr', '<cmd>Telescope resume<CR>')
