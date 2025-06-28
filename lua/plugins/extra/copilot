return {
	-- Add this table inside your Lazy.nvim plugin specification (usually in your plugins/init.lua or plugins.lua)

	"github/copilot.vim",
	lazy = false, -- Load at startup. Set to true if you want to load on demand.
	config = function()
		vim.g.copilot_no_tab_map = true
		vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true, noremap = true })
	end,
}
