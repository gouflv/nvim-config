local M = {}

local augroup = vim.api.nvim_create_augroup('Format', {})

M.enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end

local augroup_lsp_format = vim.api.nvim_create_augroup('LspFormat', {})

M.enable_lsp_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_lsp_format, buffer = bufnr })
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup_lsp_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({
        filter = function(client)
          return client.name == 'null-ls'
        end
      })
    end
  })
end

vim.api.nvim_create_user_command('DisableLspFormat',
  function()
    vim.api.nvim_clear_autocmds({ group = augroup_lsp_format, buffer = 0 })
  end,
  { nargs = 0 }
)

return M
