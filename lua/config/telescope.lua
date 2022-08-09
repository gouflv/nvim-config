local map = require('utils').map

require('telescope').setup({
  defaults = {
    file_ignore_patterns = { ".git/", "node_modules" },
  }
})

map('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
map('n', '<leader>fc', '<cmd>Telescope live_grep<CR>')
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>')

