require("mason").setup({
	PATH = "prepend", -- "skip" seems to cause the spawning error
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "rust_analyzer", "pyright", "cssls", "html", "emmet_ls", "tailwindcss" },
})

require("mason-null-ls").setup({
	ensure_installed = { "stylua", "prettier", "eslint_d", "stylelint", "alex", "black" },
})
