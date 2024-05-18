return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 1000

        local wk = require("which-key")
        wk.register({
            g = {
                name = "+GO TO",
            },

            z = {
                name = "+FOLD",
            },

            ["<leader>"] = {
                ["<leader>"] = {
                    name = "Source",
                    s = { "<cmd>source ~/.config/nvim/init.lua<cr>", "Source Init.lua" },
                },
                c = {
                    name = "+CODE",
                },

                f = {
                    name = "+FILE",
                },

                g = {
                    name = "+GIT",
                },

                t = {
                    name = "+TAB",
                    m = {
                        name = "Move Tab",
                    },
                },

                z = {
                    name = "UTILITIES",
                    p = { "<cmd>CccPick<cr>", "Pick Color" },
                    c = { "<cmd>CccConvert<cr>", "Convert" },
                    h = { "<cmd>CccHighlighterToggle<cr>", "Toggle Highlighter" },
                },
            },

        })
    end,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
}
