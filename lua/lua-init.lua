-- Init lua stuff

-- Load packer.nvim
vim.cmd('packadd packer.nvim')

local function useUIs(use)
    -- NvimTree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- Bufferline
    use {
        'akinsho/bufferline.nvim',
        tag = 'v2.*',
        requires = {
            'kyazdani42/nvim-web-devicons',
            'moll/vim-bbye',
        }
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Term
    use {
        'akinsho/toggleterm.nvim',
        tag = 'v2.*'
    }

    -- Wilder
    use 'gelguy/wilder.nvim'
end

local function useLS(use)
    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/nvim-treesitter-context'

    -- Lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/nvim-lsp-installer' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

end

local function useEdit(use)
    use 'kylechui/nvim-surround'
    use 'windwp/nvim-autopairs'
    use 'numToStr/Comment.nvim'
    use 'Pocco81/AutoSave.nvim'

end

require('packer').startup({ function(use)
    use 'wbthomason/packer.nvim'

    useUIs(use)
    useLS(use)
    useEdit(use)

    use 'morhetz/gruvbox'
end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        },
        max_jobs = 8,
    }
})

-- Configs
require('config.nvim-tree')
require('config.bufferline')
require('config.telescope')
require('config.lualine')
require('config.term')
require('config.wilder')

require('config.treesitter')
require('lsp.lsp-init')

require('config.surround')
require('config.autopairs')
require('config.autosave')

