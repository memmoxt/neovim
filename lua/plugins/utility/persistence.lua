vim.pack.add({
    { src = "https://github.com/folke/persistence.nvim", version = 'stable' },
})

require('persistence').setup({})

-- load the session for the current directory
vim.keymap.set("n", "<leader>fs", function() require("persistence").load() end, { desc = "Load Session CWD" })

-- select a session to load
vim.keymap.set("n", "<leader>fS", function() require("persistence").select() end, { desc = "Select Session to load" })

-- load the last session
vim.keymap.set("n", "<leader>fl", function() require("persistence").load({ last = true }) end,
    { desc = "Load last Session" })

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>fd", function() require("persistence").stop() end,
    { desc = "Session won't be saved on exit" })
