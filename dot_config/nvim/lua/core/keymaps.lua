local builtin = require("telescope.builtin")
local moveline = require("moveline")
local harpoon = require("harpoon")
local dap = require("dap")
local dapui = require("dapui")
harpoon:setup({})

-- Source nvim config
vim.keymap.set("n", "<leader>cs", ":source $MYVIMRC<CR>")

-- no ops
vim.keymap.set("n", "Q", "<nop>")

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Insert a blank line below or above current line (do not move the cursor)
vim.keymap.set("n", "oo", "printf('m`%so<ESC>``', v:count1)", {
	expr = true,
	desc = "insert line below",
})

vim.keymap.set("n", "OO", "printf('m`%sO<ESC>``', v:count1)", {
	expr = true,
	desc = "insert line above",
})

-- Window navigation
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Move to beginning and end of the line
vim.keymap.set({ "n", "x" }, "<c-a>", "_")
vim.keymap.set({ "n", "x" }, "<c-e>", "$")
vim.keymap.set({ "i", "c" }, "<c-a>", "<HOME>")
vim.keymap.set({ "i", "c" }, "<c-e>", "<END>")

-- Delete the character to the right of the cursor
vim.keymap.set("i", "<c-d>", "<DEL>")

-- Make Y behave like C or D
vim.keymap.set("n", "Y", "y$")

-- Keep window centered when going up/down
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "gg", "ggzz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "%", "%zz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")

-- Paste without yanking selection
vim.keymap.set("v", "p", '"_dP')

-- Copy text to system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank into system register" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank into system register" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank into system register" })

-- Paste text from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system register" })

-- Delete text to null register
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Do not yank text deleted" })
vim.keymap.set({ "n", "v" }, "<leader>D", '"_D', { desc = "Do not yank text deleted" })
vim.keymap.set({ "n", "v" }, "<leader>c", '"_c', { desc = "Do not yank text change" })
vim.keymap.set({ "n", "v" }, "<leader>C", '"_C', { desc = "Do not yank text change" })
vim.keymap.set("n", "x", '"_x', { desc = "Do not yank deleted character" })

-- Split window
vim.keymap.set("n", "sh", ":split<Return>")
vim.keymap.set("n", "sv", ":vsplit<Return>")

-- Map Esc to jk in insert mode
-- vim.keymap.set({ "i", "v" }, "jk", "<Esc>")

-- Select all
vim.keymap.set("n", "==", "gg<S-v>G")

-- Copy file paths
vim.keymap.set("n", "<leader>cf", '<cmd>let @+ = expand("%")<CR>', { desc = "Copy File Name" })
vim.keymap.set("n", "<leader>cp", '<cmd>let @+ = expand("%:p")<CR>', { desc = "Copy File Path" })

-- Terminal keymap
vim.keymap.set("n", "<Space><CR>", ":ToggleTerm<CR>")
vim.keymap.set("n", "<Space>lt", ":ToggleTermSendCurrentLine<CR>")
vim.keymap.set("v", "<Space>t", ":ToggleTermSendVisualSelection<CR>")

-- Ufo keymaps
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- vim-test keymaps
vim.keymap.set("n", "<leader>t", '<cmd>lua require("neotest").run.run()<CR>')
vim.keymap.set("n", "<leader>tf", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>')
vim.keymap.set("n", "<leader>dt", '<cmd>lua require("neotest").run.run({strategy = "dap"})<CR>')
vim.keymap.set("n", "<leader>ot", '<cmd>lua require("neotest").output.open({enter = true})<CR>')
vim.keymap.set("n", "<leader>ts", '<cmd>lua require("neotest").summary.toggle()<CR>')
vim.keymap.set("n", "<leader>pt", '<cmd>lua require("neotest").jump.prev({status = "failed"})<CR>')
vim.keymap.set("n", "<leader>nt", '<cmd>lua require("neotest").jump.next({status = "failed"})<CR>')

-- telescope keymaps
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>g", builtin.grep_string, {})
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
vim.keymap.set("n", "<A-k>", moveline.up)
vim.keymap.set("n", "<A-j>", moveline.down)
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

-- Replace word under cursor across the file
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Close floats, and clear highlights with <Esc>
vim.keymap.set("n", "<esc>", function()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		if vim.api.nvim_win_get_config(win).relative == "win" then
			vim.api.nvim_win_close(win, false)
		end
	end
end)

-- inc-rename using lsp
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

vim.keymap.set("n", "<space>l", function()
	toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })
vim.keymap.set("n", "<space>1", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<space>2", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<space>3", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<space>4", function()
	harpoon:list():select(4)
end)
vim.keymap.set("n", "<space>j", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<space>k", function()
	harpoon:list():next()
end)
vim.keymap.set("n", "<space>a", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<space>r", function()
	harpoon:list():remove()
end)
vim.keymap.set("n", "<space>c", function()
	harpoon:list():clear()
end)

-- Neogen keymaps
vim.keymap.set("n", "<leader>nf", function()
	require("neogen").generate({ type = "func" })
end)

vim.keymap.set("n", "<leader>nt", function()
	require("neogen").generate({ type = "type" })
end)

-- dap keymaps
vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<space>td", ":DapTerminate<CR>")
vim.keymap.set("n", "<space>gb", dap.run_to_cursor)
vim.keymap.set("n", "<space>?", function()
	dapui.eval(nil, { enter = true })
end)
vim.keymap.set("n", "<leader>ui", dapui.toggle)
vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", dap.step_back)
vim.keymap.set("n", "<F12>", dap.restart)

--LSPSaga Keymaps
vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>", { silent = true })
vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
vim.keymap.set("n", "hd", "<Cmd>Lspsaga hover_doc<cr>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("n", "<leader>sr", "<cmd>Lspsaga rename<CR>", { silent = true })
