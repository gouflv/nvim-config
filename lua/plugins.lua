local status, packer = pcall(require, 'packer')
if (not status) then
  return
end

-- Load packer.nvim
vim.cmd('packadd packer.nvim')

packer.startup({ function(use)
  use 'wbthomason/packer.nvim'

  -- UIs
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use {
    'akinsho/bufferline.nvim',
    tag = 'v2.*',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'moll/vim-bbye',
    },
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use { 'akinsho/toggleterm.nvim', tag = 'v2.*' }
  use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'gelguy/wilder.nvim' }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }

  -- Langrages
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = 'nvim-treesitter/nvim-treesitter-context',
    run = ':TSUpdate',
  }
  use {
    'williamboman/mason.nvim',
    requires = 'williamboman/mason-lspconfig.nvim'
  }
  use { 'neovim/nvim-lspconfig' }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lua',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
    },
  }

  -- Typescript
  use { 'jose-elias-alvarez/typescript.nvim' }

  -- JSON
  use { 'b0o/schemastore.nvim' }

  -- Editing
  use { 'windwp/nvim-autopairs' }
  use { 'kylechui/nvim-surround' }
  use { 'phaazon/hop.nvim', branch = 'v2' }
  use { 'numToStr/Comment.nvim' }

  -- Other
  use { 'Pocco81/auto-save.nvim' }
  use { 'lewis6991/gitsigns.nvim' }

  -- Themes
  use 'morhetz/gruvbox'
end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    },
    max_jobs = 5,
  }
})
