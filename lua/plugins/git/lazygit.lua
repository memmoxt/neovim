return {
    "kdheepak/lazygit.nvim",
    keys = {
        {
            "<leader>gg",
            "<cmd>:LazyGitCurrentFile<CR>",
            mode = "n",
            desc = "LazyGit",
        }
    },
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim"
    },
    config = function()
        require("telescope").load_extension("lazygit")
    end,
}
