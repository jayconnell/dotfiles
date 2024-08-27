local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

opt.number = true
opt.relativenumber = true

opt.mouse = "a"

opt.showmode = false

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

opt.breakindent = true

opt.undofile = true

opt.ignorecase = true
opt.smartcase = true

opt.signcolumn = "yes"

-- Decrease update time
opt.updatetime = 250

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

opt.list = false
opt.listchars = { tab = "» ", trail = "⋅", nbsp = "␣", eol = "↴" }

-- Preview substitutions live, as you type!
opt.inccommand = "split"

-- Show which line your cursor is on
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 8

opt.fillchars:append({ eob = " " }) -- remove the ~ from end of buffer
