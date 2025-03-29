return {
    "glepnir/nerdicons.nvim",
    cmd = "NerdIcons",
    event = "VeryLazy",
    keys = {
        { "<leader>zx", "<cmd>NerdIcons<CR>", desc = "NerdIcons Picker" },
    },
    opts = {
        border = "single", -- Border
        prompt = "󰨭 ", -- Prompt Icon
        preview_prompt = " ", -- Preview Prompt Icon
        width = 0.5, -- float window width
        down = "<A-Down>", -- Move down in preview
        up = "<A-Up>", -- Move up in preview
        copy = "<A-Enter>", -- Copy to the clipboard
    },
}
