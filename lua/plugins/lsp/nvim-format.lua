return {
    "lukas-reineke/lsp-format.nvim",
    dependencies = { 'creativenull/efmls-configs-nvim', },

    config = function()
        -- Ensure that efm-langserver is installed
        require("mason-lspconfig").setup({
            ensure_installed = {
                "elmls",
            },
        })

        -- LSP Format
        require("lsp-format").setup {
            typescript = {
                tab_width = function()
                    return vim.opt.shiftwidth:get()
                end,
            },
            yaml = { tab_width = 2 },
        }

        --https://github.com/mattn/efm-langserver
        --https://github.com/creativenull/efmls-configs-nvim/blob/main/doc/SUPPORTED_LIST.md

        local prettier = {
            formatCommand = [[prettier --stdin-filepath ${INPUT} ${--tab-width:tab_width}]],
            formatStdin = true,

        }
        -- local prettier = require('efmls-configs.formatters.prettier')

        -- local autopep8 = {
        --     formatCommand = [[autopep8 -]],
        --     formatStdin = true,
        -- }
        local autopep8 = require('efmls-configs.formatters.autopep8')
        -- local djlint = require('efmls-configs.linters.djlint')
        require("lspconfig").efm.setup {
            on_attach = require("lsp-format").on_attach,
            init_options = { documentFormatting = true },
            filetypes = { "python", "html", "htmldjango" },
            settings = {
                languages = {
                    typescript = { prettier },
                    javascript = { prettier },
                    yaml = { prettier },
                    html = { prettier },
                    -- htmldjango = { djlint },
                    python = { autopep8 },
                    lua = {
                        require('efmls-configs.formatters.stylua'),
                    },
                },
            },
        }
    end,
}
