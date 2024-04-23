return {
    "gennaro-tedesco/nvim-possession",
    dependencies = {
        "ibhagwan/fzf-lua",
    },
    keys = {
        {
            "<leader>sl",
            mode = { "n" },
            function() require("nvim-possession").list() end,
            desc = "List Sessions"
        },

        {
            "<leader>sn",
            mode = { "n" },
            function() require("nvim-possession").new() end,
            desc = "New Session"
        },
        {
            "<leader>su",
            mode = { "n" },
            function() require("nvim-possession").update() end,
            desc = "Update Session"
        },

        {
            "<leader>sd",
            mode = { "n" },
            function() require("nvim-possession").delete() end,
            desc = "Delete Session"
        },
    },
    config = function()
        require("nvim-possession").setup({
            sessions = {
                sessions_path = vim.fn.stdpath("config") .. "/sessions/",
                sessions_variable = "session",
                sessions_icon = "",
                sessions_prompt = "sessions:",
            },

            autoload = false,    -- whether to autoload sessions in the cwd at startup
            autosave = true,     -- whether to autosave loaded sessions before quitting
            autoswitch = {
                enable = false,  -- whether to enable autoswitch
                exclude_ft = {}, -- list of filetypes to exclude from autoswitch
            },

            save_hook = nil, -- callback, function to execute before saving a session
            -- useful to update or cleanup global variables for example
            post_hook = nil, -- callback, function to execute after loading a session
            -- useful to restore file trees, file managers or terminals
            -- function()
            --     require('FTerm').open()
            --     require('nvim-tree').toggle(false, true)
            -- end

            fzf_winopts = {
                -- any valid fzf-lua winopts options, for instance
                width = 0.7,
                preview = {
                    vertical = "right:30%"
                }
            }
        })
    end
}
