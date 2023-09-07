return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>x", desc = "+Trouble" },
		{
			"<leader>xx",
			function()
				require("trouble").open()
			end,
			mode = "n",
			desc = "Trouble Open",
		},

		{
			"<leader>xw",
			function()
				require("trouble").open("workspace_diagnostics")
			end,
			mode = "n",
			desc = "TroubleToggle Workspace Diagnostics",
		},

		{
			"<leader>xd",
			function()
				require("trouble").open("document_diagnostics")
			end,
			mode = "n",
			desc = "TroubleToggle Documents Diagnostics",
		},

		{
			"<leader>xq",
			function()
				require("trouble").open("quickfix")
			end,
			mode = "n",
			desc = "TroubleToggle Quickfix",
		},

		{
			"<leader>xl",
			function()
				require("trouble").open("loclist")
			end,
			mode = "n",
			desc = "TroubleToggle Loclist",
		},

		{
			"gR",
			function()
				require("trouble").open("lsp_references")
			end,
			mode = "n",
			desc = "Trouble LSP references",
		},
	},
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		local trouble = require("trouble.providers.telescope")

		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<c-t>"] = function(...)
							return require("trouble.providers.telescope").open_with_trouble(...)
						end,
						["<a-t>"] = function(...)
							return require("trouble.providers.telescope").open_selected_with_trouble(...)
						end,
					},
					n = { ["<c-t>"] = trouble.open_with_trouble },
				},
			},
		})
	end,
}
