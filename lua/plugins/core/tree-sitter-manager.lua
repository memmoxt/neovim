vim.pack.add {
    { src = "https://github.com/romus204/tree-sitter-manager.nvim" }
}

require("tree-sitter-manager").setup {
    -- Only enable treesitter highlighting for these languages
    -- highlight = { "lua", "c", "html", "css", "svelte" },

    -- Disable treesitter highlighting
    -- highlight = {},
}
