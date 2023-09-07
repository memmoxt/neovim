return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "buffers",
			separator_style = "thin", -- thick | thin | slant
			offsets = {
				{
					filetype = "NvimTree",
					text = "📁 Archive Explorer",
					text_align = "left", -- left | center | right
					separator = true,
				},
			},
            hover = {
                enabled = true,
                delay = 200,
                reveal = {'close'}
            },
			always_show_bufferline = false,
            sort_by = "id" -- 'id' | 'extension' | 'relative_directory' | 'directory'
		},
	},
}
