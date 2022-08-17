local status, nvim_lsp = pcall(require, 'lspconfig')
if not status then return end

local fmt = function(cmd) return function(str) return cmd:format(str) end end
local lsp = fmt('<cmd>lua vim.lsp.buf.%s<cr>')
local diagnostic = fmt('<cmd>lua vim.diagnostic.%s<cr>')

local lsp_keymaps = function(bufnr)
  local buf_set_keymap = function(m, lhs, rhs)
    vim.api.nvim_buf_set_keymap(bufnr, m, lhs, rhs, { noremap = true, silent = true })
  end

  buf_set_keymap('n', 'K', lsp 'hover()')
  buf_set_keymap('n', 'gd', lsp 'definition()')
  buf_set_keymap('n', 'gD', lsp 'declaration()')
  buf_set_keymap('n', 'gi', lsp 'implementation()')
  buf_set_keymap('n', 'gr', lsp 'references()')

  buf_set_keymap('n', '<leader>rn', lsp 'rename()')
  buf_set_keymap('n', '<leader>la', lsp 'code_action()')
  buf_set_keymap('n', '<leader>f', lsp 'formatting()')

  buf_set_keymap('n', '[d', diagnostic 'goto_prev()')
  buf_set_keymap('n', ']d', diagnostic 'goto_next()')
end

local on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Lua
nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      format = {
        defaultConfig = {
          quote_style = 'single'
        }
      }
    },
  },
}

nvim_lsp.emmet_ls.setup({
  capabilities = capabilities
})

-- TS
nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities
})
