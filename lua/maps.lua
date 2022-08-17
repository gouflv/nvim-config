local map = require('utils').map

vim.g.mapleader = ' '

map('i', 'jj', '<Esc>')
map('i', 'jk', '<Esc>')

-- Delete without putting into reg
map('n', 'x', '"_x')
map('v', 'x', '"_x')

-- Replace selection with text in reg
map('v', 'p', '"_dP')

-- Movement
map('n', 'H', '^')
map('n', 'L', 'g_')
map('v', 'H', '^')
map('v', 'L', 'g_')

-- Continuous visual shifting
map('v', '>', '>gv')
map('v', '<', '<gv')

-- Keep cursor position after yanking
map('v', 'y', 'myy`y')

-- Split window
map('n', '<leader>w', '<C-w>')
map('n', '<leader>h', '<C-w>h')
map('n', '<leader>j', '<C-w>j')
map('n', '<leader>k', '<C-w>k')
map('n', '<leader>l', '<C-w>l')

-- Buffer
map('n', ']b', ':bnext<CR>')
map('n', '[b', ':bprevious<CR>')
map('n', '<leader>c', ':Bdelete<CR>')

-- Run Command easier
map('n', ';', ':')
map('n', ':', ';')

-- Terminal
map('t', '<S-Esc>', '<C-\\><C-n>')
