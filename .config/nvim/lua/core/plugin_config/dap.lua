require("dapui").setup()
require("nvim-dap-virtual-text").setup({
	commented = true,
})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

require("mason-nvim-dap").setup({
	ensure_installed = { "php", "js" },
	handlers = {
		function(config)
			require("mason-nvim-dap").default_setup(config)
		end,
		php = function(config)
			config.adapters = {
				type = "executable",
				command = "node",
				args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" },
			}
			config.configurations = {
				type = "php",
				request = "launch",
				name = "Listen for XDebug",
				port = 9003,
				-- pathMappings = {
				-- 	["/var/www/html"] = "${workspaceFolder}",
				-- },
			}
			require("mason-nvim-dap").default_setup(config) -- don't forget this!
		end,
	},
})
