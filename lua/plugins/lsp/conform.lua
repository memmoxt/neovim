vim.pack.add({ { src = "https://github.com/stevearc/conform.nvim" } })

vim.keymap.set({ 'n' }, "<leader>cc",
    function()
        require("conform").format({ async = true })
    end,
    { desc = "Conform Format" })

require("conform").setup({
    -- Define your formatters
    formatters_by_ft = {
        lua = { "stylua" },
        -- python = { "isort", "black" },
        rpy = { "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier" },
        sql = { "sleek" },
    },

    -- Set default options
    default_format_opts = {
        lsp_format = "fallback",
    },

    -- Set up format-on-save
    -- format_on_save = { timeout_ms = 500 },
    format_on_save = false,

    -- Customize formatters
    formatters = {
        sleek = {
            command = "sleek",
            args = { "$FILENAME" },
            stdin = false,
        },
        shfmt = {
            prepend_args = { "-i", "2" },
        },
    },
})
