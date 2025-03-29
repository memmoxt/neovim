return {
    "folke/which-key.nvim",
    event = "VeryLazy",

    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },

    --## colors for icos available: "azure","blue","cyan","green","grey","orange","purple","red","yellow"

    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },

    },

    init = function()
        local wk = require("which-key")
        wk.add(
            {
                { "<leader>f",  group = "file" }, -- group
                { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
                { "<leader>fb", function() print("hello") end,   desc = "Foobar" },
                { "<leader>fn", desc = "New File" },
                { "<leader>f1", hidden = true },                                      -- hide this keymap
                { "<leader>w",  proxy = "<c-w>",                 group = "windows" }, -- proxy to window mappings
                {
                    "<leader>b",
                    group = "buffers",
                    expand = function()
                        return require("which-key.extras").expand.buf()
                    end
                },
                {
                    -- Nested mappings are allowed and can be added in any order
                    -- Most attributes can be inherited or overridden on any level
                    -- There's no limit to the depth of nesting
                    mode = { "n", "v" },                          -- NORMAL and VISUAL mode
                    { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
                },

                -- ## Memmo custom keys and group names
                { "z", group = "Fold" },

                -- <leader>
                {
                    { "<leader>t", group = "Tab", icon = { icon = "󱏂 ", color = "blue" } },
                    { "<leader>tm", group = "Move Tab", icon = { icon = "󰓪  ", color = "blue" } },
                },

                { "<leader>w", group = "Window", icon = { icon = "󰖯", color = "blue" } },

                { "<leader>g", group = "Git", icon = { icon = " ", color = "orange" } },

                {
                    { "<leader>z", group = "Utilities", icon = { icon = "󱁤 ", color = "azure" } },
                    { "<leader>zn", icon = { icon = " ", color = "blue" } },
                    { "<leader>zx", icon = { icon = "󰨭 ", color = "green" } },
                    { "<leader>za", "<cmd>Screenkey<cr>", desc = "Screenkey Toggle", icon = { icon = "  ", color = "green" } },
                    {
                        { "<leader>zc", group = "Colors", icon = { icon = " ", color = "yellow" } },
                        { "<leader>zcc", "<cmd>CccConvert<cr>", desc = "Convert Color", icon = { icon = "󰯍 ", color = "yellow" } },
                        { "<leader>zcd", "<cmd>CccPick<cr>", desc = "Pick Color", icon = { icon = "󰈊 ", color = "yellow" } },
                        { "<leader>zcx", "<cmd>ColorizerToggle<cr>", desc = "Toggle Highlights", icon = { icon = " ", color = "yellow" } },
                    }
                },

            }
        )
    end

    -- init = function()
    --     vim.o.timeout = true
    --     vim.o.timeoutlen = 1000
    --
    --     local wk = require("which-key")
    --     wk.register({
    --
    --
    --         ["<leader>"] = {
    --             ["<leader>"] = {
    --                 name = "Source",
    --                 s = { "<cmd>source ~/.config/nvim/init.lua<cr>", "Source Init.lua" },
    --             },
    --
    --             z = {
    --                 name = "UTILITIES",
    --                 c = { "<cmd>CccConvert<cr>", "Convert CCC" },
    --                 h = { "<cmd>CccHighlighterToggle<cr>", "Toggle Highlighter" },
    --                 p = { "<cmd>CccPick<cr>", "Pick Color" },
    --                 s = {"<cmd>Screenkey<cr>", "Screenkey Toggle"},
    --             },
    --         },
    --
    --     })
    -- end,

}
