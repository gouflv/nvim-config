local cmp = require('cmp')

local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 2 },
  }),
  mapping = cmp.mapping.preset.insert({
    -- Select
    ['<CR>'] = cmp.mapping.confirm(),

    -- Navigate
    ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<Down>'] = cmp.mapping.select_next_item(),

    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),

    -- Doc
    ['K'] = cmp.mapping.scroll_docs(-5),
    ['J'] = cmp.mapping.scroll_docs(5),

    -- Toggle
    ['<C-e>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.close()
      else
        cmp.complete()
      end
    end),
    ['<Esc>'] = cmp.mapping.close(),
  }),
  formatting = {
    format = require('lspkind').cmp_format({
      mode = 'text',
      maxwidth = 50
    })
  },
  expremental = {
    ghost_text = true
  }
})
