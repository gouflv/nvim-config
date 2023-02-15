local function actions()
  return require('telescope.actions')
end

local function builtin()
  return require('telescope.builtin')
end

return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    opts = {
      defaults = {
        file_ignore_patterns = {
          '.git/',
          'node_modules',
          '%.lock'
        },
        mappings = {
          n = {
            ['q'] = function(...) actions().close(...) end,
            ['K'] = function(...) actions().preview_scrolling_up(...) end,
            ['J'] = function(...) actions().preview_scrolling_down(...) end,
          },
          i = {
            ['<C-f>'] = function(...) actions().results_scrolling_up(...) end,
            ['<C-b>'] = function(...) actions().results_scrolling_down(...) end,
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
    },
    keys = {
      { '<leader>ff', function() builtin().find_files() end },
      { '<leader>fg', function() builtin().live_grep() end },
      { '<Bslash>',   function() builtin().buffers() end },
      { '<leader>fo', function() builtin().oldfiles() end },
      { '<leader>fm', function() builtin().marks() end },
      { '<leader>fc', function() builtin().git_status() end },
    }
  }
}
