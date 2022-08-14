require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'bash',
        'css',
        'dockerfile',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'jsonc',
        'lua',
        'scss',
        'tsx',
        'typescript',
        'vim',
        'vue',
        'yaml',
    },

    sync_install = true,

    highlight = {
        enable = true,
    },
})

require('treesitter-context').setup({})

vim.opt.foldenable = false
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
