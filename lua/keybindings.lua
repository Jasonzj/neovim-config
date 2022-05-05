vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = { noremap = true, silent = true }

local function map(modes, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  if string.len(modes) <= 0 then return vim.api.nvim_set_keymap(modes, lhs, rhs, options) end
  for mode in modes:gmatch('.') do
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end
end

------------------------------------------ Basic ------------------------------------------
map('i', 'jj', '<Esc>')
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

map('nv', '<C-j>', '5j')
map('nv', '<C-k>', '5k')
map('nv', '<C-d>', '30j')
map('nv', '<C-u>', '30k')

map('nv', 'H', '^')
map('n', 'L', '$')
map('v', 'L', '$h')
map('n', 'dH', 'd^<ESC>x')
map('n', 'cH', 'c^<ESC>lxi')
map('n', 'yH', 'v^y')
map('n', 'vL', 'v$h')
map('n', '<C-n>', ':nohl<CR>')
-- map('n', 'dL', 'd$') -- D
-- map('n', 'cL', 'c$') -- C
-- map('n', 'yL', 'y$') -- Y

map('v', '<', '<gv')
map('v', '>', '>gv')

map('n', '<A-h>', '<C-w>h')
map('n', '<A-j>', '<C-w>j')
map('n', '<A-k>', '<C-w>k')
map('n', '<A-l>', '<C-w>l')
map('n', 'sv', ':vsp<CR>')
map('n', 'sh', ':sp<CR>')
map('n', 's=', '<C-w>=')
map('n', '<right>', ':vertical resize +20<CR>')
map('n', '<left>', ':vertical resize -20<CR>')
map('n', '<up>', ':resize +10<CR>')
map('n', '<down>', ':resize -10<CR>')

------------------------------------------ Plugin ------------------------------------------
-- Sidebar
map('n', '<leader>b', ':NvimTreeToggle<CR>')

-- Bufferline - Tab
map('n', 'th', ':BufferLineCyclePrev<CR>')
map('n', 'tl', ':BufferLineCycleNext<CR>')
map('n', '<leader>tp', ':BufferLinePick<CR>')
map('n', '<leader>tw', ':BufferLinePickClose<CR>')
map('n', '<leader>q', ':bp<bar>sp<bar>bn<bar>bd<CR>')
map('n', '<leader>s', ':w<CR>')

-- Telescope Shortcuts
map('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<CR>")
map('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<CR>")
map('n', '<leader>fb', ":lua require('telescope.builtin').buffers()<CR>")
map('n', '<leader>fh', ":lua require('telescope.builtin').help_tags()<CR>")

-- Floating Terminal Shortcuts
vim.g.floaterm_keymap_toggle = '<C-\\>'

-- SymbolsOutline
map('', '<leader>O', ':SymbolsOutline<CR>')

-- SnipRun Shortcuts
map('v', '<leader>r', ':SnipRun<CR>', {silent = true})
map('n', '<leader>r', ':SnipRunOperator<CR>', {silent = true})
map('n', '<leader>rr', ':SnipRun<CR>', {silent = true})

-- Dashboard Shortcuts
-- map('', '<leader>ss', ':<C-u>SessionSave<CR>')
-- map('', '<leader>sl', ':<C-u>SessionLoad<CR>')
map('n', '<leader>tc', ':DashboardChangeColorscheme<CR>', { silent = true })
map('n', '<leader>cn', ':DashboardNewFile<CR>', { silent = true })

-- Hop Shortcuts
map('', '<leader><leader>w', ':HopWord<CR>', {})
map('', '<leader><leader>j', ':HopLine<CR>', {})
map('', '<leader><leader>k', ':HopLine<CR>', {})
map('', '<leader><leader>l', ':HopWordCurrentLineAC<CR>', {})
map('', '<leader><leader>h', ':HopWordCurrentLineBC<CR>', {})
map('n', 'f', ':HopChar1CurrentLineAC<CR>', {})
map('n', 'F', ':HopChar1CurrentLineBC<CR>', {})
map('o', 'f', ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
map('o', 'F', ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
-- map('', 't', ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
-- map('', 'T', ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})

-- Move Shortcuts
map('n', '<A-J>', ":MoveLine(1)<CR>")
map('n', '<A-K>', ":MoveLine(-1)<cr>")
map('v', '<A-J>', ":MoveBlock(1)<cr>")
map('v', '<A-K>', ":MoveBlock(-1)<cr>")
map('n', '<A-L>', ":MoveHChar(1)<CR>")
map('n', '<A-H>', ":MoveHChar(-1)<CR>")
map('v', '<A-L>', ":MoveHBlock(1)<CR>")
map('v', '<A-H>', ":MoveHBlock(-1)<CR>")

------------------------------------------ lSP ------------------------------------------
local pluginKeys = {}

-- nvim-cmp auto complete
pluginKeys.cmp = function(cmp)
  return {
    -- previous item
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- next item
    ["<C-j>"] = cmp.mapping.select_next_item(),
    -- toggler completion
    ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- cancel
    ['<A-,>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- select
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({
      select = true ,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  }
end

-- LSP related keybindings
pluginKeys.maplsp = function(mapbuf)
  -- rename
  mapbuf('n', '<leader>rn', "<cmd>lua require('lspsaga.rename').rename()<CR>", opt)
  -- code action
  mapbuf('n', '<leader>ah', ":lua require('lspsaga.codeaction').code_action()<CR>" , opt)
  mapbuf('v', '<leader>ah', ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>" , opt)
  -- go xx
  mapbuf('n', 'gh', ":lua require'lspsaga.provider'.lsp_finder()<CR>", opt)
  mapbuf('n', 'gd', ":lua require'lspsaga.provider'.preview_definition()<CR>", opt)
  mapbuf('n', 'K', ":lua require('lspsaga.hover').render_hover_doc()<CR>" , opt)
  -- diagnostic
  mapbuf("n", "go", ":Lspsaga show_line_diagnostics<cr>", opt)
  mapbuf("n", "gj", ":Lspsaga diagnostic_jump_next<cr>", opt)
  mapbuf("n", "gk", ":Lspsaga diagnostic_jump_prev<cr>", opt)
  -- leader + =
  mapbuf('n', '<leader>=', ':lua vim.lsp.buf.formatting()<CR>', opt)
end

return pluginKeys