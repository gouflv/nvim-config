local map = require('utils').map

local telescope = require('telescope')

-- Plugins
telescope.load_extension('file_browser')
telescope.load_extension('termfinder')

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.setup({
  defaults = {
    file_ignore_patterns = {
      '.git/',
      'node_modules',
      '%.lock'
    },
    mappings = {
      n = {
        ['q'] = actions.close,
        ['K'] = actions.results_scrolling_up,
        ['J'] = actions.results_scrolling_down,
      }
    }
  },
  pickers = {
    find_files = {
      hidden = true
    },
    lsp_definitions = {
      initial_mode = 'normal',
    },
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
    depth = 2,
    hidden = true,
    initial_mode = 'normal',
    previewer = false
  })
end, 'Find files in browser')
