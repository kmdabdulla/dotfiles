-- Window navigation
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Move to beginning and end of the line  
vim.keymap.set('n', '<c-a>', '_')
vim.keymap.set('n', '<c-e>', '$')

-- Stop highlighting searched word
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Paste it in different register so that you don't miss the originally copied
-- text
vim.keymap.set('v', '<leader>p', "\"_dP")

-- Map Esc to jk in insert mode
vim.keymap.set('i', 'jk', '<Esc>')
