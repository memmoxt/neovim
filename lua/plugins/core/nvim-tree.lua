return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {
            auto_reload_on_write = true,
            -- respect_buf_cwd = true,
            sync_root_with_cwd = true,
            view = {

                preserve_window_proportions = true,
                centralize_selection = true,
                cursorline = true,
                width = 30,
            },
            update_focused_file = {
                enable = true,
                update_root = false,
                ignore_list = {},
            },
        }
        vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Open NvimTree" })
    end,
}

