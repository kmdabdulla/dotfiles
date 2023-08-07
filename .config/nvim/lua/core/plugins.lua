local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

  -- Colour, themes and icons 
  'ellisonleao/gruvbox.nvim',
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',

  -- Greeter screen
  {
    'goolord/alpha-nvim',
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opt = {require'core.plugin_config.alpha_dashboard'.config}
  },

  -- Syntax highlighting
  'nvim-treesitter/nvim-treesitter',

  -- Multi line edit
  'mg979/vim-visual-multi',

  -- Run tests
  'vim-test/vim-test',

  -- Git decorations
  'lewis6991/gitsigns.nvim',

  -- comment lines
  'tpope/vim-commentary',

  -- Debug plugins 
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',

  -- completion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'saadparwaiz1/cmp_luasnip',

  -- Snippet generator
  'L3MON4D3/LuaSnip',
  "rafamadriz/friendly-snippets",

  -- LSP 
  "williamboman/mason.nvim",
  "neovim/nvim-lspconfig",
  "williamboman/mason-lspconfig.nvim",
  "glepnir/lspsaga.nvim",

  -- Fuzzy finder
  {
	  'nvim-telescope/telescope.nvim',
	  tag = '0.1.0',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  }
}

local opts = {}

require("lazy").setup(plugins, opts)
