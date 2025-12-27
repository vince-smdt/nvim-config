-- Indentation
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.breakindent = true
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.cursorlineopt = "number"

-- Scrolling
vim.o.scrolloff = 10

-- Whitespace
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Vim Mode
vim.o.showmode = true

-- Undo
vim.o.undofile = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Save & Exit
vim.o.confirm = true
