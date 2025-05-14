return {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    keys = {
        {
            "<leader>fs",
            mode = { "n" },
            desc = "Load Session CWD",
        },
        {
            "<leader>fS",
            mode = { "n" },
            desc = "Select Session to load",
        },
        {
            "<leader>fl",
            mode = { "n" },
            desc = "Load last Session",
        },

    },
    opts = {
        -- load the session for the current directory
        vim.keymap.set("n", "<leader>fs", function() require("persistence").load() end),

        -- select a session to load
        vim.keymap.set("n", "<leader>fS", function() require("persistence").select() end),

        -- load the last session
        vim.keymap.set("n", "<leader>fl", function() require("persistence").load({ last = true }) end),

        -- stop Persistence => session won't be saved on exit
        vim.keymap.set("n", "<leader>fd", function() require("persistence").stop() end)     }
}
