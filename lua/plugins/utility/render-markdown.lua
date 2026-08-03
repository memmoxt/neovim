vim.pack.add({
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" }
})

require('render-markdown').setup({
    completions = {
        -- Settings for blink.cmp completions source
        blink = { enabled = true },
        lsp = { enabled = true },
    },

    heading = {
        icons = { "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 ", "󰉯 ", "󰉰 " },
        signs = { "󰌕 " },
    },
})
