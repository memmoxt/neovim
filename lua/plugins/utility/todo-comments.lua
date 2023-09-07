return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"]t",
			function()
				require("todo-comments").jump_next()
			end,
			mode = "n",
			desc = "Next TODO comment",
		},
		{
			"[t",
			function()
				require("todo-comments").jump_prev()
			end,
			mode = "n",
			desc = "Previous TODO comment",
		},
		{
			"]T",
			function()
				require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } })
			end,
			mode = "n",
			desc = "Next error/warning todo comment",
		},
	},
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below

		-- TODO:
		-- FIX:
		-- HACK:
		-- PERF:
		-- NOTE:
		-- WARN:
		-- TEST:
		keywords = {
			FIX = {
				icon = " ", -- icon used for the sign, and in search results
				color = "error", -- can be a hex color, or a named color (see below)
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
				-- signs = false, -- configure signs for some keywords individually
			},
			TODO = { icon = " ", color = "info" },
			HACK = { icon = " ", color = "warning" },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
			TEST = { icon = "󱈤 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
		},
		gui_style = {
			fg = "NONE", -- The gui style to use for the fg highlight group.
			bg = "BOLD", -- The gui style to use for the bg highlight group.
		},
	},
}
