local status_mason, mason = pcall(require, 'mason')
if not status_mason then return end

local status_mason_lspconfig, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status_mason_lspconfig then return end

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    'bashls',
    'cssls',
    'dockerls',
    'emmet_ls',
    'html',
    'jsonls',
    'sumneko_lua',
    'tailwindcss',
    'tsserver',
    'volar',
    'yamlls',
  }
})
