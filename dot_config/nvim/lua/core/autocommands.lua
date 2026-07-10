-- Autocommands
vim.api.nvim_create_augroup("custom_buffer", { clear = true })
-- highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
	group = "custom_buffer",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
	end,
})

-- Disable smartindent for filetypes where treesitter indent is active.
-- smartindent is a generic C-style indenter that mishandles PHP arrays,
-- switch/case, and other language-specific constructs. When treesitter
-- indent is available it is strictly better, so smartindent just interferes.
-- For filetypes without a treesitter parser, smartindent stays on as fallback.
vim.api.nvim_create_autocmd("FileType", {
	group = "custom_buffer",
	callback = function(args)
		local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
		if ok and ts_configs.is_enabled("indent", vim.bo[args.buf].filetype) then
			vim.bo[args.buf].smartindent = false
		end
	end,
})

-- =====================================================================
-- CENTRALIZED GLOBAL SESSION MANAGEMENT (FOR TMUX-RESURRECT)
-- =====================================================================

-- 1. Setup paths and ensure directory exists
local session_dir = vim.fn.stdpath("data") .. "/sessions/"
if vim.fn.isdirectory(session_dir) == 0 then
	vim.fn.mkdir(session_dir, "p")
end

-- 2. Helper function to generate a unique filename from current path
local function get_session_path()
	local project_path = vim.fn.getcwd():gsub("/", "_")
	return session_dir .. project_path .. ".vim"
end

-- 3. Create an isolated augroup to keep autocommands organized
local session_group = vim.api.nvim_create_augroup("TmuxGlobalSessions", { clear = true })

-- SAVE: Automatically save/overwrite session on exit
vim.api.nvim_create_autocmd("VimLeave", {
	group = session_group,
	pattern = "*",
	callback = function()
		vim.cmd("mksession! " .. vim.fn.fnameescape(get_session_path()))
	end,
})

-- LOAD: Automatically restore if a global session exists for this folder
vim.api.nvim_create_autocmd("VimEnter", {
	group = session_group,
	pattern = "*",
	nested = true,
	callback = function()
		-- Only try to load if Neovim was started with no file arguments
		if vim.fn.argc() == 0 then
			local session_file = get_session_path()
			if vim.fn.filereadable(session_file) == 1 then
				vim.cmd("source " .. vim.fn.fnameescape(session_file))
			end
		end
	end,
})
