return {
    'akinsho/toggleterm.nvim',
    version = "*",
    event= "VeryLazy",
    init = function()
        require("toggleterm").setup {
            size = 100,
            hide_numbers = true,
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = false,
            persist_size = false,
            direction = "float",
            close_on_exit = false,
            shell = vim.o.shell,
            float_opts = {
                border = "single",
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
            autochdir = true,
            terminal_mappings = true,
            persist_mode = false,
            auto_scroll = true,
        }
    end
}
