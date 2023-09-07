return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			auto_reload_on_write = true,
			disable_netrw = false,
			hijack_cursor = false,
			hijack_netrw = true,
			hijack_unnamed_buffer_when_opening = false,
			view = {
				centralize_selection = false,
				cursorline = true,
				debounce_delay = 15,
				width = 40,
				hide_root_folder = false,
				side = "left",
				preserve_window_proportions = true,
				number = true,
				relativenumber = false,
				signcolumn = "yes",
			},
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
		})
		--set keymaps
		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Open NvimTree" })
	end,
}
