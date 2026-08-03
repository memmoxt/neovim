vim.pack.add({
    { src = "https://github.com/jeetsukumaran/vim-indentwise" },
})


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
