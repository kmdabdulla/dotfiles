-- Set leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Allow backspacing over insertion start
vim.opt.backspace = '2'

-- Show commands
vim.opt.showcmd = true

-- Always display the status bar
vim.opt.laststatus = 2

-- Highlight the line the cursor is currently pointing
vim.opt.cursorline = true

-- Automatically re-read files if modified outside of vim
vim.opt.autoread = true

-- Set to use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Set relative number
vim.wo.relativenumber = true

-- Tabs and spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Disable swap files
vim.cmd [[ set noswapfile ]]

-- Line numbers
vim.wo.number = true

-- Autoformat
vim.cmd [[autocmd InsertLeave * lua vim.lsp.buf.format()]]
