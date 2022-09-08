local status, alpha = pcall(require, 'alpha')
if not status then return end

local dashboard = require('alpha.themes.dashboard')


dashboard.section.buttons.val = {
  dashboard.button('e', 'Explorer', ':NvimTreeOpen <CR>'),
  dashboard.button('n', 'New file', ':ene <BAR> startinsert <CR>'),
  dashboard.button('f', 'Find file', ':Telescope find_files <CR>'),
  dashboard.button('r', 'Recent', ':Telescope oldfiles <CR>'),
}

alpha.setup(dashboard.config)
