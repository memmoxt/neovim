vim.pack.add { "https://github.com/TKasperczyk/snacks-gallery.nvim" }

vim.keymap.set("n", "<leader>i", function() require("snacks-gallery").open() end, { desc = "Gallery" })

