local treesitter_status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not treesitter_status then return end

local treesitter_context_status, treesitter_context = pcall(require, 'treesitter-context')
if not treesitter_context_status then return end

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

vim.opt.foldenable = false
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
