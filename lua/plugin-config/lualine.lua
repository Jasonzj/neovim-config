local gps = require("nvim-gps")
require('lualine').setup {
  sections = {
    lualine_c = {
      { gps.get_location, cond = gps.is_available },
    },
    lualine_x = {'encoding', 'filetype', 'progress'},
    lualine_y = {},
  },

  options = {
    theme = 'material-nvim'
  },

  extensions = { 'nvim-tree' , 'toggleterm', 'symbols-outline'}
}