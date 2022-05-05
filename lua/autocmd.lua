-- nvim-tree autoclose
vim.api.nvim_exec([[ autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif ]], false)