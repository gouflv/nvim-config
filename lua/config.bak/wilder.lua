local wilder = require('wilder')

wilder.setup({
  modes = { ':', '/', '?' }
})

wilder.set_option('pipeline', {
  wilder.branch(
    wilder.cmdline_pipeline({
      fuzzy = 1
    }),
    wilder.search_pipeline()
  )
})
wilder.set_option('renderer', wilder.popupmenu_renderer({
  highlighter = wilder.basic_highlighter(),
  max_height = 10,
  min_width = 30,
  reverse = 1,
}))
