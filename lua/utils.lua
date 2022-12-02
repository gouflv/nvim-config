local M = {}

function M.map(mode, lhs, rhs, opts, desc)
  local options = { noremap = true, silent = true }

  if type(opts) == 'string' then
    desc = opts
    opts = nil
  end

  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  if desc then
    options.desc = desc
  end

  vim.keymap.set(mode, lhs, rhs, options)
end

function M.merge(a, b)
  return vim.tbl_deep_extend('force', {}, a, b)
end

function M.clean_undo_files()
  vim.fn.system('fd -p ~/.local/state/nvim/undo --changed-before 7d -X rm -f')
end

return M
