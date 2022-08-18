local g = vim.g
local o = vim.o

-- termcolors
o.termguicolors = true

-- decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- editing
o.expandtab = true
o.wrap = false
o.textwidth = 300
o.tabstop = 4
o.shiftwidth = 0
o.softtabstop = -1
o.number = true
o.relativenumber = false
o.cursorline = true
o.smartindent = true
o.signcolumn = 'yes'
o.fileencoding = 'utf-8'

-- buffer splitting
o.splitright = true
o.splitbelow = true

-- case insensitive searching
o.ignorecase = true
o.smartcase = true

-- makes neovim and host OS clipboard play nicely with each other
o.clipboard = 'unnamedplus'

-- map <leader> to space
g.mapleader = ' '
g.maplocalleader = ' '
