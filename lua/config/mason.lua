local mason = require('mason')

local mason_lspconfig = require('mason-lspconfig')

local mason_null_ls = require('mason-null-ls')

mason.setup({
  ui = {
    -- check_outdated_packages_on_open = false
  }
})

mason_lspconfig.setup({
  ensure_installed = {
    'bashls',
    'cssls',
    'emmet_ls',
    'html',
    'jsonls',
    'sumneko_lua',
    'tailwindcss',
    'tsserver',
    'volar',
  },
  automatic_installation = true
})

mason_null_ls.setup({
  ensure_installed = {
    'eslint_d',
    'prettier',
    'cspell',
  },
})
