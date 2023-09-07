return {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
        -- Remove <Up> keys and append <Space> to the disabled_keys
        disabled_keys = {
            ["<Up>"] = {},
            ["<Down>"] = {},
            ["<Left>"] = {},
            ["<Right>"] = {},
        },
        disabled_filetypes = { "toggleterm", "ToggleTerm", "Navbuddy", "help", "h", "qf", "netrw", "neo-tree",
            "NvimTree", "lazy", "mason" },
        restrition_mode = "block",
        restricted_keys = {
            ["<Left>"] = { "n", "x" },
            ["<Right>"] = { "n", "x" },
            ["<Up>"] = { "n", "x" },
            ["<Down>"] = { "n", "x" },
        },
    },
}
