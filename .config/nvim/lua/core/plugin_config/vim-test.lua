vim.cmd [[
  let test#strategy = 'neovim'
  let test#php#phpunit#executable = 'phpunit'
]]

vim.keymap.set('n', '<leader>t', ':TestNearest<CR>')
vim.keymap.set('n', '<leader>T', ':TestFile<CR>')
