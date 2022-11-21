local autopairs = require('nvim-autopairs')

autopairs.setup({
  disable_filetype = {
    'TelescopePrompt',
    'vim'
  },
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp_status, cmp = pcall(require, 'cmp')
if not cmp_status then return end

cmp.event:on('comfirm_done', cmp_autopairs.on_confirm_done())
