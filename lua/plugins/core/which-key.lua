return {                -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VeryLazy', -- Sets the loading event to 'VimEnter'
    opts = {
        -- delay between pressing a key and opening which-key (milliseconds)
        -- this setting is independent of vim.opt.timeoutlen
        delay = 0,
        icons = {
            -- set icon mappings to true if you have a Nerd Font
            mappings = vim.g.have_nerd_font,
            -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
            -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
            keys = vim.g.have_nerd_font and {} or {
                Up = '<Up> ',
                Down = '<Down> ',
                Left = '<Left> ',
                Right = '<Right> ',
                C = '<C-…> ',
                M = '<M-…> ',
                D = '<D-…> ',
                S = '<S-…> ',
                CR = '<CR> ',
                Esc = '<Esc> ',
                ScrollWheelDown = '<ScrollWheelDown> ',
                ScrollWheelUp = '<ScrollWheelUp> ',
                NL = '<NL> ',
                BS = '<BS> ',
                Space = '<Space> ',
                Tab = '<Tab> ',
                F1 = '<F1>',
                F2 = '<F2>',
                F3 = '<F3>',
                F4 = '<F4>',
                F5 = '<F5>',
                F6 = '<F6>',
                F7 = '<F7>',
                F8 = '<F8>',
                F9 = '<F9>',
                F10 = '<F10>',
                F11 = '<F11>',
                F12 = '<F12>',
            },
        },

        -- Document existing key chains
        spec = {
            -- colors for icos available: "azure","blue","cyan","green","grey","orange","purple","red","yellow"
            { '<leader>b', group = '[B]uffer', icon = { icon = "", color = "orange" } },
            { '<leader>c', group = '[C]ode', mode = { 'n', 'x' }, icon = { icon = " ", color = "orange" } },
            { '<leader>d', group = '[D]atabase', icon = { icon = " ", color = "blue" } },
            { '<leader>f', group = '[F]ind', icon = { icon = "󰜼 ", color = "cyan" } },
            { '<leader>r', group = '[R]ename' },
            { '<leader>s', group = '[S]earch', icon = { icon = " ", color = "green" } },
            { '<leader>w', group = '[W]orkspace' , icon= {icon = " ",color ="azure"}},
            { '<leader>t', group = '[T]abs', icon = { icon = " ", color = "blue" } },
            { '<leader>g', group = '[G]it', icon = { icon = " ", color = "orange" } },
            { '<leader>u', group = '[U]I toggles' },
            { '<leader>x', group = 'Trouble', icon = { icon = "", color = "red" } },
            { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },

            -- Add your custom bindings here
            { 'z', group = 'Fold' },
            { '<leader>cc', '<cmd>lua vim.lsp.buf.format{ async = true }<cr>', desc = 'Format Code', icon = { icon = "󰝕", color = "blue" } },
            { '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<cr>', desc = 'Rename Reference', icon = { icon = "", color = "blue" } },
            { '<leader>uS', '<cmd>Screenkey<cr>', desc = 'Toggle Screenkey' },
            { '<leader>ww', '<cmd>WinShift<cr>', desc = 'Move window', icon = { icon = " ", color = "blue" } },
            { '<leader>T', '<cmd>ToggleTerm<cr>', desc = 'Open Terminal', icon = { icon = " ", color = "purple" } },
        },

    },
}
