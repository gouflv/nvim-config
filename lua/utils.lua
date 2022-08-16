local U = {}

function U.map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function U.merge(a, b)
  return vim.tbl_deep_extend('force', {}, a, b)
end

return U
