require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	ensure_installed = {
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
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<A-s>",
			node_incremental = "<A-i>",
			scope_incremental = "<A-S>",
			node_decremental = "<A-d>",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
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
			set_jumps = true, -- whether to set jumps in the jumplist
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
			swap_next = {
				["<leader>z"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>Z"] = "@parameter.inner",
			},
		},
	},
})
