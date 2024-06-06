require("mason-nvim-dap").setup({
	ensure_installed = { "php", "js" },
	handlers = {
		function(config)
			require("mason-nvim-dap").default_setup(config)
		end,
		php = function(config)
			config.configurations = {
				type = "php",
				request = "launch",
				name = "Listen for XDebug",
				port = 9005,
				pathMappings = {
					["/var/www/html"] = "${workspaceFolder}",
				},
			}
			require("mason-nvim-dap").default_setup(config) -- don't forget this!
		end,
	},
})
