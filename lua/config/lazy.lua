local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "plugins.colorschemes" },
    { import = "plugins.core" },
    { import = "plugins.extra" },
    { import = "plugins.git" },
    { import = "plugins.lsp" },
    { import = "plugins.tools" },
    { import = "plugins.utility" },

    change_detection = {
        notify = false,

        checker = {
            enabled = true,
            notify = false,
        },
    },
})
