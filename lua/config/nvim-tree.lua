local nvim_tree = require('nvim-tree')

local tree_cb = require('nvim-tree.config').nvim_tree_callback

local map = require('utils').map

nvim_tree.setup({
  filters = {
    custom = { 'node_modules', '^.git$' },
  },

  renderer = {
    icons = {
      show = {
        folder = false,
        file = false,
      }
    }
  },

  view = {
    width = 30,
    -- hide_root_folder = true,
    mappings = {
      list = {
        { key = { '<CR>', 'o' }, cb = tree_cb 'edit' },
        { key = 's', action = 'split' },
        { key = 'v', action = 'vsplit' },
        { key = '?', action = 'toggle_help' },
      }
    }
  }
})

map('n', '<leader>ee', ':NvimTreeToggle<CR>', 'Toggle Explorer')
map('n', '<leader>ef', ':NvimTreeFindFile<CR>', 'Find file in Explorer')
map('n', '<Esc>', '<C-w>l', 'Unfocus Explorer')
