return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.2",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Telescope",
	event = "VeryLazy",
	keys = {
		{
			"<leader>,",
			"<cmd>Telescope buffers show_all_buffers=true<cr>",
			desc = "Switch Buffer",
		},
		{
			"<leader>:",
			"<cmd>Telescope command_history<cr>",
			desc = "Command History",
		},

		-- find
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },

		-- git
		{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
		{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },

		-- search
		{ '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
		{
			"<leader>sa",
			"<cmd>Telescope autocommands<cr>",
			desc = "Auto Commands",
		},
		{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
		{
			"<leader>sc",
			"<cmd>Telescope command_history<cr>",
			desc = "Command History",
		},
		{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
		{
			"<leader>sd",
			"<cmd>Telescope diagnostics bufnr=0<cr>",
			desc = "Document diagnostics",
		},
		{
			"<leader>sD",
			"<cmd>Telescope diagnostics<cr>",
			desc = "Workspace diagnostics",
		},
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
		{
			"<leader>sH",
			"<cmd>Telescope highlights<cr>",
			desc = "Search Highlight Groups",
		},
		{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
		{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
		{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
		{ "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
		{ "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
	},

	opts = {
		defaults = {
			-- Default configuration for telescope goes here:
			-- config_key = value,
			prompt_prefix = " ",
			selection_caret = " ",
			mappings = {
				i = {
					["<a-i>"] = function()
						local action_state = require("telescope.actions.state")
						local line = action_state.get_current_line()
					end,
					["<a-h>"] = function()
						local action_state = require("telescope.actions.state")
						local line = action_state.get_current_line()
					end,
					["<C-Down>"] = function(...)
						return require("telescope.actions").cycle_history_next(...)
					end,
					["<C-Up>"] = function(...)
						return require("telescope.actions").cycle_history_prev(...)
					end,
					["<C-f>"] = function(...)
						return require("telescope.actions").preview_scrolling_down(...)
					end,
					["<C-b>"] = function(...)
						return require("telescope.actions").preview_scrolling_up(...)
					end,
				},
				n = {
					["q"] = function(...)
						return require("telescope.actions").close(...)
					end,
				},
			},
		},
		pickers = {
			-- Default configuration for builtin pickers goes here:
			-- picker_name = {
			--   picker_config_key = value,
			--   ...
			-- }
			-- Now the picker_config_key will be applied every time you call this
			-- builtin picker
		},
		extensions = {
			-- Your extension configuration goes here:
			-- extension_name = {
			--   extension_config_key = value,
			-- }
			-- please take a look at the readme of the extension you want to configure
		},
	},
}