local wk = require("which-key")

wk.register({
	["<leader>"] = {
		f = {
			name = "+file",
			b = { "<cmd>Telescope buffers<cr>", "Buffer Files" },
			f = { "<cmd>Telescope find_files<cr>", "Find File" },
			n = { "<cmd>enew<cr>", "New File" },
			r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
			g = { "<cmd>Telescope grep_string<cr>", "GREP" },
			h = { "<cmd>Telescope help_tags<cr>", "Help" },
		},
		h = {
			name = "Gitsigns",
			r = { name = "Reset Hunk" },
			d = { name = "DiffThis" },
			D = { name = "DiffThis" },
			R = { name = "Reset Buffer" },
			s = { name = "Stage Hunk" },
			S = { name = "Stage Buffer" },
			p = { name = "Preview Hunk" },
			u = { name = "Undo Stage Hunk" },
			b = { name = "Blame Line" },
		},
		l = {
			name = "Language Servers",
			f = { "<cmd>lua vim.lsp.buf.format{async = true}<cr>", "Format Code" },
		},

		k = {
			name = "Vim Trainning",
			l = { "<cmd>KeylabStart<cr>", "Key-Lab" },
			k = { "<cmd>VimBeGood<cr>", "Vim Be Good" },
		},
		td = {
			name = "Gitsigns - Toggle Deleted",
		},

		z = {
			name = "CCC",
			p = { "<cmd>CccPick<cr>", "Pick Color" },
			c = { "<cmd>CccConvert<cr>", "Convert" },
			h = { "<cmd>CccHighlighterToggle<cr>", "Toggle Highlighter" },
		},
	},
	["["] = { c = { name = "Prev Hunk" } },
	["]"] = { c = { name = "Next Hunk" } },
	["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },

	["<C-`>"] = { "<cmd>cd %:h<cr><cmd>ToggleTerm<cr>", "Toggle Terminal" },
	-- Toggle terminal on the current buffer path, you need to exit to reset the opening path
})
