local status, nvim_lsp = pcall(require, 'lspconfig')
if not status then return end

local fmt = function(cmd) return function(str) return cmd:format(str) end end
local lsp = fmt('<cmd>lua vim.lsp.buf.%s<cr>')
local diagnostic = fmt('<cmd>lua vim.diagnostic.%s<cr>')

local set_keymaps = function(bufnr)
  local buf_set_keymap = function(m, lhs, rhs)
    vim.api.nvim_buf_set_keymap(bufnr, m, lhs, rhs, { noremap = true, silent = true })
  end

  buf_set_keymap('n', 'K', lsp 'hover()')
  buf_set_keymap('n', 'gd', lsp 'definition()')
  buf_set_keymap('n', 'gD', lsp 'declaration()')
  buf_set_keymap('n', 'gi', lsp 'implementation()')
  buf_set_keymap('n', 'gr', lsp 'references()')
  -- buf_set_keymap('n', 'gs', lsp 'signature_help()')
  buf_set_keymap('n', '<leader>rn', lsp 'rename()')
  buf_set_keymap('n', '<leader>a', lsp 'code_action()')
  buf_set_keymap('n', '<leader>f', lsp 'formatting()')
  buf_set_keymap('n', '[d', diagnostic 'goto_prev()')
  buf_set_keymap('n', ']d', diagnostic 'goto_next()')
end

local set_client_formatting = function(client, enable)
  client.resolved_capabilities.document_formatting = enable
  client.resolved_capabilities.document_range_formatting = enable
end

local on_attach = function(client, bufnr)
  set_keymaps(bufnr)
end

local on_attach_disable_formatting = function(client, bufnr)
  set_client_formatting(client, false)
  set_keymaps(bufnr)
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Server setup helper
local lsp_setup = function(server_name, options)
  local formatting = true
  local settings = {}

  if options and options.disable_formatting then formatting = false end
  if options and options.settings then settings = options.settings end

  nvim_lsp[server_name].setup({
    on_attach = function(client, bufnr)
      set_client_formatting(client, formatting)
      set_keymaps(bufnr)
    end,
    capabilities = capabilities,
    settings = settings
  })
end

lsp_setup('bashls')
lsp_setup('html', { disable_formatting = true })
lsp_setup('cssls', { disable_formatting = true })
lsp_setup('emmet_ls', { disable_formatting = true })
lsp_setup('tailwindcss', { disable_formatting = true })
lsp_setup('yamlls', { disable_formatting = true })


-- Lua
lsp_setup('sumneko_lua', {
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
  disable_formatting = true,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true }
    }
  }
})

-- Typescript
local ts_status, ts = pcall(require, 'typescript')
if not ts_status then return end
ts.setup({
  server = {
    on_attach = on_attach_disable_formatting,
    capabilities = capabilities
  }
})

-- Vuejs
nvim_lsp.volar.setup({
  on_attach = on_attach_disable_formatting,
  capabilities = capabilities,
})
