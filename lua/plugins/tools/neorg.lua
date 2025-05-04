return {
    "nvim-neorg/neorg",
    dependencies = {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
    lazy = true,   -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    keys = {
        { "<leader>o", "<cmd>Neorg workspace notes<CR>", desc = "Neorg Notes", mode = "n" },
        -- { "<leader>o", "<cmd>Neorg return<CR>",          desc = "Quit Neorg",  mode = "n" },
    },
    opts = function()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {},
                ["external.interim-ls"] = {
                    config = {
                        -- default config shown
                        completion_provider = {
                            -- Enable or disable the completion provider
                            enable = true,

                            -- Show file contents as documentation when you complete a file name
                            documentation = true,

                            -- Try to complete categories provided by Neorg Query. Requires `benlubas/neorg-query`
                            categories = false,

                            -- suggest heading completions from the given file for `{@x|}` where `|` is your cursor
                            -- and `x` is an alphanumeric character. `{@name}` expands to `[name]{:$/people:# name}`
                            people = {
                                enable = false,

                                -- path to the file you're like to use with the `{@x` syntax, relative to the
                                -- workspace root, without the `.norg` at the end.
                                -- ie. `folder/people` results in searching `$/folder/people.norg` for headings.
                                -- Note that this will change with your workspace, so it fails silently if the file
                                -- doesn't exist
                                path = "people",
                            }
                        }
                    }
                },
                ["core.concealer"] = {},
                ["core.completion"] = {
                    config = { engine = { module_name = "external.lsp-completion" } },
                },
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
                            arktype = "~/Documents/notes/arktype/",
                        },
                    },
                },

            },
        }
        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2
    end,

}
