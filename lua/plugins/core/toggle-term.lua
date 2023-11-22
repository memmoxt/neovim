return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		-- Open Terminal on the path that the current file is in
		-- Need to close the terminal to reset and open in the new path
		{ "<C-A-`>", "<cmd>cd %:h<cr><cmd>ToggleTerm<cr>", mode = "n", desc = "Toggle Terminal" }, -- Toggle Terminal on Normal mode
		{ "<C-A-`>", "<cmd>ToggleTerm<cr>", mode = "t" }, -- Toggle Terminal on Terminal mode
		{ "<esc>", [[<C-\><C-n>]], mode = "t" }, -- Escape Terminal input mode
	},
	opts = {
		size = 20,
		--		open_mapping = [[<C-`>]],
		hide_numbers = true,
		shade_filetypes = {},
		shade_terminals = true,
		shading_factor = 2,
		start_in_insert = true,
		insert_mappings = true,
		persist_size = true,
		-- Directions: float|tab|horizontal|vertical
		direction = "horizontal",
		close_on_exit = true,
		shell = vim.o.shell,
		float_opts = {
			border = "curved",
			winblend = 0,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
	},
}
