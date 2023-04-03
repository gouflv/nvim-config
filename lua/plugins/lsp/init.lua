return {

  -- lspconfig
  {
    'neovim/nvim-lspconfig',
    event = { 'VeryLazy' },
    dependencies = { 'mason.nvim' }
  },

  -- formatter and linter
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'mason.nvim' },
  },

  -- mason
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'jayp0521/mason-null-ls.nvim'
    },
    config = function(_, opts)
      require('mason').setup(opts)

      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup({
        ensure_installed = {
          'cssls',
          'emmet_ls',
          'html',
          'jsonls',
          'lua_ls',
          'tsserver',
          'volar',
        },
      })

      local mason_null_ls = require('mason-null-ls')
      mason_null_ls.setup({
        ensure_installed = {
          'eslint_d',
          'prettier',
          'cspell',
        },
      })
    end
  }

}
