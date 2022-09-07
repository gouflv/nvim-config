local status, null_ls = pcall(require, 'null-ls')
if not status then return end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup({
  debug = false,
  sources = {
    -- ESLint
    diagnostics.eslint_d,
    code_actions.eslint_d,

    -- Prettier
    formatting.prettier,
  },
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function() vim.lsp.buf.formatting_sync() end
      })
    end
  end
})
