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
        disabled_filetypes = { "ccc", "nvim-tree mappings", "nvim-tree", "toggleterm", "ToggleTerm", "Navbuddy", "help",
            "h",
            "qf", "netrw", "neo-tree",
            "NvimTree", "lazy", "mason" },
        restrition_mode = "block",
        restricted_keys = {
            ["<Left>"] = { "i","n", "x" },
            ["<Right>"] = { "i","n", "x" },
            ["<Up>"] = { "n","i", "x" },
            ["<Down>"] = { "n","i", "x" },
        },
    },
}
