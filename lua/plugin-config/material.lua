-- Set the theme style
vim.g.material_style = 'palenight'

require('material').setup({
	contrast = {
		sidebars = false,
		floating_windows = true,
		line_numbers = false,
		sign_column = false,
		cursor_line = true,
		non_current_windows = false,
		popup_menu = false
	},

	italics = {
		comments = false, 
		keywords = true, 
		functions = false,
		strings = false, 
		variables = false 
	},

  -- Specify which filetypes get the contrasted (darker) background
	contrast_filetypes = {
		"terminal",
		"packer",
		"qf",
	},

  high_visibility = {
		lighter = false, -- Enable higher contrast text for lighter style
		darker = true -- Enable higher contrast text for darker style
	},

	disable = {
    borders = true, -- Disable borders between verticaly split windows
		background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines = true -- Hide the end-of-buffer lines
	}
})

-- Enable style toggling
-- vim.api.nvim_set_keymap('n', '<leader>ms', ':lua require("material.functions").toggle_style()<CR>', { noremap = true, silent = true })

-- Enable the colorscheme
vim.cmd 'colorscheme material'