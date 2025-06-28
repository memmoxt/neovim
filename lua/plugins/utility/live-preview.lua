return {
	"brianhuster/live-preview.nvim",
	dependencies = {
		-- You can choose one of the following pickers
		-- "nvim-telescope/telescope.nvim",
		"ibhagwan/fzf-lua",
		-- "echasnovski/mini.pick",
	},
	config = function()
		require("livepreview.config").set({
			port = 5500,
			browser = "default",
			dynamic_root = false,
			sync_scroll = true,
			picker = "fzf-lua",
		})
	end,
}
