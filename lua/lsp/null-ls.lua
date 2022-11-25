local null_ls = require('null-ls')
local enable_lsp_format_on_save = require('autocmds').enable_lsp_format_on_save

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local has_file_condition = function(files)
  return function(utils)
    return utils.root_has_file(files)
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
    formatting.eslint_d.with({
      condition = function(utils)
        return eslint_condition(utils) and not prettier_condition(utils)
      end
    }),
    code_actions.eslint_d.with({
      condition = eslint_condition
    }),

    -- CSpell
    diagnostics.cspell.with({
      diagnostics_postprocess = function(diagnostic)
        diagnostic.severity = vim.diagnostic.severity['INFO']
      end
    }),

    -- TS LSP
    require('typescript.extensions.null-ls.code-actions')
  },
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      enable_lsp_format_on_save(client, bufnr)
    end

    vim.diagnostic.config({
      virtual_text = {
        severity = { min = vim.diagnostic.severity.WARN }
      },
      signs = {
        severity = { min = vim.diagnostic.severity.WARN }
      }
    })
  end
})
