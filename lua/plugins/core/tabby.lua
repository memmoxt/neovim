vim.pack.add { "https://github.com/nanozuki/tabby.nvim" }

vim.keymap.set("n", "<leader>ta", "<cmd>$tabnew<cr>", { noremap = "true", desc = "New Tab" })
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Tab Only" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<cr>", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader>tmp", "<cmd>-tabmove<cr>", { desc = "Move Tab Previous Position" })
vim.keymap.set("n", "<leader>tmn", "<cmd>+tabmove<cr>", { desc = "Move Tab Next Position" })


local theme = {
    -- fill = 'TabLineFill',
    fill = { fg = '#f2e9de', bg = '#1e1e2e', style = 'italic' },
    head = 'TabLine',
    -- current_tab = 'TabLineSel',
    current_tab = { fg = '#f9e2af', bg = '#172554', style = 'italic' },
    tab = 'TabLine',
    win = 'TabLine',
    tail = 'TabLine',
}

require('tabby.tabline').set(function(line)
    return {
        {
            -- { '  ', hl = theme.head },
            { '   ', hl = theme.head },
            line.sep(' ', theme.head, theme.fill),
        },
        line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            return {
                line.sep('', theme.win, theme.fill),
                win.is_current() and ' ' or ' ',
                win.buf_name(),
                line.sep('', theme.win, theme.fill),
                hl = theme.win,
                margin = ' ',
            }
        end),
        line.spacer(),
        line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
                line.sep('', hl, theme.fill),
                tab.is_current() and ' ' or ' ',
                tab.number(),
                -- tab.name(),
                -- tab.close_btn(''),
                line.sep('', hl, theme.fill),
                hl = hl,
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
