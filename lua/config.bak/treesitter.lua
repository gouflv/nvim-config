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

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<S-CR>',
    },
  },

  autotag = {
    enable = true
  }
})

treesitter_context.setup({})

vim.opt.foldlevelstart = 99
-- vim.opt.foldlevel = 3
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
