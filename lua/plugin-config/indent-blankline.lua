vim.opt.list = true
vim.opt.listchars:append("space: ")

require("indent_blankline").setup {
  buftype_exclude = { "terminal" },
  filetype_exclude = { 
    "dashboard", 
    "help",
    "dashboard",
    "packer",
    "NvimTree",
  },
  show_end_of_line = true,
  show_current_context = true,
  -- show_current_context_start = true,
}