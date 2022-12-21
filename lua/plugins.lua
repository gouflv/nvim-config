local status, packer = pcall(require, 'packer')
if not status then
  return
end

packer.startup({ function(use)
  use {
    'lewis6991/impatient.nvim',
    config = [[require('impatient').enable_profile()]]
  }

  use { 'wbthomason/packer.nvim' }

  -- UIs
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = [[require('config.nvim-tree')]],
  }
  use {
    'akinsho/bufferline.nvim',
    tag = 'v2.*',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'moll/vim-bbye',
    },
    config = [[require('config.bufferline')]]
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = [[require('config.lualine')]],
    event = 'VimEnter',
  }
  use {
    'akinsho/toggleterm.nvim',
    tag = 'v2.*',
    config = [[require('config.toggleterm')]],
  }
  use {
    'goolord/alpha-nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = [[require('config.alpha')]],
  }
  use {
    'gelguy/wilder.nvim',
    config = [[require('config.wilder')]],
    event = 'VimEnter',
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      'tknightz/telescope-termfinder.nvim'
    },
    config = [[require('config.telescope')]],
  }

  -- Langrages
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-context'
    },
    config = [[require('config.treesitter')]],
    run = ':TSUpdate',
  }
  use {
    'williamboman/mason.nvim',
    requires = {
      'williamboman/mason-lspconfig.nvim',
      'jayp0521/mason-null-ls.nvim'
    },
    config = [[require('config.mason')]],
  }
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'jose-elias-alvarez/typescript.nvim',
      'b0o/schemastore.nvim'
    },
    config = [[require('lsp.lspconfig')]],
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = [[require('lsp.null-ls')]],
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
    },
    config = [[require('lsp.cmp')]],
  }
  use {
    'glepnir/lspsaga.nvim',
    branch = 'main',
    config = [[require('lsp.lspsaga')]]
  }

  -- Editing
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VimEnter',
    config = [[require('config.indent-blankline')]]
  }
  use {
    'windwp/nvim-autopairs',
    event = 'VimEnter',
    config = [[require('config.autopairs')]]
  }
  use {
    'windwp/nvim-ts-autotag',
    event = 'VimEnter',
    config = [[require('config.ts-autotag')]]
  }
  use {
    'kylechui/nvim-surround',
    event = 'VimEnter',
    config = [[require('config.surround')]]
  }
  use {
    'numToStr/Comment.nvim',
    event = 'VimEnter',
    config = [[require('config.comment')]]
  }
  use {
    'keaising/im-select.nvim',
    event = 'VimEnter',
    config = [[require('config.im-select')]]
  }
  use {
    'norcalli/nvim-colorizer.lua',
    event = 'VimEnter',
    config = [[require('config.colorizer')]]
  }
  use {
    'tpope/vim-repeat',
    event = 'VimEnter'
  }

  -- Mise
  use {
    'lewis6991/gitsigns.nvim',
    config = [[require('config.gitsigns')]],
    event = 'VimEnter',
  }
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = [[require('config.diffview')]],
    event = 'VimEnter',
  }
  use {
    'github/copilot.vim',
    config = [[require('config.copilot')]],
    event = 'VimEnter',
  }

  -- Themes
  use 'morhetz/gruvbox'
  use { 'rose-pine/neovim', as = 'rose-pine' }
end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    },
    max_jobs = 10,
  }
})

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
