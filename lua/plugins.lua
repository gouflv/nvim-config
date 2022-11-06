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
  use {
    'goolord/alpha-nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }
  use {
    'nvim-telescope/telescope-file-browser.nvim'
  }

  -- Langrages
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use {
    'nvim-treesitter/nvim-treesitter-context'
  }
  use {
    'williamboman/mason.nvim',
    requires = 'williamboman/mason-lspconfig.nvim'
  }
  use {
    'neovim/nvim-lspconfig'
  }
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
  use { 'glepnir/lspsaga.nvim', branch = 'main' }
  use { 'jose-elias-alvarez/typescript.nvim' }
  use { 'b0o/schemastore.nvim' }

  -- Editing
  use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'windwp/nvim-autopairs' }
  use { 'windwp/nvim-ts-autotag' }
  use { 'kylechui/nvim-surround' }
  use { 'phaazon/hop.nvim', branch = 'v2' }
  use { 'numToStr/Comment.nvim' }
  use { 'lewis6991/gitsigns.nvim' }
  use { 'norcalli/nvim-colorizer.lua' }

  use({
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
  })
  use { 'github/copilot.vim' }

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
