return {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>zn", "<cmd>Neorg workspace notes<CR>", desc = "Neorg Notes", mode = "n" },
        {"<leader>zr","<cmd>Neorg return<CR>", desc = "Quit Neorg", mode = "n"},
	},
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.integrations.treesitter"] = {},
				["core.export"] = {
					config = {
						export_dir = { "<export-dir>/<language>-export" },
					},
				},
				["core.export.markdown"] = {
					config = {
						extension = "md",
					},
				},
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/notes",
						},
					},
				},
				["core.keybinds"] = {
					config = {
						default_keybinds = true,
					},
				},
			},
		})
	end,
}
