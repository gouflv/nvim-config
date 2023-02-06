local map = require('utils').map

local diffview = require('diffview')

diffview.setup({
  file_history_panel = {
    win_config = {
      height = 20,
    }
  },
  hooks = {

  },
})

map('n', '<leader>gif', ':DiffviewFileHistory %<CR>', 'File History')
map('n', '<leader>gio', ':DiffviewFileHistory <CR>', 'Git logs')
map('n', '<leader>gq', ':DiffviewClose<CR>', 'Diffview Close')
