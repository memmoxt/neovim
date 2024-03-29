return {
    "kiyoon/treesitter-indent-object.nvim",
    -- Press "v" and then use the following keys
    keys = {
        {
            "ai",
            "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer()<CR>",
            mode = { "x", "o" },
            desc = "Select context-aware indent (outer)",
        },
        {
            "aI",
            "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer(true)<CR>",
            mode = { "x", "o" },
            desc = "Select context-aware indent (outer, line-wise)",
        },
        {
            "ii",
            "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner()<CR>",
            mode = { "x", "o" },
            desc = "Select context-aware indent (inner, partial range)",
        },
        {
            "iI",
            "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner(true)<CR>",
            mode = { "x", "o" },
            desc = "Select context-aware indent (inner, entire range)",
        },
    },
}
