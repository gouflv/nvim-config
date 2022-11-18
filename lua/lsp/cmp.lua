local cmp_status, cmp = pcall(require, 'cmp')
if not cmp_status then return end

local snip_status, luasnip = pcall(require, 'luasnip')
if not snip_status then return end

vim.opt.completeopt = 'menuone,noinsert,noselect'

cmp.setup({
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  }),
  mapping = cmp.mapping.preset.insert({
    -- Select
    ['<CR>'] = cmp.mapping.confirm({
      select = false,
      behavior = cmp.ConfirmBehavior.Insert
    }),

    -- Navigate
    ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<Down>'] = cmp.mapping.select_next_item(),

    -- Doc
    ['K'] = cmp.mapping.scroll_docs(-5),
    ['J'] = cmp.mapping.scroll_docs(5),

    -- Toggle
    ['<C-e>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.close()
        fallback()
      else
        cmp.complete()
      end
    end),

    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item()
        else
          cmp.confirm()
        end
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
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
