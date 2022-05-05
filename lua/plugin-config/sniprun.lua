require'sniprun'.setup({
  -- repl_enable = { "python3" },               --# enable REPL-like behavior for the given interpreters

  --# you can combo different display modes as desired
  display = {
    "VirtualTextOk",              --# display ok results as virtual text (multiline is shortened)
    "NvimNotify",                 --# display with the nvim-notify plugin
    -- "VirtualTextErr",          --# display error results as virtual text
    -- "TempFloatingWindow",      --# display results in a floating window
    -- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText__
    -- "Terminal",                --# display results in a vertical split
    -- "TerminalWithCode",        --# display results and code history in a vertical split
    -- "NvimNotify",              --# display with the nvim-notify plugin
    -- "Api"                      --# return output to a programming interface
  },

  display_options = {
    terminal_width = 45,
    notification_timeout = 15   --# timeout for nvim_notify output
  },

  --# You can use the same keys to customize whether a sniprun producing
  --# no output should display nothing or '(no output)'
  show_no_output = {
    "Classic",
    "TempFloatingWindow",      --# implies LongTempFloatingWindow, which has no effect on its own
  },
})