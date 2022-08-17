require('base')
require('colorscheme')
require('maps')
require('plugins')

-- UIs
require('configs.nvim-tree')
require('configs.bufferline')
require('configs.lualine')
require('configs.toggleterm')
require('configs.telescope')

-- Languages
require('configs.treesitter')
require('configs.mason')
require('lsp.lspconfig')
require('lsp.cmp')

-- Editing
require('configs.autopairs')
require('configs.gitsigns')
