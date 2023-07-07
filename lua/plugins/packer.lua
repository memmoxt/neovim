-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- ## TELESCOPE ##
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- ## TREESITTER ##
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	-- ## LSP ##
	use({
		"williamboman/mason.nvim",
		run = ":MasonUpdate", -- :MasonUpdate updates registry contents
	})
	use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
	use("neovim/nvim-lspconfig")
	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup(
				-- Disable virtual_text since it's redundant due to lsp_lines.
				vim.diagnostic.config({
					virtual_text = false,
				})
			)
		end,
	})
	--## NULL LS ##--
	use("jose-elias-alvarez/null-ls.nvim")
	use("nvim-lua/plenary.nvim")
	use("jay-babu/mason-null-ls.nvim")

	-- ## CMP ## --
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	-- use("rafamadriz/friendly-snippets")
	use({
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip/loaders/from_vscode").lazy_load({
				paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets" },
			})
		end,
	})
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lua") -- nvim opt,keymap,etc completions

	-- ## LUALINE ## --
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	-- ## HIGHLIGHTS ## --
	use("RRethy/vim-illuminate")
	use("lukas-reineke/indent-blankline.nvim")

	-- ## EYELINER ## --
	use({
		"jinh0/eyeliner.nvim",
		config = function()
			require("eyeliner").setup({
				highlight_on_key = true, -- show highlights only after keypress
				dim = true, -- dim all other characters if set to true (recommended!)
			})
		end,
	})

	-- ## Fold Code ## --
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	-- ## Alpha ## --
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- ## NVIM TREE ##--
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")

	-- ## ToggleTerm ##--
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})
	-- ## Buffer Line ##--
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })

	-- ## WhichKey ##--
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	-- ## GITHUB NVIM THEME ##
	use({
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({
				-- ...
			})

			vim.cmd("colorscheme github_dark")
		end,
	})

	--## Games ##--
	use("ThePrimeagen/vim-be-good")

	--## Surround ##--
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})

	--## Indent ## --
	-- use({
	-- 	"nmac427/guess-indent.nvim",
	-- 	config = function()
	-- 		require("guess-indent").setup({
	-- 			auto_cmd = true, -- Set to false to disable automatic execution
	-- 			override_editorconfig = false, -- Set to true to override settings set by .editorconfig
	-- 			filetype_exclude = { -- A list of filetypes for which the auto command gets disabled
	-- 				"netrw",
	-- 				"tutor",
	-- 			},
	-- 			buftype_exclude = { -- A list of buffer types for which the auto command gets disabled
	-- 				"help",
	-- 				"nofile",
	-- 				"terminal",
	-- 				"prompt",
	-- 			},
	-- 		})
	-- 	end,
	-- })

	--## Comment ##--
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})

	-- ## NEORG ## --
	use({
		"nvim-neorg/neorg",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/notes_neorg",
								ArkType = "~/arktype_neorg_notes",
							},

							default_workspace = "notes",
						},
					},
				},
			})
		end,
		run = ":Neorg sync-parsers",
		requires = "nvim-lua/plenary.nvim",
	})
	-- ## Display Color and Picker## --
	use("uga-rosa/ccc.nvim")

	-- ## Dial ## --
	use("monaqa/dial.nvim")

	-- ## Git ##
	use("lewis6991/gitsigns.nvim")
	use({
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- ## Image Previewer ## --
	use({ "edluffy/hologram.nvim" })
end)
