local treesitter = require('nvim-treesitter.configs')

local treesitter_context = require('treesitter-context')

treesitter.setup({
  ensure_installed = {
    'bash',
    'css',
    'dockerfile',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'jsonc',
    'lua',
    'scss',
    'tsx',
    'typescript',
    'vim',
    'vue',
    'yaml',
  },

  sync_install = true,

  highlight = {
    enable = true,
  },

  autotag = {
    enable = true
  }
})

treesitter_context.setup({})

vim.opt.foldlevelstart = 3
vim.opt.foldlevel = 3
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
