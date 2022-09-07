local map = require('utils').map

vim.g.mapleader = ' '

map('i', 'jj', '<Esc>')
map('i', 'jk', '<Esc>')

-- Redo 
map('n', 'U', '<C-R>')

-- Change text without putting into register
map('n', 'c', '"_c')

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
map('v', 'y', 'myy')

-- Add empty line
map('n', '<leader>o', 'o<Esc>')
map('n', '<leader>O', 'O<Esc>')

-- Save file
map('n', '<leader>s', ':w<CR>')

-- Split window
map('n', '<leader>w', '<C-w>')
map('n', '<leader>ww', '<C-w>c')
map('n', '<leader>h', '<C-w>h')
map('n', '<leader>j', '<C-w>j')
map('n', '<leader>k', '<C-w>k')
map('n', '<leader>l', '<C-w>l')

-- Buffer
map('n', '<C-n>', ':bnext<CR>')
map('n', '<C-p>', ':bprevious<CR>')
map('n', '<leader>c', ':Bdelete<CR>')

-- Run Command easier
map('n', ';', ':')
map('n', ':', ';')

-- Terminal
map('t', '<S-Esc>', '<C-\\><C-n>')
map('t', 'jk', '<C-\\><C-n>')

