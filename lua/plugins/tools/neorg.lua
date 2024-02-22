return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>zn", "<cmd>Neorg workspace notes<CR>", desc = "Neorg Notes", mode = "n" },
        { "<leader>zr", "<cmd>Neorg return<CR>",          desc = "Quit Neorg",  mode = "n" },
    },
    config = function()
        require("neorg").setup({
            -- Temporary fix to make neorg conceal links in .norg documents
            vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
                pattern = { "*.norg" },
                command = "set conceallevel=3"
            }),

            load = {
                ["core.completion"] = { config = { engine = "nvim-cmp" } },

                ["core.ui"] = {},
                ["core.defaults"] = {},  -- Loads default behaviour
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.integrations.treesitter"] = {},
                ["core.export"] = {
                    config = {
                        export_dir = { "<export-dir>/<language>-export" },
                    },
                },
                ["core.export.markdown"] = {
                    config = {
                        extension = "md",
                    },
                },
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/Documents/notes",
                        },
                    },
                },
                ["core.keybinds"] = {
                    config = {
                        default_keybinds = true,
                    },
                },
            },
        })
    end,
}
