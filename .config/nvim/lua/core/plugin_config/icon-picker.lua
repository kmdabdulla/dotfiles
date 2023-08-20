local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Space>i", "<cmd>IconPickerNormal<cr>", opts)
vim.keymap.set("n", "<Space>yi", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
require("icon-picker").setup({
      disable_legacy_commands = true
})
