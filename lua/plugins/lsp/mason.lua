return {
	"williamboman/mason.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig.nvim",
	},
	init = function()
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
                "tsserver",
                "svelte",
                "cssls",
                "lua_ls",
                "autopep8",
                "rust_analyzer",
                "tailwindcss",
                -- "emmet_ls",
                "html",
                "pyright",
            },
		})
	end,
}
