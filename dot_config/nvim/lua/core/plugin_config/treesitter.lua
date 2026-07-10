local status, ts = pcall(require, "nvim-treesitter")
if not status then
	return
end

ts.setup({})

ts.install({
	"javascript",
	"typescript",
	"go",
	"lua",
	"bash",
	"regex",
	"rust",
	"vim",
	"php",
	"markdown",
	"markdown_inline",
	"json",
	"toml",
	"css",
	"hyprlang",
	"html",
	"latex",
	"scss",
	"svelte",
	"tsx",
	"typst",
	"vue",
})

-- 3. Configure built-in incremental selection natively
vim.keymap.set("n", "<A-s>", function()
	vim.treesitter.incremental_selection.init()
end, { desc = "Init selection" })
vim.keymap.set("x", "<A-i>", function()
	vim.treesitter.incremental_selection.node_incremental()
end, { desc = "Increment node" })
vim.keymap.set("x", "<A-S>", function()
	vim.treesitter.incremental_selection.scope_incremental()
end, { desc = "Increment scope" })
vim.keymap.set("x", "<A-d>", function()
	vim.treesitter.incremental_selection.node_decremental()
end, { desc = "Decrement node" })
