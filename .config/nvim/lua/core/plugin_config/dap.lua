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

dap.adapters.php = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
}

dap.configurations.php = {
	{
		type = "php",
		request = "launch",
		name = "Listen for Xdebug",
		port = 9003,
		-- Uncomment the following lines to enable Xdebug for docker
		-- pathMappings = {
		-- 	["/var/www/html"] = "${workspaceFolder}",
		-- },
	},
}
