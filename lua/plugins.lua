return require('packer').startup(function()
  ------------------------------------------ Packer ------------------------------------------
  use 'wbthomason/packer.nvim'

  ------------------------------------------ Theme ------------------------------------------
  -- use 'projekt0n/github-nvim-theme'
  use 'marko-cerovac/material.nvim'

  ------------------------------------------ LSP ------------------------------------------
  -- lsp server
  use { 'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
  -- nvim-cmp - completion
  use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
  use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
  use 'hrsh7th/cmp-path'     -- { name = 'path' }
  use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
  use 'hrsh7th/nvim-cmp'
  -- vsnip
  use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'
  -- lspkind - vscode-like pictograms for neovim lsp completion items
  use 'onsails/lspkind-nvim'
  -- lsp sage - A light-weight lsp plugin based on neovim built-in lsp with highly a performant UI.
  use 'tami5/lspsaga.nvim'
  -- github copilot
  use 'github/copilot.vim'

  ------------------------------------------ Plugin ------------------------------------------
  -- sidebar file explorer
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
  -- tab
  use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  -- highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- bottom line
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  -- luaLine display scope
  use { 'SmiteshP/nvim-gps', requires = 'nvim-treesitter/nvim-treesitter' }
  -- dashboard
  use 'glepnir/dashboard-nvim'
  -- telescope
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  -- colorizer
  use "norcalli/nvim-colorizer.lua"
  -- indent Colorful Lines
  use "lukas-reineke/indent-blankline.nvim"
  -- symbols Outline
  use "simrat39/symbols-outline.nvim"
  -- terminal
  use "voldikss/vim-floaterm"
  -- notify
  use 'rcarriga/nvim-notify'
  -- snippet Code Runner
  use { 'michaelb/sniprun', run = 'bash ./install.sh'}
  -- comment
  use "terrortylor/nvim-comment"
  -- autopairs
  use "windwp/nvim-autopairs"
  -- gitsigns
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    -- tag = 'release' -- To use the latest release
  }
  -- Which key -- keybindings prompt
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }
  -- lines or paragraphs move up and down
  use "fedepujol/move.nvim"
  -- surround
  use {
    "ur4ltz/surround.nvim",
    config = function()
      require"surround".setup {mappings_style = "surround"}
    end
  }
  -- hop - EasyMotion
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
end)