local mapping_list = {
    { key = 's', action = 'split' },
    { key = 'v', action = 'vsplit' },
    { key = '?', action = 'toggle_help' },
}

require('nvim-tree').setup({
	
    open_on_setup = true,

	filters = {
		custom = { 'node_modules', '^.git$' },
	},

    renderer = {
        highlight_opened_files = 'name',
        icons = {
            show = { folder = false, }
        }
    },

    view = {
        hide_root_folder = true,

        mappings = {
            list = mapping_list
        }
    }
})

-- Auto close vim if tree is last window
--vim.cmd([[
--    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
--]])
