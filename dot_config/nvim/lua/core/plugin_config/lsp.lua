local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local default_setup = function(server)
	require("lspconfig")[server].setup({
		capabilities = capabilities,
	})
end

require("mason").setup({})
require("mason-lspconfig").setup({
	handlers = {
		default_setup,
		lua_ls = function()
			require("lspconfig").lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})
		end,
		intelephense = function()
			require("lspconfig").intelephense.setup({
				capabilities = capabilities,
				root_dir = require("lspconfig.util").root_pattern("composer.json", ".git", "*.php"),
				settings = {
					intelephense = {
						files = {
							maxSize = 1000000,
						},
					},
				},
			})
		end,
	},
})

require("mason-tool-installer").setup({

	-- a list of all tools you want to ensure are installed upon
	-- start
	ensure_installed = {
		"ts_ls",
		"lua_ls",
		"intelephense",
		"rust_analyzer",
		"gopls",
		"jsonls",
		"bashls",
		"marksman",
		"vimls",
		"stylua",
		"gofumpt",
		"prettierd",
		"phpcbf",
		"rustfmt",
		"mdformat",
		"shfmt",
		"jq",
		"php-debug-adapter",
	},

	-- if set to true this will check each tool for updates. If updates
	-- are available the tool will be updated. This setting does not
	-- affect :MasonToolsUpdate or :MasonToolsInstall.
	-- Default: false
	auto_update = false,

	-- automatically install / update on startup. If set to false nothing
	-- will happen on startup. You can use :MasonToolsInstall or
	-- :MasonToolsUpdate to install tools and check for updates.
	-- Default: true
	run_on_start = true,

	-- set a delay (in ms) before the installation starts. This is only
	-- effective if run_on_start is set to true.
	-- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
	-- Default: 0
	start_delay = 3000, -- 3 second delay

	-- Only attempt to install if 'debounce_hours' number of hours has
	-- elapsed since the last time Neovim was started. This stores a
	-- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
	-- This is only relevant when you are using 'run_on_start'. It has no
	-- effect when running manually via ':MasonToolsInstall' etc....
	-- Default: nil
	debounce_hours = 5, -- at least 5 hours between attempts to install/update

	-- Disable integration with other Mason plugins. This removes
	-- the ability to to use the alternative names of packages provided
	-- by these plugins but disables them from immediately becoming loaded
	integrations = {
		["mason-lspconfig"] = true,
		["mason-null-ls"] = true,
		["mason-nvim-dap"] = true,
	},
})

require("lspsaga").setup({
	code_action_icon = "💡",
	symbol_in_winbar = {
		in_custom = false,
		enable = true,
		separator = " ",
		show_file = true,
		file_formatter = "",
	},
})
