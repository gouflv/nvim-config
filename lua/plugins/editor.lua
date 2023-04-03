local map = require('utils').map

return {

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
  -- {
  --   'norcalli/nvim-colorizer.lua',
  --   event = { 'BufReadPost', 'BufNewFile' },
  -- },

}
