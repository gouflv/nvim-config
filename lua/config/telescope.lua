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
        ['H'] = actions.results_scrolling_up,
        ['L'] = actions.results_scrolling_down,
        ['K'] = actions.preview_scrolling_up,
        ['J'] = actions.preview_scrolling_down,
      }
    },
    layout_strategy = 'flex',
    layout_config = {
      flex = {
        flip_columns = 140
      },
      vertical = { preview_height = 0.4 },
    }
  },
  pickers = {
    find_files = {
      hidden = true
    },
    live_grep = {
      additional_args = {
        '--hidden'
      }
    },
    lsp_definitions = {
      initial_mode = 'normal',
    },
    marks = {
      initial_mode = 'normal',
    },
    git_status = {
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
map('n', '<leader>fm', function() builtin.marks() end, 'Find marks')
map('n', '<leader>fr', function() builtin.resume() end, 'Resume telescope')
map('n', '<leader>fb', function()
  telescope.extensions.file_browser.file_browser({
    path = '%:p:h',
    hidden = true,
    initial_mode = 'normal',
    previewer = false
  })
end, 'Find files in browser')
map('n', '<leader>fc', function() builtin.git_status() end, 'Git status')
