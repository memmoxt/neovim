return {
    'nanozuki/tabby.nvim',
    keys = {
        {
            "<leader>ta",
            "<cmd>$tabnew<CR>",
            mode = "n",
            desc = "New Tab",
            noremap = true,
        },
        {
            "<leader>tc",
            "<cmd>tabclose<CR>",
            mode = "n",
            desc = "Close Tab",
        },
        {
            "<leader>to",
            "<cmd>tabonly<CR>",
            mode = "n",
            desc = "Tab Only",
        },
        {
            "<leader>tn",
            "<cmd>tabn<CR>",
            mode = "n",
            desc = "Next Tab",
        },

        {
            "<leader>tp",
            "<cmd>tabp<CR>",
            mode = "n",
            desc = "Previous Tab",
        },
        {
            "<leader>tmp",
            "<cmd>-tabmove<CR>",
            mode = "n",
            desc = "Move Tab to previous position",
        },
        {
            "<leader>tmn",
            "<cmd>+tabmove<CR>",
            mode = "n",
            desc = "Move Tab to next position",
        },
    },
    init = function()
        local theme = {
            fill = 'TabLineFill',
            -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
            head = 'TabLine',
            current_tab = 'TabLineSel',
            tab = 'TabLine',
            win = 'TabLine',
            tail = 'TabLine',
        }
        require('tabby.tabline').set(function(line)
            return {
                {
                    { '  ', hl = theme.head },
                    line.sep('', theme.head, theme.fill),
                },
                line.tabs().foreach(function(tab)
                    local hl = tab.is_current() and theme.current_tab or theme.tab
                    return {
                        line.sep('', hl, theme.fill),
                        tab.is_current() and '' or '󰆣',
                        tab.number(),
                        tab.name(),
                        -- tab.close_btn(''),
                        line.sep('', hl, theme.fill),
                        hl = hl,
                        margin = ' ',
                    }
                end),
                line.spacer(),
                line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
                    return {
                        line.sep('', theme.win, theme.fill),
                        win.is_current() and '' or '',
                        win.buf_name(),
                        line.sep('', theme.win, theme.fill),
                        hl = theme.win,
                        margin = ' ',
                    }
                end),
                {
                    line.sep('', theme.tail, theme.fill),
                    { '  ', hl = theme.tail },
                },
                hl = theme.fill,
            }
        end)

    end,
}
