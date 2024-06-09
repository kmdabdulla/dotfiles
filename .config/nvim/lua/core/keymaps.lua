local builtin = require("telescope.builtin")
local moveline = require("moveline")
local harpoon = require("harpoon")
harpoon:setup({})

-- Window navigation
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Move to beginning and end of the line
vim.keymap.set("n", "<c-a>", "_")
vim.keymap.set("n", "<c-e>", "$")

-- Paste it in different register so that you don't miss the originally copied
-- text
vim.keymap.set("v", "<leader>p", '"_dP')

-- Map Esc to jk in insert mode
vim.keymap.set({ "i", "v" }, "jk", "<Esc>")

-- Select all
vim.keymap.set("n", "==", "gg<S-v>G")

-- Terminal keymap
vim.keymap.set("n", "<Space><CR>", ":ToggleTerm<CR>")
vim.keymap.set("n", "<Space>lt", ":ToggleTermSendCurrentLine<CR>")
vim.keymap.set("v", "<Space>t", ":ToggleTermSendVisualSelection<CR>")

-- Ufo keymaps
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- vim-test keymaps
vim.keymap.set("n", "<leader>t", '<cmd>lua require("neotest").run.run()<CR>')
vim.keymap.set("n", "<leader>T", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>')
vim.keymap.set("n", "<leader>dt", '<cmd>lua require("neotest").run.run({strategy = "dap"})<CR>')

-- telescope keymaps
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<Space><Space>", builtin.oldfiles, {})
vim.keymap.set("n", "<Space>fg", builtin.live_grep, {})
vim.keymap.set("n", "<Space>g", builtin.grep_string, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help Tags" })
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find Symbols" })

-- Telescope file_browser keymap
vim.api.nvim_set_keymap(
	"n",
	"<space>e",
	":Telescope file_browser path=%:p:h select_buffer=true<CR>",
	{ noremap = true }
)

-- movelines keymaps
vim.keymap.set("n", "K", moveline.up)
vim.keymap.set("n", "J", moveline.down)
vim.keymap.set("v", "K", moveline.block_up)
vim.keymap.set("v", "J", moveline.block_down)

-- neoclip keymaps
vim.keymap.set("n", "<leader>o", "<cmd>Telescope neoclip<CR>", { desc = "Telescope Neoclip" })

-- spider keymaps
vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })

-- Spectre
vim.keymap.set("n", "sp", '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre",
})
vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})
vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})
vim.keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search on current file",
})

-- Close floats, and clear highlights with <Esc>
vim.keymap.set("n", "<esc>", function()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		if vim.api.nvim_win_get_config(win).relative == "win" then
			vim.api.nvim_win_close(win, false)
		end
	end
end)

-- inc-rename
vim.keymap.set("n", "<leader>rn", ":IncRename ")

-- oil keymap
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- undo tree keymaps
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<CR>", { desc = "Telescope Undo" })

-- Harpoon keymaps
local telescope_conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = telescope_conf.file_previewer({}),
			sorter = telescope_conf.generic_sorter({}),
		})
		:find()
end

vim.keymap.set("n", "hl", function()
	toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })
vim.keymap.set("n", "<leader>1", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>2", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>3", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>4", function()
	harpoon:list():select(4)
end)
vim.keymap.set("n", "hk", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "hj", function()
	harpoon:list():next()
end)
vim.keymap.set("n", "ha", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "hr", function()
	harpoon:list():remove()
end)
vim.keymap.set("n", "hc", function()
	harpoon:list():clear()
end)

-- Neogen keymaps
vim.keymap.set("n", "<leader>nf", function()
	require("neogen").generate({ type = "func" })
end)

vim.keymap.set("n", "<leader>nt", function()
	require("neogen").generate({ type = "type" })
end)
