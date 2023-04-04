return {

  { 'kyazdani42/nvim-web-devicons', lazy = true },

  { 'moll/vim-bbye',                lazy = true, cmd = 'Bdelete' },

  -- file explorer
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    cmd = 'Neotree',
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == 'directory' then
          require('neo-tree')
        end
      end
    end,
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    opts = {
      window = {
        width = 30
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      }
    },
    keys = {
      {
        '<leader>fe',
        function()
          require('neo-tree.command').execute({
            toggle = true
          })
        end
      },
      {
        '<leader>fE',
        function()
          require('neo-tree.command').execute({
            toggle = true,
            dir = vim.loop.cwd()
          })
        end
      },
    }
  },

  -- bufferline
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        show_buffer_close_icons = false,
        show_close_icon = false,
        offsets = {
          {
            filetype = 'neo-tree',
            highlight = 'Directory',
          }
        }
      }
    }
  },

  -- lualine
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        section_separators = '',
        component_separators = ''
      },
      sections = {
        lualine_b = {
          { 'branch', icons_enabled = false, },
          'diff',
          'diagonstics',
        },
        lualine_c = {
          { 'filename', file_status = true, path = 1 },
        },
        lualine_x = {
          -- encoding
          -- fileformat
          { 'filetype', icons_enabled = false, }
        },
        lualine_y = {
          -- progress
        },
        -- lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_c = {
          { 'filename', file_status = true, path = 1 },
        },
      }
    }
  },

  -- dashboard
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    opts = function()
      local dashboard = require('alpha.themes.dashboard')
      dashboard.section.buttons.val = {
        dashboard.button('fe', 'Explorer', ':Neotree toggle <CR>'),
        dashboard.button('ff', 'Find file', ':Telescope find_files <CR>'),
        dashboard.button('fo', 'Recent', ':Telescope oldfiles <CR>'),
        dashboard.button('n', 'New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('q', 'Quit', ':qa<CR>'),
      }
      return dashboard
    end
    ,
    config = function(_, dashboard)
      require('alpha').setup(dashboard.opts)
    end
  },

  -- animate
  {
    'echasnovski/mini.animate',
    event = 'VeryLazy',
    opts = {
      scroll = {
        duration = 150,
      }
    },
    config = function(_, opts)
      require('mini.animate').setup(opts)
    end,
    enabled = false
  }
}
