local map = require('utils').map

return {

  -- gitsigns
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      on_attach = function(buffer)
        local gitsigns = package.loaded.gitsigns

        map('n', ']c', function()
          if vim.wo.diff then
            return ']c'
          else
            gitsigns.next_hunk()
          end
        end, 'Next change')

        map('n', '[c', function()
          if vim.wo.diff then
            return '[c'
          else
            gitsigns.prev_hunk()
          end
        end, 'Previous change')

        map('n', '<leader>gir', function() gitsigns.reset_hunk() end, 'Reset hunk')
      end,
    },
  },

  -- references
  {
    'RRethy/vim-illuminate',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = { delay = 200 },
    config = function(_, opts)
      require('illuminate').configure(opts)
      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          pcall(vim.keymap.del, 'n', ']]', { buffer = buffer })
          pcall(vim.keymap.del, 'n', '[[', { buffer = buffer })
        end,
      })
    end,
    keys = {
      { ']]', function() require('illuminate').goto_next_reference(false) end, desc = 'Next Reference', },
      { '[[', function() require('illuminate').goto_prev_reference(false) end, desc = 'Prev Reference' },
    },
  },

  -- indent
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      show_current_context = true,
      show_current_context_start = true,
    }
  },

  -- surround
  {
    'kylechui/nvim-surround',
    event = { 'BufReadPost', 'BufNewFile' },
  },

  -- comnent
  {
    'numToStr/Comment.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
  },

  -- input method
  {
    'keaising/im-select.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      default_im_select = 'com.apple.keylayout.ABC',
      disable_auto_restore = 1
    }
  },

  -- colorizer
  {
    'norcalli/nvim-colorizer.lua',
    event = { 'BufReadPost', 'BufNewFile' },
  },

  -- copilot
  {
    'github/copilot.vim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      vim.g.copilot_no_tab_map = true
    end,
    keys = {
      { '<C-f>', 'copilot#Accept("<CR>")', { mode = 'i', expr = true }, desc = 'Accept suggestion' },
    }
  },

}
