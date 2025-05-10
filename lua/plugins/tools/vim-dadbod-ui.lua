return {
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod',                     lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        keys = {
            { "<leader>dd", "<cmd>DBUIToggle<cr>",        desc = "Dadbod-UI" },
            { "<leader>da", "<cmd>DBUIAddConnection<cr>", desc = "Add Connection" },
            { "<leader>df", "<cmd>DBUIFindBuffer<cr>",    desc = "Find Buffer" },
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },
    -- { -- optional saghen/blink.cmp completion source (this part is already inserted on blinkcmp config)
    --     'saghen/blink.cmp',
    --     opts = {
    --         sources = {
    --             per_filetype = {
    --                 sql = { 'snippets', 'dadbod', 'buffer' },
    --             },
    --             -- add vim-dadbod-completion to your completion providers
    --             providers = {
    --                 dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
    --             },
    --         },
    --     },
    -- }
}
