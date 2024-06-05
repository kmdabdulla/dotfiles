require("supermaven-nvim").setup({
	keymaps = {
		accept_suggestion = "<Tab>",
		clear_suggestion = "<C-]>",
		accept_word = "<Tab>",
	},
	ignore_filetypes = {},
	color = {
		suggestion_color = "#808080",
		cterm = 244,
	},
	disable_inline_completion = true, -- disables inline completion for use with cmp
	disable_keymaps = true, -- disables built in keymaps for more manual control
})
