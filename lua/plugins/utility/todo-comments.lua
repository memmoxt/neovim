return {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },

    keys = {
        {
            "]t",
            function()
                require("todo-comments").jump_next()
            end,
            mode = "n",
            desc = "Next TODO comment",
        },

        {
            "[t",
            function()
                require("todo-comments").jump_prev()
            end,
            mode = "n",
            desc = "Previous TODO comment",
        },

        {
            "]T",
            function()
                require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } })
            end,
            mode = "n",
            desc = "Next error/warning todo comment",
        },
    },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below

        -- TODO:
        -- FIX:
        -- HACK:
        -- PERF:
        -- NOTE:
        -- WARN:
        -- TEST:

        keywords = {
            FIX = {
                icon = " ", -- icon used for the sign, and in search results
                color = "error", -- can be a hex color, or a named color (see below)
                alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                -- signs = false, -- configure signs for some keywords individually
            },

            TODO = { icon = " ", color = "info" },
            HACK = { icon = " ", color = "warning" },
            WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
            PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
            TEST = { icon = "󱈤 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },

            --** CUSTOM NOTES: **--
            ART = {icon = " ", color="hint"},
            CSS_ART = {icon="󰃣", color="hint"},
            KEYFRAMES = {icon="󰙮 ",color="warning", alt={"KEYFRAME"}},

            PART_1 = { icon = "󰎤 ", color = "hint" },
            PART_2 = { icon = "󰎧 ", color = "hint" },
            PART_3 = { icon = "󰎪 ", color = "hint" },
            PART_4 = { icon = "󰎭 ", color = "hint" },
            PART_5 = { icon = "󰎱 ", color = "hint" },

            SCRIPT = { icon = "󰅩 ", color = "warning" },
            JAVASCRIPT = {icon="󰌞", color = "warning" ,alt={"js_functions"}},
            TYPESCRIPT = {icon="󰛦", color = "info" , alt={"ts_functions"}},

            -- ** HTML NOTES ** --
            HTML = { icon = " ", color = "info", alt = {"HEADING","HERO"} },
            HEAD = { icon = "󰛼", color = "info", alt = {} },
            BODY = { icon = "󰛺", color = "info", alt = {} },
            FOOTER = { icon = "󰛻", color = "info", alt = {} },
            LAYOUT = { icon = "", color = "error", alt = { "FLEX", "FLEXBOX", "GRID", "GRIDBOX" } },
            BUTTON = {icon = "󱊨", color = "warning"}
        },
        gui_style = {
            fg = "NONE",       -- The gui style to use for the fg highlight group.
            bg = "BOLD",       -- The gui style to use for the bg highlight group.
        },
        merge_keywords = true, -- when true, custom keywords will be merged with the defaults
        -- highlighting of the line containing the todo comment
        -- * before: highlights before the keyword (typically comment characters)
        -- * keyword: highlights of the keyword
        -- * after: highlights after the keyword (todo text)
        highlight = {
            multiline = true,                -- enable multine todo comments
            multiline_pattern = "^.",        -- lua pattern to match the next multiline from the start of the matched keyword
            multiline_context = 10,          -- extra lines that will be re-evaluated when changing a line
            before = "",                     -- "fg" or "bg" or empty
            keyword = "wide",                -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
            after = "fg",                    -- "fg" or "bg" or empty
            pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
            comments_only = true,            -- uses treesitter to match keywords in comments only
            max_line_len = 400,              -- ignore lines longer than this
            exclude = {},                    -- list of file types to exclude highlighting
        },
        -- list of named colors where we try to extract the guifg from the
        -- list of highlight groups or use the hex color if hl not found as a fallback
        colors = {
            error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
            warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
            info = { "DiagnosticInfo", "#2563EB" },
            hint = { "DiagnosticHint", "#10B981" },
            default = { "Identifier", "#7C3AED" },
            test = { "Identifier", "#FF00FF" }
        },
        search = {
            command = "rg",
            args = {
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
            },
            -- regex that will be used to match keywords.
            -- don't replace the (KEYWORDS) placeholder
            pattern = [[\b(KEYWORDS):]], -- ripgrep regex
            -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
        },
    },
}
