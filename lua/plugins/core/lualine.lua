-- Lualine config taken from LazyVim config
return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",

    opts = function()
        return {
            options = {
                theme = "auto",
                globalstatus = true,
                disabled_filetypes = { statusline = { "dashboard", "alpha" } },
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        color = { fg = '#ffaa88', bg = 'grey', gui = 'italic,bold' },

                    },

                },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = {
                    { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                    { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
                    {
                        function()
                            return require("nvim-navic").get_location()
                        end,
                        cond = function()
                            return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
                        end,
                    },
                },
                lualine_y = {
                    { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
                    { "location", padding = { left = 0, right = 1 } },
                },

                -- lualine_z = {
                --     function()
                --         return " " .. os.date("%R")
                --     end,
                -- },
                lualine_z = {
                    {
                        require("nvim-possession").status,
                        cond = function()
                            return require("nvim-possession").status() ~= nil
                        end,
                    },
                },

            },
            extensions = { "nvim-tree", "lazy" },
        }
    end,
}
