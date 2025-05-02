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
                    local git_branch    = statusline.section_git({ trunc_width = 75 }) -- Git branch
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

        -- Override the filename section to show path relative to Git root or CWD
        statusline.section_filename = function()
            local filepath = vim.fn.expand('%:p') -- Get the full path of the current file
            if filepath == '' then
                return ''                         -- Handle unnamed buffers
            end

            -- Check if the buffer is managed by oil.nvim
            if vim.startswith(filepath, 'oil://') then
                -- Extract the absolute path after 'oil://'
                local abs_path = filepath:sub(7) -- Remove 'oil://' prefix
                -- Split the path into components
                local path_parts = {}
                for part in abs_path:gmatch('[^/]+') do
                    table.insert(path_parts, part)
                end
                -- Get the last two components (current folder and its parent)
                local num_parts = #path_parts
                if num_parts >= 2 then
                    local short_path = path_parts[num_parts - 1] .. '/' .. path_parts[num_parts]
                    return 'Oil:~../' .. short_path .. '/'
                else
                    return 'Oil:~../' .. abs_path -- Fallback if path is too short
                end
            end

            -- Try to get the Git root directory
            local git_root = vim.fn.systemlist('git -C ' .. vim.fn.expand('%:p:h') .. ' rev-parse --show-toplevel')[1]
            if git_root and vim.v.shell_error == 0 then
                -- If Git root exists, show path relative to it
                local relative_to_git = vim.fn.fnamemodify(filepath, ':p')
                return relative_to_git:sub(#git_root + 2)
            else
                -- Fallback to relative path from current working directory
                return vim.fn.fnamemodify(filepath, ':.')
            end
        end

        -- Override the fileinfo section to show Arch icon + devicons filetype icon + filetype name
        ---@diagnostic disable-next-line: duplicate-set-field
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
