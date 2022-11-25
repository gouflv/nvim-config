local map = require('utils').map

vim.g.mapleader = ' '

map('i', 'jk', '<Esc>')

-- Redo
map('n', 'U', '<C-R>')

-- Change text without putting into register
map('n', 'c', '"_c')
map('n', 'cc', '"_cc')

-- Replace selection with text in reg
map('v', 'p', '"_dP')

-- No hl
map('n', '<Esc>', ':nohl<CR>')

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

-- Add empty line
map('n', '<leader>o', 'o<Esc>')
map('n', '<leader>O', 'O<Esc>')

map('n', '<Tab>', '%', { remap = true })

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
map('n', '<leader>x', ':Bdelete<CR>')
map('n', '<leader>X', ':bufdo :Bdelete<CR>')

-- Run Command easier
map('n', ';', ':')
map('n', ':', ';')

-- Terminal
map('t', '<S-Esc>', [[<C-\><C-n>]])

-- Reload
map('n', '<leader>`', ':source $MYVIMRC<CR>')
