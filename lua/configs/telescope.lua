local map = require('utils').map

local status, telescope = pcall(require, 'telescope')
if not status then return end

local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    file_ignore_patterns = { ".git/", "node_modules" },
    mappings = {
      n = {
        ['q'] = actions.close
      }
    }
  }
})

map('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
map('n', '<Bslash>', '<cmd>Telescope buffers<CR>')
map('n', '<leader>fo', '<cmd>Telescope oldfiles<CR>')
map('n', '<leader>fr', '<cmd>Telescope resume<CR>')
