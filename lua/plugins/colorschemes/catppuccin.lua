return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = true, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark", -- 'dark' , 'light'
				percentage = 0.05, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = {},
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = { "italic" },
				operators = {},
			},
			color_overrides = {
				all = {
					text = "#ffffff",
					base = "#1e293b", -- background for line highlight (showing current cursor line)
					subtext0 = "#22C68D", -- used in titles of pop-up window
					subtext1 = "#bef264", -- text used in the status line
					overlay0 = "#a5b4fc", -- name of the files in the search and inactive indent
					overlay1 = "#78350f",
					overlay2 = "#94a3b8", -- used in the comments, snack arrows, blink.cmp main border and name label,
					surface0 = "#334155", -- this will overwrite "base" - background for line highlight (showing current cursor line)
					surface1 = "#334155", -- inactive line numbers, sub-menu bg highlight, bg-second item statusline, some borders, explorer lines
					surface2 = "#f97316", --
					mantle = "#24283B", -- snacks(explorer,pop-up) background, statusline ("Normal") text color, center path bg color & position number color,
					crust = "#293548", -- tabby.nvim tab selected bg color

					-- ## COLORS
					flamingo = "#64748b", -- used in brackets{}, snippets icon
					pink = "#14b8a6", -- used on arrow icon on explorer and indent hl
				},
			},
			highlight_overrides = {
				all = function(colors)
					return {
						NvimTreeNormal = { fg = colors.none },
						CmpBorder = { fg = "#365314" },

						-- New overrides with custom colors
						Comment = { fg = "#64748b", style = { "italic" } }, -- Comments
						Conditional = { fg = "#FFD700" }, -- Conditionals (e.g., if/else)
						Repeat = { fg = "#FF00FF" }, -- Loops (e.g., for/while)
						Function = { fg = "#fdba74", style = { "bold" } }, -- Functions
						Keyword = { fg = "#32CD32" }, -- Keywords
						String = { fg = "#86efac" }, -- Strings
						Identifier = { fg = "#fcd34d" }, -- Variables
						Number = { fg = "#fdba74" }, -- Numbers
						Boolean = { fg = "#f87171" }, -- Booleans
						Field = { fg = "#000000" }, -- Properties
						Type = { fg = "#3b82f6", style = { "italic" } }, -- Types
						Operator = { fg = "#22c55e" },

						-- ## Snacks.nvim
						-- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/groups/integrations/snacks.lua
						SnacksDashboardDesc = { fg = "#ffffff" },
						-- SnacksDashboardFile = { fg = "#ca8a04" },
						-- SnacksDashboardFooter = { fg = C.yellow, style = { "italic" } },
						SnacksDashboardHeader = { fg = "#f8fafc" },
						SnacksDashboardIcon = { fg = "#22c55e", bold = true },
						SnacksDashboardKey = { fg = "#fef9c3" },

						-- ## WhichKey
						-- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/groups/integrations/which_key.lua

						WhichKeyGroup = { fg = "#3b82f6" },
						WhichKeySeparator = { fg = "#94a3b8" },
						WhichKeyDesc = { fg = "#fef9c3" }, --snacks whitchkey text
						WhichKeyValue = { fg = "#ec4899" },

						-- Custom :hightlight
						NotificationInfo = { fg = "#B7BCC5", bg = "#0000FF" },
						NotificationWarning = { fg = "#ef4444", bg = "#FFFF00" },
						NotificationError = { fg = "#a855f7", bg = "#FF0000" },
					}
				end,
			},
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
				fidget = true,
				snacks = {
					enabled = true,
					indent_scope_color = "#ef4444", -- catppuccin color (eg. `lavender`) Default: text
				},
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
			-- custom_highlight = {},
		})

		-- setup must be called before loading
		vim.cmd.colorscheme("catppuccin")
	end,
}
