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
	"sainnhe/gruvbox-material",
	"nvim-tree/nvim-web-devicons",
	{
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup()
		end,
	},

	-- transparent background
	"xiyaowong/transparent.nvim",

	-- Color highlighter
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	"itchyny/vim-highlighturl",

	-- move lines
	{
		"willothy/moveline.nvim",
		build = "make",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},

	-- marks
	"chentoast/marks.nvim",

	-- Status line
	"nvim-lualine/lualine.nvim",
	{
		"mawkler/modicator.nvim",
		dependencies = "sainnhe/gruvbox-material", -- Add your colorscheme plugin here
		opts = {
			show_warnings = true,
		},
	},

	-- Remove trailing whitespaces
	{
		"jdhao/whitespace.nvim",
		event = "VimEnter",
	},

	-- Greeter screen
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opt = { require("core.plugin_config.alpha_dashboard").config },
	},

	-- auto-save
	{
		"okuuva/auto-save.nvim",
		cmd = "ASToggle", -- optional for lazy loading on command
		event = { "InsertEnter", "TextChanged" },
		opts = {},
	},

	-- cd to project
	"LintaoAmons/cd-project.nvim",

	-- undotree
	{ "mbbill/undotree" },
	"debugloop/telescope-undo.nvim",

	-- indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufEnter",
		main = "ibl",
		opts = {},
	},

	-- guess indent
	{
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	},

	-- yank multiple texts
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},

	-- progress information
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = { "BufEnter" },
		config = function()
			require("fidget").setup({
				text = {
					spinner = "dots_negative",
				},
			})
		end,
	},

	-- UI for cmdline, messages and popupmenu
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "BufEnter",
		opts = {
			-- add any options here
			routes = {
				{
					filter = { event = "notify", find = "No information available" },
					opts = { skip = true },
				},
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	-- Syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["ap"] = "@parameter.outer",
						["ip"] = "@parameter.inner",
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@conditional.outer",
						["ic"] = "@conditional.inner",
						["al"] = "@loop.outer",
						["il"] = "@loop.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]m"] = "@function.inner",
						["]c"] = "@conditional.inner",
						["]l"] = "@loop.inner",
					},
					goto_next_end = {
						["]M"] = "@function.inner",
						["]C"] = "@conditional.inner",
						["]L"] = "@loop.inner",
					},
					goto_previous_start = {
						["[m"] = "@function.inner",
						["[c"] = "@conditional.inner",
						["[l"] = "@loop.inner",
					},
					goto_previous_end = {
						["[M"] = "@function.inner",
						["[C"] = "@conditional.inner",
						["[L"] = "@loop.inner",
					},
				},
				swap = {
					enable = true,
					swap_next = { ["<leader>z"] = "@parameter.inner" },
					swap_previous = { ["<leader>Z"] = "@parameter.inner" },
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("core.plugin_config.treesitter")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				max_lines = 5,
			})
		end,
	},
	{
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate")
		end,
	},

	-- goto weblink
	{
		"chrishrb/gx.nvim",
		keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
		cmd = { "Browse" },
		init = function()
			vim.g.netrw_nogx = 1 -- disable netrw gx
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true, -- default settings
		submodules = false, -- not needed, submodules are required only for tests
	},

	-- Generate auto-pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {},
	},

	-- Multi line edit
	"mg979/vim-visual-multi",

	-- splitting/joining blocks of code
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({
				use_default_keymaps = false,
				check_syntax_error = true,
			})
		end,
	},

	-- fold code blocks
	{
		"kevinhwang91/nvim-ufo",
		event = "BufEnter",
		config = function()
			require("ufo").setup({
				provider_selector = function(_bufnr, _filetype, _buftype)
					return { "treesitter", "indent" }
				end,
			})
		end,
		dependencies = {
			"kevinhwang91/promise-async",
		},
	},

	-- Run tests
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"olimorris/neotest-phpunit",
			"nvim-neotest/neotest-jest",
		},
	},

	-- Git
	"f-person/git-blame.nvim",

	-- comment lines
	"tpope/vim-commentary",

	-- Debug plugins
	"mfussenegger/nvim-dap",
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
	},
	"theHamsta/nvim-dap-virtual-text",

	-- completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lua",

	-- AI code assistant
	"supermaven-inc/supermaven-nvim",
	{
		"NickvanDyke/opencode.nvim",
		dependencies = {
			---@module 'snacks'
			{
				"folke/snacks.nvim",
				priority = 1000,
				lazy = false,
				opts = {
					image = { enabled = true },
					picker = { enabled = true },
					input = { enabled = true },
					terminal = { enabled = false },
					bigfile = { enabled = false },
					dashboard = { enabled = false },
					explorer = { enabled = false },
					notifier = { enabled = false },
					quickfile = { enabled = false },
					scope = { enabled = false },
					scroll = { enabled = false },
					statuscolumn = { enabled = false },
					toggle = { enabled = false },
					words = { enabled = false },
					lazygit = { enabled = false },
				},
			},
		},
	},

	-- Snippet generator
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
	},
	"rafamadriz/friendly-snippets",

	-- LSP
	"williamboman/mason.nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason-lspconfig.nvim",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	"glepnir/lspsaga.nvim",
	{ "rmagatti/goto-preview", dependencies = { "rmagatti/logger.nvim" } },
	"onsails/lspkind.nvim",

	-- formatter
	{
		"stevearc/conform.nvim",
		opts = {},
	},

	-- Annotation generator
	{
		"danymat/neogen",
		config = function()
			require("neogen").setup({ snippet_engine = "luasnip" })
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},

	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		branch = "master",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	-- Telescope file browser
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	-- oil file browser
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- search and replace
	{
		"nvim-pack/nvim-spectre",
		config = function()
			require("spectre").setup({ is_block_ui_break = true })
		end,
	},
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	},

	-- todo-comments
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},

	-- Refactor code
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup()
		end,
	},

	-- smooth scrolling
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({})
		end,
	},

	-- Navigation
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		modes = {
			search = {
				enabled = false, -- Set to false to disable Flash for regular searches
			},
		},
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"ts",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
		},
	},
	{ "chrisgrieser/nvim-spider", lazy = true },

	-- Launch terminal within vim buffer
	{
		{
			"akinsho/toggleterm.nvim",
			version = "*",
			config = function()
				require("toggleterm").setup({ autochdir = true })
			end,
		},
	},

	-- Add/change/delete surrounding delimiter pairs
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
}

local opts = {
	ui = {
		border = "rounded",
		title = "Plugin Manager",
		title_pos = "center",
	},
	rocks = {
		enabled = false,
	},
}

require("lazy").setup(plugins, opts)
