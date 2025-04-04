return {
    'glacambre/firenvim',
    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = not vim.g.started_by_firenvim,
    build = function()
        vim.fn["firenvim#install"](0)
        vim.g.firenvim_config = {
            globalSettings = { alt = "all" },
            localSettings = {
                [".*"] = {
                    cmdline  = "neovim",
                    content  = "text",
                    priority = 0,
                    selector = "textarea",
                    takeover = "never"
                }
            }
        }
    end
}
