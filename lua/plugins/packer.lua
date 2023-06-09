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

	-- ## TREESITTER ##
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	-- ## LSP ##
	use({
		"williamboman/mason.nvim",
		run = ":MasonUpdate", -- :MasonUpdate updates registry contents
	})
	use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
	use("neovim/nvim-lspconfig")

	--## NULL LS ##--
	use("jose-elias-alvarez/null-ls.nvim")
	use("nvim-lua/plenary.nvim")

	-- ## CMP ## --
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("rafamadriz/friendly-snippets")
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
	-- path to the code to the sources that I modified to not repeat CMP suggestions
	-- line 45 "my custom code"
	-- /home/memmoxt/.local/share/nvim/site/pack/packer/start/nvim-cmp/lua/cmp/core.lua

	-- ## LUALINE ## --
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	-- ## HIGHLIGHTS ## --
	use("RRethy/vim-illuminate")
	use("lukas-reineke/indent-blankline.nvim")

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

	-- ## Live Server ##--
	use({
		"aurum77/live-server.nvim",
		run = function()
			require("live_server.util").install()
		end,
		cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
	})
	--## Games ##--
	--## Keylab ##--
	use("BooleanCube/keylab.nvim")
	--## Vim-be-good ##--
	use("ThePrimeagen/vim-be-good")

	--## Comment ##--
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	-- ## Colorizer (Display Colors) ## --
	-- use("NvChad/nvim-colorizer.lua")

	-- ## Display Color and Picker## --
	use("uga-rosa/ccc.nvim")

	-- ## Git ##
	use("lewis6991/gitsigns.nvim")
	use({
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- ## Screen Saver ##
	use({ "tamton-aquib/zone.nvim" })

	-- Project NVIM --
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
				sync_root_with_cwd = true,
				respect_buf_cwd = true,
				update_focused_file = {
					enable = true,
					update_root = true,
				},
			})
		end,
	})
end)
