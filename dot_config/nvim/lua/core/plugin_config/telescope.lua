local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--no-ignore-vcs")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

telescope.setup({
	defaults = {
		vimgrep_arguments = vimgrep_arguments,
		mappings = {
			i = {
				["<C-q>"] = require("telescope.actions").send_to_qflist,
				["<C-l>"] = require("telescope.actions").send_to_loclist,
			},
		},
	},
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "--no-ignore-vcs", "--glob", "!**/.git/*" },
		},
	},
	extensions = {
		undo = {
			use_delta = true,
			use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
			side_by_side = false,
			vim_diff_opts = {
				ctxlen = vim.o.scrolloff,
			},
			entry_format = "state #$ID, $STAT, $TIME",
			mappings = {
				i = {
					["<C-cr>"] = require("telescope-undo.actions").yank_additions,
					["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
					["<cr>"] = require("telescope-undo.actions").restore,
				},
			},
		},
		file_browser = {
			hidden = { file_browser = true, folder_browser = true },
			respect_gitignore = false,
			no_ignore = true,
		},
	},
})
require("telescope").load_extension("undo")
require("telescope").load_extension("neoclip")
require("telescope").load_extension("file_browser")
-- shortcuts
-- ctrl x to open a file in horizontal split
-- ctrl v to open a file in vertical split
-- ctrl t to open a file in new tab
