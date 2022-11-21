local alpha = require('alpha')

local dbo = require('alpha.themes.dashboard')

dbo.section.buttons.val = {
  dbo.button('ee', 'Explorer', ':NvimTreeOpen <CR>'),
  dbo.button('n', 'New file', ':ene <BAR> startinsert <CR>'),
  dbo.button('ff', 'Find file', ':Telescope find_files <CR>'),
  dbo.button('fo', 'Recent', ':Telescope oldfiles <CR>'),
}

alpha.setup(dbo.config)
