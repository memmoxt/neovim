return {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 1000,

    config = function()
        require("transparent").setup({ -- Optional, you don't have to run setup.
            groups = {                 -- table: default groups
                'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
                'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
                'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
                'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
                'EndOfBuffer',
            },
            extra_groups = {},   -- table: additional groups that should be cleared
            exclude_groups = {}, -- table: groups you don't want to clear
        })

        -- Define transparency to other plugins:
        -- require('transparent').clear_prefix('Navbuddy')
        require('transparent').clear_prefix('WhichKey')
        require('transparent').clear_prefix('lualine')
        require('transparent').clear_prefix('NvimTree')
        require('transparent').clear_prefix('BufferLine')
    end
}
