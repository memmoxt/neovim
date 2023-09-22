return {
    "jeetsukumaran/vim-indentwise",
    event = "VeryLazy",
    init = function()
        vim.api.nvim_set_keymap('n', '<S-Left>',
            [[:execute "normal \<Plug>(IndentWisePreviousLesserIndent)"<CR>]],
            { noremap = true, silent = true, desc = "Previous Lesser Indent" })

        vim.api.nvim_set_keymap('n', '<S-Right>',
            [[:execute "normal \<Plug>(IndentWiseNextGreaterIndent)"<CR>]],
            { noremap = true, silent = true, desc = "Next Greater Indent" })

        vim.api.nvim_set_keymap('n', '<S-Up>',
            [[:execute "normal \<Plug>(IndentWisePreviousEqualIndent)"<CR>]],
            { noremap = true, silent = true, desc = "Previous Equal Indent" })

        vim.api.nvim_set_keymap('n', '<S-Down>',
            [[:execute "normal \<Plug>(IndentWiseNextEqualIndent)"<CR>]],
            { noremap = true, silent = true, desc = "Next Equal Indent" })
    end,
    keys = {
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
