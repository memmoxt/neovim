return {
	"SmiteshP/nvim-navic",
	lazy = true,
	init = function()
		vim.g.navic_silence = true
        vim.o.statusline = "%{%v:lua.require'nvim-navic'.get_location()%}"
	end,
	opts = function()
		return {
			icons = {
				File = "󰈙 ",
				Module = " ",
				Namespace = "󰌗 ",
				Package = " ",
				Class = "󰌗 ",
				Method = "󰆧 ",
				Property = " ",
				Field = " ",
				Constructor = " ",
				Enum = "󰕘",
				Interface = "󰕘",
				Function = "󰊕 ",
				Variable = "󰆧 ",
				Constant = "󰏿 ",
				String = "󰀬 ",
				Number = "󰎠 ",
				Boolean = "◩ ",
				Array = "󰅪 ",
				Object = "󰅩 ",
				Key = "󰌋 ",
				Null = "󰟢 ",
				EnumMember = " ",
				Struct = "󰌗 ",
				Event = " ",
				Operator = "󰆕 ",
				TypeParameter = "󰊄 ",
			},
			lsp = {
				auto_attach = false,
				preference = nil,
			},
			highlight = false,
			separator = " > ",
			depth_limit = 0,
			depth_limit_indicator = "..",
			safe_output = true,
			lazy_update_context = false,
			click = false,
		}
	end,
}
