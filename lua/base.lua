vim.opt.fileencoding = 'utf-8'

-- Indenting
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Texting
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- UI
vim.opt.scrolloff = 10
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildmode = 'list:longest,full'

-- Misc
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.clipboard:append({ 'unnamedplus' })

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Yank current buffer file relative path into system clipboard
vim.api.nvim_create_user_command('CopyPath', function()
  local path = vim.fn.expand('%')
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard')
end, {})
