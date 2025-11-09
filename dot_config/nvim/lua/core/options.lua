-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- set encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

--set title
vim.opt.title = true

-- Allow backspacing over insertion start
vim.opt.backspace = "2"

-- Show commands
vim.opt.showcmd = true

-- Disable showing the mode below the statusline
vim.opt.showmode = false

-- Always display the status bar
vim.opt.laststatus = 2

-- Highlight the line the cursor is currently pointing
vim.opt.cursorline = true

-- Automatically re-read files if modified outside of vim
vim.opt.autoread = true

-- Tabs and spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Enable incremental searching
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.inccommand = "split"

-- Disable text wrap
vim.opt.wrap = false

-- Better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"

-- Enable mouse mode
vim.opt.mouse = "a"

-- Enable ignorecase + smartcase for better searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.infercase = true

-- make backspace behave in a sane manner
vim.opt.backspace = "indent,eol,start"

-- Decrease updatetime to 50ms
vim.opt.updatetime = 50

-- Set completeopt to have a better completion experience
vim.opt.completeopt = { "menuone", "noselect" }

-- Disable swap files
vim.opt.swapfile = false

-- Enable relative line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- Enable persistent undo history
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes"

-- Enable cursor line highlight
vim.opt.cursorline = true

-- Set fold settings
-- These options were reccommended by nvim-ufo
-- See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- show matching brackets
vim.opt.showmatch = true

-- Always keep 8 lines above/below cursor unless at start/end of file
vim.opt.scrolloff = 8

-- Place a column line
vim.opt.colorcolumn = "80"

vim.opt.isfname:append("@-@")
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.guicursor = {
	"n-v-c:block", -- Normal, visual, command-line: block cursor
	"i-ci-ve:block", -- Insert, command-line insert, visual-exclude: block cursor
	"r-cr:hor20", -- Replace, command-line replace: horizontal bar cursor with 20% height
	"o:hor50", -- Operator-pending: horizontal bar cursor with 50% height
	"a:blinkon0-", -- All modes: blinking settings
	"sm:block-blinkon0-", -- Showmatch: block cursor with specific blinking settings
}

-- Ignore deprecated warnings
vim.deprecate = function() end
