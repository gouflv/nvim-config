-- Misc
vim.opt.clipboard:append({ 'unnamedplus' })

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})
