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
	-- to run php right from the editor
	{
		name = "run current script",
		type = "php",
		request = "launch",
		port = 9003,
		cwd = "${fileDirname}",
		program = "${file}",
		runtimeExecutable = "php",
	},
	-- to listen to any php call
	{
		name = "listen for Xdebug local",
		type = "php",
		request = "launch",
		port = 9003,
	},
	-- to listen to php call in docker container
	{
		type = "php",
		request = "launch",
		name = "Listen for Xdebug from container",
		port = 9003,
		pathMappings = {
			["/var/www/html"] = "${workspaceFolder}",
		},
	},
}
