return {
    'echasnovski/mini.statusline',
    version = false,
    dependencies = {
        'nvim-web-devicons',                                              -- Existing dependency
        { 'echasnovski/mini-git',  version = false, main = 'mini.git' },
        { 'echasnovski/mini.diff', version = false, main = 'mini.diff' }, -- Fixed typo and added main
    },
    config = function()
        local statusline = require 'mini.statusline'
        local devicons = require 'nvim-web-devicons'

        -- Set up mini.statusline with icons if Nerd Font is available
        statusline.setup {
            use_icons = vim.g.have_nerd_font,
            content = {
                active = function()
                    local mode, mode_hl = statusline.section_mode({ trunc_width = nil })
                    local git_branch    = statusline.section_git({ trunc_width = 75 })         -- Git branch
                    local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
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
                inactive = function()
                    return statusline.combine_groups({
                        { hl = 'MiniStatuslineInactive', strings = { statusline.section_filename({}) } },
                    })
                end,
            },
        }
        -- Override the cursor location section to show LINE:COLUMN (commented out in your code)
        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_location = function()
            return '%2l:%-2v'
        end

        -- Override the fileinfo section to show Arch icon + devicons filetype icon + filetype name
        statusline.section_fileinfo = function()
            local filetype = vim.bo.filetype
            if filetype == '' then
                filetype = 'text' -- Default for unnamed/no-filetype buffers
            end

            -- Get the icon and color for the current filetype from nvim-web-devicons
            local icon, _ = devicons.get_icon_by_filetype(filetype, { default = true })
            if not icon then
                icon = '󰈔' -- Fallback icon if no specific icon is found
            end
            -- return string.format('  %s %s', icon, filetype)
            return string.format(' %s %s', icon, filetype)
        end

        -- Set the MiniStatuslineFileinfo background to transparent
        vim.api.nvim_set_hl(0, 'MiniStatuslineFileinfo', { bg = 'NONE' })

        -- Initialize mini.git and mini.diff
        require('mini.git').setup()
        require('mini.diff').setup()
    end,
}
