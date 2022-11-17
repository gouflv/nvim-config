local map = require('utils').map

local status, telescope = pcall(require, 'telescope')
if not status then return end

-- Plugins
telescope.load_extension('file_browser')
telescope.load_extension('termfinder')

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.setup({
  defaults = {
    file_ignore_patterns = { '.git', 'node_modules' },
    mappings = {
      n = {
        ['q'] = actions.close
      }
    }
  },
  extensions = {
    file_browser = {
      hidden = true
    }
  }
})

map('n', '<leader>ff', function() builtin.find_files() end, 'Find files')
map('n', '<leader>fg', function() builtin.live_grep() end, 'Find in files')
map('n', '<Bslash>', function() builtin.buffers() end, 'Find buffers')
map('n', '<leader>fo', function() builtin.oldfiles() end, 'Find old files')
map('n', '<leader>fr', function() builtin.resume() end, 'Resume telescope')

map('n', '<leader>fb', function()
  telescope.extensions.file_browser.file_browser({
    path = '%:p:h',
    cwd = '%:p:h',
    depth = 2,
    hidden = true,
    initial_mode = 'normal',
    previewer = false
  })
end, 'Find files in browser')
