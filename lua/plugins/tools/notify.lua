return {
    "rcarriga/nvim-notify",
    config = function()
        local nvim_notify = require("notify")
        nvim_notify.setup {
            -- Animation style
            stages = "fade_in_slide_out",
            -- Default timeout for notifications
            timeout = 1500,
            background_colour = "#2E3440",
        }

        local banned_messages = { "No information available" }
        nvim_notify = function(msg, ...)
            for _, banned in ipairs(banned_messages) do
                if msg == banned then
                    return
                end
            end
            return require("notify")(msg, ...)
        end

        vim.notify = nvim_notify
    end,
}
