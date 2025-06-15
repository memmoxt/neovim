return {
	"echasnovski/mini.hipatterns",
	version = "*",
	config = function()
		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				--	Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
				-- fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				-- hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				-- todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				-- note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

				-- Highlight hex color strings (`#rrggbb`) using that color
				-- hex_color = hipatterns.gen_highlighter.hex_color(),

				-- :NOTE: this is a todo-comments text highlight

				--	:SESSION HIGHLIGHT-CUSTOM: 󰛸 Neovim custom highlight with mini-hipatterns
				-- Highlight for ':ANYCAPSLOCKWORD any-string-that-comes-after:'
				capslock_pattern = {
					pattern = ":%s*[A-Z]+%s+[%w%-]+:", -- Matches ':ANYCAPSLOCKWORD any_string-that-comes-after:'
					group = function(_, _, data)
						local hl_group = "CapslockHighlight"
						vim.api.nvim_set_hl(0, hl_group, {
							fg = "#0f172a",
							bg = "#FF5733",
						})
						-- Highlight only 'ANYCAPSLOCKWORD any_string-that-comes-after', excluding colons
						return hl_group, { start = data.full_match:find("[A-Z]"), len = data.full_match:len() - 1 }
					end,
					extmark_opts = { priority = 2000 },
				},
				-- Highlight for the rest of the line after ':ANYCAPSLOCKWORD any_string-that-comes-after:'
				capslock_line_flair = {
					pattern = ":%s*[A-Z]+%s+[%w%-]+:()[^\n]*", -- Matches text after ':ANYCAPSLOCKWORD any_string-that-comes-after:' until end of line
					group = function(_, _, _)
						local hl_group = "CapslockLineFlair"
						vim.api.nvim_set_hl(0, hl_group, {
							fg = "#FF5733", -- Foreground matches background of CapslockHighlight
						})
						return hl_group
					end,
					extmark_opts = { priority = 1999 }, -- Slightly lower priority
				},
				--	:ENDSESSION HIGHLIGHT-CUSTOM: 󰛸 end of this highlight config

				custom_pattern1 = {
					pattern = "%f[%w]()CUSTOM1()%f[%W]",
					group = function(_, _, _)
						return hipatterns.compute_hex_color_group("#FF5733", "bg")
					end,
					extmark_opts = { priority = 2000 },
				},

				custom_pattern2 = {
					pattern = "%f[%w]()CUSTOM2()%f[%W]", -- Matches 'CUSTOM' as a standalone word
					group = function(_, _, _)
						-- Define a custom highlight group with foreground and background colors
						local hl_group = "CustomHighlight"
						vim.api.nvim_set_hl(0, hl_group, {
							fg = "#FF5733", -- Foreground color (e.g., orange)
							bg = "#333333", -- Background color (e.g., dark gray)
						})
						return hl_group
					end,
				},

				custom_pattern3 = {
					pattern = "%f[%w]()CUSTOM3()%f[%W]",
					group = function(_, _, _)
						return hipatterns.compute_hex_color_group("#FF5733", "fg")
					end,
					extmark_opts = function(_, _, data)
						return {
							virt_text = { { "󰙼 CUSTOM3", data.hl_group } },
							virt_text_pos = "inline",
							-- virt_text_pos = "overlay",
							priority = 2000,
						}
					end,
				},
			},
		})
	end,
}
