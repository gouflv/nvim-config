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
  open_on_setup = true,
  filters = {
    custom = { 'node_modules', '^.git$' },
  },
  renderer = {
    root_folder_modifier = ':t',
    highlight_opened_files = 'name',
    icons = {
      show = {
        folder = false,
        file = false,
        git = false
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

-- Auto close vim if tree is last window
--vim.cmd([[
--    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
--]])

map('n', '<leader>po', '<cmd>lua require("nvim-tree").toggle()<CR>')
map('n', '<leader>pO', '<cmd>lua require("nvim-tree").find_file()<CR>')
