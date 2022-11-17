local status_mason, mason = pcall(require, 'mason')
if not status_mason then return end

local status_mason_lspconfig, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status_mason_lspconfig then return end

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
