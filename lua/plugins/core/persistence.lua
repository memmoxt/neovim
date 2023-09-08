return {
    "folke/persistence.nvim",
    keys = {
        {
            "<leader>wt",
            -- "<cmd>lua require("persistence").load()<cr>",
            [[<cmd>lua require("persistence").load()<cr>]],
            desc = "Open last Session",
        },
    },
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
        -- add any custom options here
    }
}
