return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    cmd = "Telescope",
    event = "VeryLazy",
    init = function()
        require("telescope").setup {
            defaults = {
                preview = {
                    mime_hook = function(filepath, bufnr, opts)
                        local is_image = function(filepath)
                            local image_extensions = { 'png', 'jpg' } -- Supported image formats
                            local split_path = vim.split(filepath:lower(), '.', { plain = true })
                            local extension = split_path[#split_path]
                            return vim.tbl_contains(image_extensions, extension)
                        end
                        if is_image(filepath) then
                            local term = vim.api.nvim_open_term(bufnr, {})
                            local function send_output(_, data, _)
                                for _, d in ipairs(data) do
                                    vim.api.nvim_chan_send(term, d .. '\r\n')
                                end
                            end
                            vim.fn.jobstart(
                                {
                                    'catimg', filepath -- Terminal image viewer command
                                },
                                { on_stdout = send_output, stdout_buffered = true, pty = true })
                        else
                            require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid,
                                "Binary cannot be previewed")
                        end
                    end
                },
            }
        }
    end,

    keys = {
        {
            "<leader>,",
            "<cmd>Telescope buffers show_all_buffers=true<cr>",
            desc = "Switch Buffer",
        },
        {
            "<leader>:",
            "<cmd>Telescope command_history<cr>",
            desc = "Command History",
        },

        -- find
        { "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "Buffers" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>",    desc = "Recent" },

        -- git
        { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
        { "<leader>gs", "<cmd>Telescope git_status<CR>",  desc = "status" },

        -- search
        { '<leader>s"', "<cmd>Telescope registers<cr>",   desc = "Registers" },
        {
            "<leader>sa",
            "<cmd>Telescope autocommands<cr>",
            desc = "Auto Commands",
        },
        { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
        {
            "<leader>sc",
            "<cmd>Telescope command_history<cr>",
            desc = "Command History",
        },
        { "<leader>sC", "<cmd>Telescope commands<cr>",                  desc = "Commands" },
        -- DISABLED FOR NVIM-POSSESSION KEYBIND
        -- {
        -- 	"<leader>sd",
        -- 	"<cmd>Telescope diagnostics bufnr=0<cr>",
        -- 	desc = "Document diagnostics",
        -- },
        {
            "<leader>sD",
            "<cmd>Telescope diagnostics<cr>",
            desc = "Workspace diagnostics",
        },
        { "<leader>sh", "<cmd>Telescope help_tags<cr>",   desc = "Help Pages" },
        {
            "<leader>sH",
            "<cmd>Telescope highlights<cr>",
            desc = "Search Highlight Groups",
        },
        { "<leader>sk", "<cmd>Telescope keymaps<cr>",     desc = "Key Maps" },
        { "<leader>sM", "<cmd>Telescope man_pages<cr>",   desc = "Man Pages" },
        { "<leader>sm", "<cmd>Telescope marks<cr>",       desc = "Jump to Mark" },
        { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
        { "<leader>sR", "<cmd>Telescope resume<cr>",      desc = "Resume" },
    },
    opts = {
        defaults = {
            -- Default configuration for telescope goes here:
            -- config_key = value,
            layout_config = {
                preview_cutoff = 120,
            },
            prompt_prefix = " ",
            selection_caret = " ",
            mappings = {
                i = {
                    ["<a-i>"] = function()
                        local action_state = require("telescope.actions.state")
                        local line = action_state.get_current_line()
                    end,
                    ["<a-h>"] = function()
                        local action_state = require("telescope.actions.state")
                        local line = action_state.get_current_line()
                    end,
                    ["<C-Down>"] = function(...)
                        return require("telescope.actions").cycle_history_next(...)
                    end,
                    ["<C-Up>"] = function(...)
                        return require("telescope.actions").cycle_history_prev(...)
                    end,
                    ["<C-f>"] = function(...)
                        return require("telescope.actions").preview_scrolling_down(...)
                    end,
                    ["<C-b>"] = function(...)
                        return require("telescope.actions").preview_scrolling_up(...)
                    end,
                },
                n = {
                    ["q"] = function(...)
                        return require("telescope.actions").close(...)
                    end,
                },
            },
        },
        preview = {
            filetypes = { 'png', 'jpg', 'jpeg', 'mp4', 'webm', 'pdf' },
        },
        pickers = {
            -- Default configuration for builtin pickers goes here:
            -- picker_name = {
            --   picker_config_key = value,
            --   ...
            -- }
            -- Now the picker_config_key will be applied every time you call this
            -- builtin picker
        },

        extensions = {
        },
    },
}
