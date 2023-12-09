return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "SmiteshP/nvim-navbuddy",
            dependencies = {
                "SmiteshP/nvim-navic",
                "MunifTanjim/nui.nvim"
            },
            opts = { lsp = { auto_attach = true } }
        }
    },
    keys = {
        {
            "<C-S-A-Y>",
            "<cmd>:Navbuddy<CR>",
            desc = "Navbuddy",
            mode = "n",
        },
    },
    opts = function()
        local navbuddy = require("nvim-navbuddy")
        local actions = require("nvim-navbuddy.actions")

        navbuddy.setup {
            window = {
                border = "solid", -- "rounded", "double", "solid", "none"
                -- or an array with eight chars building up the border in a clockwise fashion
                -- starting with the top-left corner. eg: { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }.
                size = { height = "25%", width = "100%" }, -- Or table format example: { height = "40%", width = "100%"}
                position = { row = "0%", col = "100%" },   -- Or table format example: { row = "100%", col = "0%"}
                scrolloff = nil,                           -- scrolloff value within navbuddy window
                sections = {
                    left = {
                        size = "15%",
                        border = { style = { " ", " ", " ", " ", " ", " ", " ", " " } }, -- You can set border style for each section individually as well.
                        -- border = {style = { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }},
                    },
                    mid = {
                        size = "30%",
                        border = { style = { " ", " ", " ", " ", " ", " ", " ", " " } },
                        -- border = {style = { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }},
                    },
                    right = {
                        -- No size option for right most section. It fills to
                        -- remaining area.
                        border = { " ", " ", " ", " ", " ", " ", " ", " " },
                        -- border = {style = { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }},
                        preview = "leaf", -- Right section can show previews too.
                        -- Options: "leaf", "always" or "never"
                    }
                },
            },
            node_markers = {
                enabled = true,
                icons = {
                    leaf = "  ",
                    leaf_selected = " → ",
                    branch = " ",
                },
            },
            icons = {
                File          = "󰈙 ",
                Module        = " ",
                Namespace     = "󰌗 ",
                Package       = " ",
                Class         = "󰌗 ",
                Method        = "󰆧 ",
                Property      = " ",
                Field         = " ",
                Constructor   = " ",
                Enum          = "󰕘",
                Interface     = "󰕘",
                Function      = "󰊕 ",
                Variable      = "󰆧 ",
                Constant      = "󰏿 ",
                String        = " ",
                Number        = "󰎠 ",
                Boolean       = "◩ ",
                Array         = "󰅪 ",
                Object        = "󰅩 ",
                Key           = "󰌋 ",
                Null          = "󰟢 ",
                EnumMember    = " ",
                Struct        = "󰌗 ",
                Event         = " ",
                Operator      = "󰆕 ",
                TypeParameter = "󰊄 ",
            },
            use_default_mappings = true, -- If set to false, only mappings set
            -- by user are set. Else default
            -- mappings are used for keys
            -- that are not set by user
            mappings = {
                ["<esc>"] = actions.close(), -- Close and cursor to original location
                ["q"] = actions.close(),

                ["<Down>"] = actions.next_sibling(),   -- down
                ["<Up>"] = actions.previous_sibling(), -- up

                ["<Left>"] = actions.parent(),         -- Move to left panel
                ["<Right>"] = actions.children(),      -- Move to right panel
                ["0"] = actions.root(),                -- Move to first panel

                ["v"] = actions.visual_name(),         -- Visual selection of name
                ["V"] = actions.visual_scope(),        -- Visual selection of scope

                ["y"] = actions.yank_name(),           -- Yank the name to system clipboard "+
                ["Y"] = actions.yank_scope(),          -- Yank the scope to system clipboard "+

                ["i"] = actions.insert_name(),         -- Insert at start of name
                ["I"] = actions.insert_scope(),        -- Insert at start of scope

                ["a"] = actions.append_name(),         -- Insert at end of name
                ["A"] = actions.append_scope(),        -- Insert at end of scope

                ["r"] = actions.rename(),              -- Rename currently focused symbol

                ["d"] = actions.delete(),              -- Delete scope

                ["f"] = actions.fold_create(),         -- Create fold of current scope
                ["F"] = actions.fold_delete(),         -- Delete fold of current scope

                ["c"] = actions.comment(),             -- Comment out current scope

                ["<enter>"] = actions.select(),        -- Goto selected symbol
                ["o"] = actions.select(),

                ["<C-Down>"] = actions.move_down(), -- Move focused node down
                ["<C-Up>"] = actions.move_up(),     -- Move focused node up

                ["s"] = actions.toggle_preview(),   -- Show preview of current node

                ["<C-v>"] = actions.vsplit(),       -- Open selected node in a vertical split
                ["<C-s>"] = actions.hsplit(),       -- Open selected node in a horizontal split

                ["t"] = actions.telescope({         -- Fuzzy finder at current level.
                    layout_config = {               -- All options that can be
                        height = 0.60,              -- passed to telescope.nvim's
                        width = 0.60,               -- default can be passed here.
                        prompt_position = "top",
                        preview_width = 0.50
                    },
                    layout_strategy = "horizontal"
                }),

                ["g?"] = actions.help(), -- Open mappings help window
            },
            lsp = {
                auto_attach = true, -- If set to true, you don't need to manually use attach function
                preference = nil,   -- list of lsp server names in order of preference
            },
            source_buffer = {
                follow_node = true, -- Keep the current node in focus on the source buffer
                highlight = true,   -- Highlight the currently focused node
                reorient = "smart", -- "smart", "top", "mid" or "none"
                scrolloff = nil     -- scrolloff value when navbuddy is open
            }
        }
    end,
}
