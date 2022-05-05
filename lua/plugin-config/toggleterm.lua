require("toggleterm").setup {
  -- size can be a number or function which is passed the current terminal
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  start_in_insert = true,
  insert_mappings = true,
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'single',
    width = 300,
    height = 200,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}