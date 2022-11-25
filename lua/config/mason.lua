local mason = require('mason')

local mason_lspconfig = require('mason-lspconfig')

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
    'eslint',
    -- Manual install for now
    -- 'prettier',
    -- 'cspell',
    -- 'eslint_d',
  },
  automatic_installation = true
})
