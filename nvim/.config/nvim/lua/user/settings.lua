--> General settings

-- Set leader
vim.g.mapleader = ","
-- Set number lines
vim.opt.relativenumber = true
vim.opt.number = true
-- Set mouse support
vim.opt.mouse = "a"
-- Disable strict case matching
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Disable search highlight
vim.opt.hlsearch = false
vim.opt.incsearch = true
-- Set tab spacing
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
-- Disable wrapping
vim.opt.wrap = false
-- Enable cursor line
vim.opt.cursorline = true
-- Lines under/over cursor
vim.opt.scrolloff = 8
-- Open splits below and right by default
vim.opt.splitbelow = true
vim.opt.splitright = true
-- only one status line for every files
vim.opt.laststatus = 3
-- disable backups
vim.opt.swapfile = false
vim.opt.backup = false
-- enable old undos
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
-- faster update time
vim.opt.updatetime = 50
