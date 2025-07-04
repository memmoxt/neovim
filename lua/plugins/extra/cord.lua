return {
    'vyfor/cord.nvim',
    build = './build',
    event = 'VeryLazy',

    config = function()
        require('cord').setup({
            usercmds = true,             -- Enable user commands
            timer = {
                enable = true,           -- Enable automatically updating presence
                interval = 1500,         -- Interval between presence updates in milliseconds (min 500)
                reset_on_idle = false,   -- Reset start timestamp on idle
                reset_on_change = false, -- Reset start timestamp on presence change
            },
            editor = {
                image = nil,                          -- Image ID or URL in case a custom client id is provided
                client = 'neovim',                    -- vim, neovim, lunarvim, nvchad, astronvim or your application's client id
                tooltip = 'The Superior Text Editor', -- Text to display when hovering over the editor's image
            },
            display = {
                show_time = true,            -- Display start timestamp
                show_repository = true,      -- Display 'View repository' button linked to repository url, if any
                show_cursor_position = true, -- Display line and column number of cursor's position
                swap_fields = false,         -- If enabled, workspace is displayed first
                workspace_blacklist = {},    -- List of workspace names to hide
            },
            lsp = {
                show_problem_count = false, -- Display number of diagnostics problems
                severity = 1,               -- 1 = Error, 2 = Warning, 3 = Info, 4 = Hint
                scope = 'buffer',           -- buffer or workspace
            },
            idle = {
                show_idle = false, -- Enable idle status
                timeout = 300000, -- Timeout in milliseconds after which the idle status is set, 0 to display immediately
                disable_on_focus = true, -- Do not display idle status when neovim is focused
                text = 'Idle', -- Text to display when idle
                tooltip = '💤', -- Text to display when hovering over the idle image
            },
            text = {
                viewing = function(opts)
                    return string.format('Viewing %s - %s:%s', opts.filename, opts.cursor_line, opts.cursor_char)
                end,
                -- Text to display when viewing a readonly file
                editing = function(opts)
                    return string.format('Editing %s - %s:%s', opts.filename, opts.cursor_line, opts.cursor_char)
                end,
                file_browser = 'Browsing files in Oil.nvim', -- Text to display when browsing files (Empty string to disable)
                plugin_manager = 'Managing plugins in Lazy', -- Text to display when managing plugins (Empty string to disable)
                workspace = '',                              -- Text to display when in a workspace (Empty string to disable)
            },
            buttons = {
                {
                    label = 'View repository',          -- Text displayed on the button
                    url = 'https://github.com/memmoxt', -- URL where the button leads to ('git' = Git repository URL)
                },
                {
                    label = "View MemmoXT's Neovim repo",
                    url = 'https://github.com/memmoxt/neovim',
                }
            },
        })
    end,
}
