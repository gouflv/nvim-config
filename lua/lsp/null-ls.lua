local status, null_ls = pcall(require, 'null_ls')
if not status then return end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.diagnostics.eslint

null_ls.setup({
  sources = {
    diagnostics.eslint_d,
    diagnostics.cspell,
    formatting.prettier,
  }
})
