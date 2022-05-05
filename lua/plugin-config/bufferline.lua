require('bufferline').setup {
  options = {
    separator_style = "thin",
    -- can be a string | function, see "Mouse actions"
    -- close_command = "bdelete! %d",
    close_command = "bp | sp | bn | bd",
    left_mouse_command = "buffer %d",
    right_mouse_command = "bdelete! %d",

    -- use nvim internal lsp
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    
    -- Save space for sidebar nvim-tree
    offsets = {{
      filetype = "NvimTree",
      text = "File Explorer",
      highlight = "Directory",
      text_align = "center",
      padding = 1
    }}
  }
}