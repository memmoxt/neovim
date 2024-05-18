return {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    keys = {
        { "<leader>zn", "<cmd>Neorg workspace notes<CR>", desc = "Neorg Notes", mode = "n" },
        { "<leader>zr", "<cmd>Neorg return<CR>",          desc = "Quit Neorg",  mode = "n" },
    },
    opts = function()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.completion"] = { config = { engine = "nvim-cmp" } },
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
            },
        }
        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2
    end,

}
