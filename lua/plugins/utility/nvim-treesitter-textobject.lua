return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    config = function()
        require("nvim-treesitter.configs").setup({
            textobjects = {
                select = {
                    enable = true,

                    lookahead = true,

                    -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects#built-in-textobjects
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        -- ["af"] = "@function.outer",
                        ["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
                        -- ["if"] = "@function.inner",
                        ["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },

                        ["ac"] = "@class.outer",
                        -- You can optionally set descriptions to the mappings (used in the desc parameter of
                        -- nvim_buf_set_keymap) which plugins like which-key display
                        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                        -- You can also use captures from other query groups like `locals.scm`
                        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                    }
                }
            }
        })
    end

}
