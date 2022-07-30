local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'cssls',
    'dockerls',
    'emmet_ls',
    'html',
    'jsonls',
    'sumneko_lua',
    'tailwindcss',
    'tsserver',
    'vimls',
    'volar',
    'yamlls',
})

lsp.on_attach(function(client, bufnr)
    local noremap = { buffer = bufnr, remap = false }
    local bind = vim.keymap.set

    -- Keymaps
    bind('n', '<leader>fm', '<cmd>lua vim.lsp.buf.formatting()<cr>', noremap)
    bind('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', noremap)
    bind('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', noremap)

    -- Configs
    vim.diagnostic.config({
        virtual_text = true,
    })
end)

lsp.setup()

