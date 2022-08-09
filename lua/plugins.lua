-- Load packer.nvim
vim.cmd('packadd packer.nvim')

local function useEdit(use)
    use 'kylechui/nvim-surround'
    use 'windwp/nvim-autopairs'
    use 'numToStr/Comment.nvim'
    use 'Pocco81/AutoSave.nvim'
end

require('packer').startup({ function(use)
    use 'wbthomason/packer.nvim'

    -- Interfaces
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('config.nvim-tree') end,
    }
    use {
        'akinsho/bufferline.nvim',
        tag = 'v2.*',
        requires = {
            'kyazdani42/nvim-web-devicons',
            'moll/vim-bbye',
        },
        config = function() require('config.bufferline') end,
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('config.telescope') end,
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('config.lualine') end,
    }
    use {
        'akinsho/toggleterm.nvim',
        tag = 'v2.*',
        config = function() require('config.toggleterm') end,
    }
    -- TODO
    use {
        'gelguy/wilder.nvim',
    }

    -- Langrages
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = 'nvim-treesitter/nvim-treesitter-context',
        run = ':TSUpdate',
        config = function() require('config.treesitter') end
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
        },
        config = function() require('config.cmp') end
    }

    -- Themes
    use 'morhetz/gruvbox'
end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        },
        max_jobs = 8,
    }
})
