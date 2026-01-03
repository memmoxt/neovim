return {
	"vyfor/cord.nvim",
	build = ":Cord update",
	opts = {
		buttons = {
			{
				label = "View repository", -- Text displayed on the button
				url = "https://github.com/memmoxt", -- URL where the button leads to ('git' = Git repository URL)
			},
			{
				label = "View MemmoXT's Neovim repo",
				url = "https://github.com/memmoxt/neovim",
			},
		},
	},
}
