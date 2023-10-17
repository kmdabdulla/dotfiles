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
  'stevearc/dressing.nvim',
  -- 'ziontee113/icon-picker.nvim',

  -- Color highlighter
  'NvChad/nvim-colorizer.lua',

  -- nvim tree
  'nvim-tree/nvim-tree.lua',

  -- Greeter screen
  {
    'goolord/alpha-nvim',
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opt = {require'core.plugin_config.alpha_dashboard'.config}
  },

  -- -- Edit file system in vim buffer
  -- {
  -- 'stevearc/oil.nvim',
  -- opts = {},
  -- -- Optional dependencies
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  -- },

  -- outlining symbols in a file
  'simrat39/symbols-outline.nvim',

  -- indent guides
  { "lukas-reineke/indent-blankline.nvim" },

  -- search and replace
  'nvim-pack/nvim-spectre',

  -- Syntax highlighting
  'nvim-treesitter/nvim-treesitter',
  'RRethy/vim-illuminate',

  -- Generate auto-pairs
  {
  'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },

  -- Multi line edit
  'mg979/vim-visual-multi',

  -- splitting/joining blocks of code
  {
    'Wansmer/treesj',
    keys = { '<space>m', '<space>j', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({--[[ your config ]]})
    end,
  },

  -- Run tests
  'vim-test/vim-test',

  -- Git 
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  {
      'kdheepak/lazygit.nvim',
      dependencies = {
          'nvim-lua/plenary.nvim',
        },
  },
  'f-person/git-blame.nvim',

  -- comment lines
  'tpope/vim-commentary',

  -- Debug plugins 
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  {
    'folke/trouble.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  -- completion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'saadparwaiz1/cmp_luasnip',

  -- Snippet generator
  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',

  -- LSP 
  'williamboman/mason.nvim',
  'neovim/nvim-lspconfig',
  'williamboman/mason-lspconfig.nvim',
  'glepnir/lspsaga.nvim',
  'rmagatti/goto-preview',

  -- Fuzzy finder
  {
	  'nvim-telescope/telescope.nvim',
	  tag = '0.1.0',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  -- Telescope file browser
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },

  -- Navigation 
  {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end
  },
  {
  'SmiteshP/nvim-navbuddy',
  dependencies = {
      'SmiteshP/nvim-navic',
      'MunifTanjim/nui.nvim'
    },
      opts = { lsp = { auto_attach = true } }
  },
  'ggandor/leap.nvim',
  'ggandor/flit.nvim',

  -- Launch terminal withing vim buffer
  {
  {'akinsho/toggleterm.nvim', version = "*", config = true}
  },

  -- Add/change/delete surrounding delimiter pairs
  {
    'kylechui/nvim-surround',
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require('nvim-surround').setup({
        })
    end
  },
}

local opts = {}

require("lazy").setup(plugins, opts)
