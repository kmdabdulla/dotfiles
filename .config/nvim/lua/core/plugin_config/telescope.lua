require('telescope').setup()
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
-- vim.keymap.set('n', '<Space>f', builtin.find_files, {})
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>g', builtin.grep_string, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})

-- shortcuts
-- ctrl x to open a file in horizontal split
-- ctrl v to open a file in vertical split
-- ctrl t to open a file in new tab
