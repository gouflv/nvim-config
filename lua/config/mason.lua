local mason = require('mason')

local mason_lspconfig = require('mason-lspconfig')

mason.setup({
  ui = {
    -- check_outdated_packages_on_open = false
  }
})

mason_lspconfig.setup({
  ensure_installed = {
    -- LSP
    'bashls',
    'cssls',
    'dockerls',
    'emmet_ls',
    'html',
    'jsonls',
    'sumneko_lua',
    'stylelint_lsp',
    'tailwindcss',
    'tsserver',
    'volar',
    'yamlls',
    -- Lint
    'eslint',
    -- Formatting
    -- 'prettier',
  },
  automatic_installation = true
})
