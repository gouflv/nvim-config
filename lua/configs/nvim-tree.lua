local status, nvim_tree = pcall(require, 'nvim-tree')
if not status then return end

local map = require('utils').map
local tree_cb = require('nvim-tree.config').nvim_tree_callback

local mapping_list = {
  { key = { 'l', '<CR>', 'o' }, cb = tree_cb 'edit' },
  { key = 'h', cb = tree_cb 'close_node' },
  { key = 's', action = 'split' },
  { key = 'v', action = 'vsplit' },
  { key = '?', action = 'toggle_help' },
}

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
    hide_root_folder = true,
    mappings = {
      list = mapping_list
    }
  }
})

map('n', '<leader>ee', function() nvim_tree.toggle() end)
map('n', '<leader>ef', function() nvim_tree.toggle({ find_file = true }) end)
