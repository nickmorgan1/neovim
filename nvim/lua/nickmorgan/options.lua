vim.g.mapleader = " "
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.guicursor = ""
vim.opt.cursorline = true

-- Number of spaces that a <Tab> character represents
vim.opt.tabstop = 4
-- Number of spaces to use for each step of automatic indentation
vim.opt.shiftwidth = 4
-- Number of spaces that a <Tab> counts for during editing operations
vim.opt.softtabstop = 4
-- Converts tabs into spaces when typing
vim.opt.expandtab = true
-- Automatically inserts an extra level of indentation in some cases
vim.opt.smartindent = false

-- Prevents showing extra messages when using completion
vim.opt.shortmess:append("c")

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.hlsearch = false

-- Ignores case when searching patterns
vim.opt.ignorecase = true
-- Automatically switches to case-sensitive search if a capital letter is used
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.showmatch = true

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }

vim.opt.wrap = false
