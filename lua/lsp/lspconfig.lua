local nvim_lsp = require('lspconfig')

local map = require('utils').map
local fmt = function(cmd) return function(str) return cmd:format(str) end end
local lsp = fmt('<cmd>lua vim.lsp.buf.%s<CR>')

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }

  -- buf_set_keymap('n', 'K', lsp 'hover()')
  -- buf_set_keymap('n', 'gD', lsp 'declaration()')
  -- buf_set_keymap('n', 'gi', lsp 'implementation()')
  -- buf_set_keymap('n', 'gr', lsp 'references()')
  -- buf_set_keymap('n', 'gs', lsp 'signature_help()')
  -- buf_set_keymap('n', '<leader>rn', lsp 'rename()')
  -- buf_set_keymap('n', '<leader>a', lsp 'code_action()')
  -- buf_set_keymap('n', '[d', diagnostic 'goto_prev()')
  -- buf_set_keymap('n', ']d', diagnostic 'goto_next()')

  map('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts, 'LSP definition')

  map('n', '<leader>f', lsp 'format()', opts, 'LSP format')

  if (client.name == 'tsserver') then
    map('n', '<leader>to', function()
      local typescript = require('typescript')
      typescript.actions.addMissingImports()
      typescript.actions.organizeImports()
    end, opts, 'Typescript organize imports')
  end
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Server setup helper
-- options: table
--  on_attach: function
--  settings: table
local lsp_setup = function(server_name, options)
  nvim_lsp[server_name].setup({
    on_attach = function(client, bufnr)
      if (options and options.on_attach) then
        options.on_attach(client, bufnr)
      else
        on_attach(client, bufnr)
      end
    end,
    capabilities = capabilities,
    settings = options and options.settings or nil
  })
end

local augroup_format = vim.api.nvim_create_augroup('Format', { clear = true })
local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end

lsp_setup('bashls')
lsp_setup('html')
lsp_setup('cssls')
lsp_setup('emmet_ls')
lsp_setup('tailwindcss')
lsp_setup('yamlls')

-- Lua
lsp_setup('sumneko_lua', {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    enable_format_on_save(client, bufnr)
  end,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'hs' },
      },
      format = {
        defaultConfig = {
          quote_style = 'single'
        }
      }
    },
  },
})

lsp_setup('jsonls', {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true }
    }
  }
})

-- Typescript
local ts_status, ts = pcall(require, 'typescript')
if ts_status then
  ts.setup({
    server = {
      on_attach = on_attach,
      capabilities = capabilities
    }
  })
end

-- Vuejs
lsp_setup('volar')
