return {
    "barrett-ruth/live-server.nvim",
    -- build = "bun global add live-server",
    config = true,
    keys = {
        { "<leader>zl", "<cmd>LiveServerStart<CR>", desc = "Live-Server", mode = "n" },
    },
    opts = function()
        require("live-server").setup({
            -- Arguments passed to live-server via `vim.fn.jobstart()`
            -- Run `live-server --help` to see list of available options
            -- For example, to use port 7000 and browser firefox:
            args = { "--port=8000", "--browser=firefox" },
            -- args = {},
        })
    end,
}
