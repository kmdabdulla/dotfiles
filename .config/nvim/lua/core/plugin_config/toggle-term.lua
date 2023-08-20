vim.keymap.set('n', '<Space><CR>', ':ToggleTerm<CR>')
vim.keymap.set('n', '<Space>lt', ':ToggleTermSendCurrentLine<CR>')
vim.keymap.set('v', '<Space>t', ':ToggleTermSendVisualSelection<CR>')

require("toggleterm").setup{
   autochdir = true,
}
