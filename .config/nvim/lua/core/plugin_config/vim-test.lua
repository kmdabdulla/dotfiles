vim.cmd [[
  let test#strategy = "vimux"
  let test#php#phpunit#executable = 'phpunit'
]]

vim.keymap.set('n', '<leader>t', ':TestNearest<CR>')
vim.keymap.set('n', '<leader>T', ':TestFile<CR>')
