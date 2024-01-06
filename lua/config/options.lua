-- :help option-list (command to list available options)

-- Set visible numbers in the lines on editor
vim.opt.number = true
vim.opt.relativenumber = false

-- Highlight the text line of the cursor
vim.opt.cursorline = false

--Tab & Indent
local tab_indent = 4
vim.opt.tabstop = tab_indent
vim.opt.softtabstop = tab_indent
vim.opt.shiftwidth = tab_indent
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.wrap = false -- disable wrapping the text in the corner of the screen
vim.opt.breakindent = true

-- Miscellaneous
vim.opt.spelllang = 'en_us'
vim.opt.spell = false
vim.opt.fillchars = { eob = ' ' }
vim.opt.showcmd = false
vim.opt.showmode = false


--Backup
vim.opt.backup = false
vim.opt.swapfile = false

--Search Highlighting
vim.opt.incsearch = true

-- Scroll
vim.opt.scrolloff = 2


-- Highlight option
vim.opt.termguicolors = true
vim.opt.cursorline = true

-- Pop-up menu max height, mainly for cmp
vim.opt.pumheight = 8
--
vim.opt.shell = "zsh"
