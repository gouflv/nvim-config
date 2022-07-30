require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'css',
        'dockerfile',
        'html',
        'javascript',
        'json',
        'lua',
        'tsx',
        'typescript',
        'vue',
        'yaml',
    },

    sync_install = true,

    highlight = {
        enable = true,
    },
})

require('treesitter-context').setup({

})
