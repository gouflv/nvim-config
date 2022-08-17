local status, nvim_lsp = pcall(require, 'lspconfig')
if not status then return end

local fmt = function(cmd) return function(str) return cmd:format(str) end end
local lsp = fmt('<cmd>lua vim.lsp.buf.%s<cr>')
local diagnostic = fmt('<cmd>lua vim.diagnostic.%s<cr>')

local on_attach = function(client, bufnr)
  -- Mapping
  local buf_set_keymap = function(m, lhs, rhs)
    vim.api.nvim_buf_set_keymap(bufnr, m, lhs, rhs, { noremap = true, silent = true })
  end

  buf_set_keymap('n', 'K', lsp 'hover()')

  buf_set_keymap('n', 'gd', lsp 'definition()')
  buf_set_keymap('n', 'gD', lsp 'declaration()')
  buf_set_keymap('n', 'gi', lsp 'implementation()')
  buf_set_keymap('n', 'gr', lsp 'references()')

  buf_set_keymap('n', '<lerader>rn', lsp 'rename()')
  buf_set_keymap('n', '<lerader>ca', lsp 'code_action()')
  buf_set_keymap('n', '<leader>f', lsp 'formatting()')

  -- formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
}
