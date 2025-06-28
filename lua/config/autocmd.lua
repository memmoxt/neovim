-- Change indentation spaces for filetypes
vim.cmd [[
  filetype plugin indent on
  autocmd FileType html,javascript setlocal tabstop=2 shiftwidth=2 expandtab
]]

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]]

-- lua/lsp.lua
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        if client.server_capabilities.completionProvider then
            vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
        end
        -- ... your other lsp mappings
    end
})

-- -- Set filetype ren'py (*.rpy) as rpy
-- vim.cmd [[
--     autocmd BufRead,BufNewFile *.rpy set filetype=rpy
-- ]]

