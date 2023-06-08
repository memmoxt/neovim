-- Setting the leader key as "space-key"
vim.g.mapleader = " "

-- NORMAL MODE		     = 	"n"
-- INSERT MODE 		     = 	"i"
-- VISUAL MODE		     = 	"v"
-- VISUAL BLOCK MODE 	 = 	"x"
-- TERM MODE 		     = 	"t"
-- COMMAND MODE 	     = 	"c"

-- ########### NORMAL MODE ########### --

-- In "normal mode" if press [leaderkey] + [pv] will make the same action as [Ex]
-- vim.keymap.set("n", "<leader>ee", vim.cmd.Ex) -- Explorer -- Disabled by Nvim Tree
vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeToggle)

-- Pressing [leaderkey] + [vv] or [dd] will make a vertical os horizontal split
vim.keymap.set("n", "<leader>vv", vim.cmd.vsplit) -- Vertical Split
vim.keymap.set("n", "<leader>dd", vim.cmd.split) -- Horizontal Split

-- j and k Navigation with Centering
-- I usually navigate with arrow keys so , I'm assigning some diferent use case for k and j
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "k", "kzz")

-- Split Screen Navigation --
-- [Alt + Arrows] to move between Split Screens
vim.keymap.set("n", "<A-Up>", "<C-w>k") -- Up arrow
vim.keymap.set("n", "<A-Down>", "<C-w>j") -- Down arrow
vim.keymap.set("n", "<A-Right>", "<C-w>l") -- Right arrow
vim.keymap.set("n", "<A-Left>", "<C-w>h") -- Left arrow

-- Resize Window with arrows --
-- [Ctrl + n/e/i/o (same as my arrows keys)] to resize Split Screen Window
vim.keymap.set("n", "<C-A-e>", ":resize +2<CR>")
vim.keymap.set("n", "<C-A-i>", ":resize -2<CR>")
vim.keymap.set("n", "<C-A-n>", ":vertical resize +4<CR>")
vim.keymap.set("n", "<C-A-o>", ":vertical resize -4<CR>")

-- Page-Up and Page-Down --
-- making it a half-page jump
-- add centralization to the movement
vim.keymap.set("n", "<PageUp>", "<C-u>zz")
vim.keymap.set("n", "<PageDown>", "<C-d>zz")

-- Scrolling
vim.keymap.set("n", "<C-e>", "<C-e>") -- nothing is modified (it's just to remember)
vim.keymap.set("n", "<C-y>", "<C-y>")

-- Search Terms Centralization
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Copy to Clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Paste from Clipboard
vim.keymap.set("n", "<leader>p", '"+p')

-- Formatting with Null-ls
--vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>")

-- ########### VISUAL MODE ########### --
-- Copy to Clipboard
vim.keymap.set("v", "<leader>y", '"+y')

-- Move Up and Down with Auto-Indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- press [Shift + j] to move and Auto-indent Down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- press [Shift + k] to move and Auto-indent Up
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv") -- press [Alt + Down] to move and Auto-indent Down
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv") -- press [Alt + Up] to move and Auto-indent Up

-- ########### INSERT MODE ########### --

-- ########### COMMAND MODE ########### --
vim.keymap.set("c", "<Up>", "<C-p>") -- to move UP between the Tab-Completion suggestions
vim.keymap.set("c", "<Down>", "<C-n>") -- to move DOWN between the Tab-Completion suggestions
