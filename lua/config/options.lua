-- :help option-list (command to list available options)

-- Set visible numbers in the lines on editor
vim.opt.number = true
vim.opt.relativenumber = false

-- Highlight the text line of the cursor
vim.opt.cursorline = true

--Tab & Indent
local tab_indent = 4
vim.opt.tabstop = tab_indent
vim.opt.softtabstop = tab_indent
vim.opt.shiftwidth = tab_indent
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.wrap = false -- disable wrappin the text in the corner of the screen
vim.opt.breakindent = true
vim.opt.fillchars = {eob = ' '}

--Backup
vim.opt.backup = false
vim.opt.swapfile = false

--Search Highlighting
vim.opt.incsearch = true

-- Scroll
vim.opt.scrolloff = 2

-- Highlight option
vim.opt.termguicolors = true

-- Popup menu max height, mainly for cmp
vim.opt.pumheight = 8
--
vim.opt.shell = "fish"
