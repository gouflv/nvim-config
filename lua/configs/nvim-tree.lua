local status, nvim_tree = pcall(require, 'nvim-tree')
if not status then return end

local map = require('utils').map
local tree_cb = require('nvim-tree.config').nvim_tree_callback

nvim_tree.setup({
  open_on_setup = false,
  filters = {
    custom = { 'node_modules', '^.git$' },
  },
  renderer = {
    icons = {
      show = {
        folder = false,
        file = false,
        -- git = false
      }
    }
  },
  view = {
    width = 30,
    -- hide_root_folder = true,
    mappings = {
      list = {
        { key = { 'l', '<CR>', 'o' }, cb = tree_cb 'edit' },
        { key = 'h', cb = tree_cb 'close_node' },
        { key = 's', action = 'split' },
        { key = 'v', action = 'vsplit' },
        { key = '?', action = 'toggle_help' },
      }
    }
  }
})

map('n', '<leader>ee', function() nvim_tree.toggle() end, 'Toggle Explorer')
map('n', '<leader>ef', function() nvim_tree.find_file(true) end, 'Find file in Explorer')
map('n', '<Esc>', '<C-w>l', 'Unfocus Explorer')
