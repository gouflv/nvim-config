local status, null_ls = pcall(require, 'null-ls')
if not status then return end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local has_file_condition = function(file)
  return function(utils)
    return utils.root_has_file(file)
  end
end

local eslint_condition = has_file_condition({
  '.eslintrc',
  '.eslintrc.js',
  '.eslintrc.json',
})

local prettier_condition = has_file_condition({
  '.prettierrc',
  '.prettierrc.js',
  '.prettierrc.json',
})

null_ls.setup({
  debug = false,
  sources = {
    -- Prettier
    formatting.prettier.with({
      condition = prettier_condition
    }),

    -- ESLint
    diagnostics.eslint_d.with({
      filter = function(d) return d.code ~= 'prettier/prettier' end,
      condition = eslint_condition
    }),
    code_actions.eslint_d.with({
      condition = eslint_condition
    }),
    formatting.eslint_d.with({
      condition = function (utils)
        return eslint_condition(utils) and not prettier_condition(utils)
      end
    }),
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
