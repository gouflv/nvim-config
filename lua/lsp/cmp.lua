local cmp_status, cmp = pcall(require, 'cmp')
if not cmp_status then return end

local snip_status, luasnip = pcall(require, 'luasnip')
if not snip_status then return end

local select_opts = { behavior = cmp.SelectBehavior.Select }

vim.opt.completeopt = 'menuone,noinsert,noselect'

cmp.setup({
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end
  },
  sources = {
    { name = 'copilot' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer', group_index = 2 },
  },
  mapping = {
    -- Select
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    -- Navigate
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

    -- Doc
    ['<C-b>'] = cmp.mapping.scroll_docs(-5),
    ['<C-f>'] = cmp.mapping.scroll_docs(5),

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
        cmp.select_next_item()
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
  },
  formatting = {
    format = require('lspkind').cmp_format({
      mode = 'text',
      maxwidth = 40
    })
  }
})
