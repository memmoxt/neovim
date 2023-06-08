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

		l = {
			name = "Language Servers",
			f = { "<cmd>lua vim.lsp.buf.format{async = true}<cr>", "Format Code" },
		},

		k = {
			name = "Vim Trainning",
			l = { "<cmd>KeylabStart<cr>", "Key-Lab" },
		},

		z = {
			name = "CCC",
			p = { "<cmd>CccPick<cr>", "Pick Color" },
			c = { "<cmd>CccConvert<cr>", "Convert" },
			h = { "<cmd>CccHighlighterToggle<cr>", "Toggle Highlighter" },
		},
	},

	["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },

	["<C-`>"] = { "<cmd>cd %:h<cr><cmd>ToggleTerm<cr>", "Toggle Terminal" },
})
