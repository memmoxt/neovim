-- :h bufferline for more config
require("bufferline").setup({
	options = {
		mode = "buffers",
		offsets = {
			{
				filetype = "NvimTree",
				text = "Archive Explorer",
				text_align = "left",
				separator = true,
			},
		},
	},
})
