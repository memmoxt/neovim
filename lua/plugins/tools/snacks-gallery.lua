return {
	"TKasperczyk/snacks-gallery.nvim",
	dependencies = { "folke/snacks.nvim" },
	opts = {},
	keys = {
		{
			"<leader>i",
			function()
				require("snacks-gallery").open()
			end,
			desc = "Gallery",
		},
	},
}
