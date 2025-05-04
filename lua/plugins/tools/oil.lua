return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

        require("oil").setup({
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
                natural_order = true,
                is_always_hidden = function(name, _)
                    return name == ".." or name == ".git"
                end,
            },
            win_options = {
                wrap = true,
            },
            use_default_keymaps = false,
            keymaps = {
                ["<leader>H"] = { "actions.select", opts = { horizontal = true } },
                ["<C-c>"] = false,
                ["q"] = "actions.close",
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-s>"] = false,
                ["<C-h>"] = false,
                ["<C-t>"] = { "actions.select", opts = { tab = true } },
                ["<C-p>"] = "actions.preview",
                ["<C-l>"] = "actions.refresh",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = { "actions.cd", opts = { scope = "tab" } },
                ["gs"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
                ["g\\"] = "actions.toggle_trash",
                -- ["yp"] = "actions.yank_entry",
                ["yp"] = {
                    desc = "Copy filepath to system clipboard",
                    callback = function()
                        require("oil.actions").yank_entry.callback()
                        vim.fn.setreg("+", vim.fn.getreg(vim.v.register))
                    end,
                },
            },
        })
    end,
}
