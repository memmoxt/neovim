return {
    "jeetsukumaran/vim-indentwise",
    keys = {
        {
            "<S-Left>",
            function()
                vim.api.nvim_set_keymap('n', '<S-Left>',
                    [[:execute "normal \<Plug>(IndentWisePreviousLesserIndent)"<CR>]],
                    { noremap = true, silent = true })
            end,
            desc = "Previous Lesser Indent",
        },
        {
            "<S-Right>",
            function()
                vim.api.nvim_set_keymap('n', '<S-Right>',
                    [[:execute "normal \<Plug>(IndentWiseNextGreaterIndent)"<CR>]],
                    { noremap = true, silent = true })
            end,
            desc = "Next Lesser Indent",
        },
        {
            "<S-Up>",
            function()
                vim.api.nvim_set_keymap('n', '<S-Up>',
                    [[:execute "normal \<Plug>(IndentWisePreviousEqualIndent)"<CR>]],
                    { noremap = true, silent = true })
            end,
            desc = "Previous Lesser Indent",
        },
        {
            "<S-Down>",
            function()
                vim.api.nvim_set_keymap('n', '<S-Down>',
                    [[:execute "normal \<Plug>(IndentWiseNextEqualIndent)"<CR>]],
                    { noremap = true, silent = true })
            end,
            desc = "Previous Lesser Indent",
        },
        {
            "[-",
            mode = { "n" },
            desc = "Previous Lesser Indent",
        },
        {
            "[=",
            mode = { "n" },
            desc = "Previous Equal Indent",
        },
        {
            "[+",
            mode = { "n" },
            desc = "Previous Greater Indent",
        },
        {
            "]-",
            mode = { "n" },
            desc = "Next Lesser Indent",
        },
        {
            "]=",
            mode = { "n" },
            desc = "Next Equal Indent",
        },
        {
            "]+",
            mode = { "n" },
            desc = "Next Greater Indent",
        },
        {
            "[_",
            mode = { "n" },
            desc = "Previous Absolute Indent",
        },
        {
            "]_",
            mode = { "n" },
            desc = "Next Absolute Indent",
        },
        {
            "[%",
            mode = { "n" },
            desc = "Block Scope Boundary Begin",
        },
        {
            "]%",
            mode = { "n" },
            desc = "Block Scope Boundary End",
        },
    },
}
