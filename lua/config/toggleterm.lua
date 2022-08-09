local map = require('utils').map

require('toggleterm').setup({
    open_mapping = [[<c-\>]],
})

local Terminal = require('toggleterm.terminal').Terminal
 
local lazygit = Terminal:new({
    cmd = 'lazygit', 
    direction = "float",
    hidden = true ,
})

function _lazygit_toggle()
  lazygit:toggle()
end

map('n', '<leader>g', '<cmd>lua _lazygit_toggle()<CR>')
