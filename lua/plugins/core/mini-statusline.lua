vim.pack.add({
    { src = 'https://github.com/nvim-mini/mini.statusline', version = 'stable' },
    { src = 'https://github.com/nvim-mini/mini-git',        version = 'stable' },
    { src = 'https://github.com/nvim-mini/mini.diff',       version = 'stable' },
})

local statusline = require 'mini.statusline'

require('mini.statusline').setup(
    {
        -- Content of statusline as functions which return statusline string. See
        -- `:h statusline` and code of default contents (used instead of `nil`).
        content = {
            -- Content for active window
            active = function()
                local mode, mode_hl = statusline.section_mode({ trunc_width = nil })
                local git_branch    = statusline.section_git({ trunc_width = 75 })         -- Git branch
                local diff          = statusline.section_diff({ trunc_width = 75 })
                local diagnostics   = statusline.section_diagnostics({ trunc_width = 75 }) -- Diagnostics
                local filename      = statusline.section_filename({ trunc_width = 40 })
                local fileinfo      = statusline.section_fileinfo({ trunc_width = 20 })
                local location      = statusline.section_location({ trunc_width = 75 })

                -- Combine sections: mode -> git status -> diagnostics -> filename -> fileinfo -> location
                return statusline.combine_groups({
                    { hl = mode_hl,                 strings = { mode } },                          -- Mode first
                    { hl = 'MiniStatuslineDevinfo', strings = { git_branch, diff, diagnostics } }, -- Git and diagnostics next
                    '%<',                                                                          -- Truncation point
                    { hl = 'MiniStatuslineFilename', strings = { filename } },                     -- Filename
                    '%=',                                                                          -- Right-align what follows
                    { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },                     -- File info
                    { hl = mode_hl,                  strings = { location } },                     -- Location with mode highlight
                })
            end,

            -- Content for inactive window(s)
            inactive = function()
                return statusline.combine_groups({
                    { hl = 'MiniStatuslineInactive', strings = { statusline.section_filename({}) } },
                })
            end,
        },

        -- Whether to use icons by default
        use_icons = true,
    }
)

vim.api.nvim_set_hl(0, 'MiniStatuslineFileinfo', { bg = 'NONE' })

require('mini.git').setup()
require('mini.diff').setup()

------------------------------------------------
-- DISABLE when mini.starter buffer is open
-- --------------------------------------------
vim.api.nvim_create_autocmd({ 'FileType', 'User' }, {
    pattern = { 'ministarter', 'MiniStarterOpened' },
    callback = function()
        vim.b.ministatusline_disable = true
    end,
})


