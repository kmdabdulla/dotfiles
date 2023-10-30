vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  view = {
    adaptive_size = true
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
})

vim.keymap.set('n', '<c-t>', ':NvimTreeFindFileToggle<CR>')
