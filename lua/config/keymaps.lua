-- NORMAL MODE		     = 	"n"
-- INSERT MODE 		     = 	"i"
-- VISUAL MODE		     = 	"v"
-- VISUAL BLOCK MODE 	 = 	"x"
-- TERM MODE 		     = 	"t"
-- COMMAND MODE 	     = 	"c"

-- Save File
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Toggle Spelling 
vim.keymap.set("n", "<leader>cs","<cmd>set invspell<cr><esc>",{desc = "Toggle Spelling"} )

-- ########### NORMAL MODE ########### --

-- Quit All
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<cr>", { desc = " Quit all " })

-- vim.keymap.set("n", "<leader>ee", vim.cmd.Ex) -- Explorer -- Disabled by Nvim Tree

-- Pressing [leaderkey] + [-] or [|] will make a vertical or horizontal split
vim.keymap.set("n", "<leader>|", vim.cmd.vsplit, { desc = "Vertical Split" })  -- Vertical Split
vim.keymap.set("n", "<leader>-", vim.cmd.split, { desc = "Horizontal Split" }) -- Horizontal Split

-- Split Screen Navigation --
-- [Ctrl + Shift + Arrows] to move between Split Screens
vim.keymap.set("n", "<C-S-Up>", "<C-w>k")    -- Up arrow
vim.keymap.set("n", "<C-S-Down>", "<C-w>j")  -- Down arrow
vim.keymap.set("n", "<C-S-Right>", "<C-w>l") -- Right arrow
vim.keymap.set("n", "<C-S-Left>", "<C-w>h")  -- Left arrow

-- Resize window using <ctrl> arrow keys
-- vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
-- vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
-- vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
-- vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Resize Window with arrows --
-- [Ctrl + n/e/i/o (same as my arrows keys)] to resize Split Screen Window
vim.keymap.set("n", "<C-A-e>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-A-i>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-A-n>", "<cmd>vertical resize +4<CR>", { desc = "Increase window width" })
vim.keymap.set("n", "<C-A-o>", "<cmd>vertical resize -4<CR>", { desc = "Decrease window width" })

-- Page-Up and Page-Down --
-- making it a half-page jump
-- add centralization to the movement
vim.keymap.set("n", "<PageUp>", "<C-u>zz")
vim.keymap.set("n", "<PageDown>", "<C-d>zz")

-- Scrolling
vim.keymap.set("n", "<C-e>", "<C-e>") -- nothing is modified (it's just to remember)
vim.keymap.set("n", "<C-y>", "<C-y>") -- Search Terms Centralization
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Copy to Clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Paste from Clipboard
vim.keymap.set("n", "<leader>p", '"+p')

-- Formatting
--vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>")

-- Buffer Navigation
vim.keymap.set("n", "<S-A-N>", "<cmd>:bprevious<cr>", { desc = "Buffer Previous" })
vim.keymap.set("n", "<S-A-O>", "<cmd>:bnext<cr>", { desc = "Buffer Next" })
vim.keymap.set("n", "<S-A-BS>", "<cmd>:bd!<cr>", { desc = "Buffer Delete" })
vim.keymap.set("n", "<S-A-E>", "<cmd>:tabprevious<cr>", { desc = "Tab Previous" })
vim.keymap.set("n", "<S-A-I>", "<cmd>:tabnext<cr>", { desc = "Tab Next" })

-- Move Up and Down with Auto-Indent (NORMAL MODE)
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })

-- ########### VISUAL MODE ########### --
-- Copy to Clipboard
vim.keymap.set("v", "<leader>y", '"+y')

-- Move Up and Down with Auto-Indent (VISUAL MODE)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- press [Shift + j] to move and Auto-indent Down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- press [Shift + k] to move and Auto-indent Up

-- press [Alt + Down] to move and Auto-indent Down
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move down" })
-- press [Alt + Up] to move and Auto-indent Up
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move up" })

-- ########### INSERT MODE ########### --
-- Move Up and Down with Auto-Indent (INSERT MODE)
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })

-- ########### COMMAND MODE ########### --
vim.keymap.set("c", "<Up>", "<C-p>")   -- to move UP between the Tab-Completion suggestions
vim.keymap.set("c", "<Down>", "<C-n>") -- to move DOWN between the Tab-Completion suggestions
