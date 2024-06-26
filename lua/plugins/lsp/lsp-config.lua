return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
        require("neodev").setup({
            -- add any options here, or leave empty to use the default settings
        })

        -- import lspconfig plugin
        local lspconfig = require("lspconfig")

        -- enable borders for lspconfig hover
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover, {
                -- Use a sharp border with `FloatBorder` highlights
                -- border = "single",
                border = "rounded",
                -- add the title in hover float window
                -- title = "hover"
            }
        )

        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- local navbuddy = require("nvim-navbuddy")


        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer

        local wk = require("which-key")
        wk.register({
            g = {
                D = "Declaration",
                d = "Definition",
                i = "Implementation",
                r = "References",
            },

            K = {
                name = "Buf.Hover"
            },

            ["["] = {
                name = "Previous",
                d = "Previous Diagnostic",
            },

            ["]"] = {
                name = "Next",
                d = "Next Diagnostic",
            },

            ["<C-k>"] = {
                name = "Signature Help",
            },

            ["<leader>"] = {
                c = {
                    name = "+Code",
                    a = "Code Action",
                    r = "Inlay Hint",
                },

                D = "Type Definition",


                r = {
                    name = "Rename",
                    n = " Rename all references under cursor ",
                },

                w = {
                    name = "+Workspace",
                    r = "Rename Workspace",
                    a = "Add to Workspace Folder",
                    l = "List Workspace Folders",
                },

            },
        })
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<leader>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
                -- Inlay Hint Toggle keymap
                if vim.lsp.inlay_hint then
                    vim.keymap.set('n', '<leader>cr',
                        function() vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled()) end)
                end
                vim.keymap.set('n', 'gr', function()
                    require("trouble").open("lsp_references")
                end, opts)
                vim.keymap.set('n', '<localleader>f', function()
                    vim.lsp.buf.format { async = true }
                end, opts)
            end,
        })

        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

        -- configure html server
        lspconfig["html"].setup({
            capabilities = capabilities,
        })

        -- configure typescript server with plugin
        lspconfig["tsserver"].setup({

            -- config for inlay_hint:
            -- https://github.com/typescript-language-server/typescript-language-server#inlay-hints-textdocumentinlayhint
            -- from Elijah video: https://www.youtube.com/watch?v=DYaTzkw3zqQ
            settings = {
                javascript = {
                    inlayHints = {
                        includeInlayEnumMemberValueHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayParameterNameHints = 'all',
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayVariableTypeHints = true,
                    },
                },
                typescript = {
                    inlayHints = {
                        includeInlayEnumMemberValueHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayParameterNameHints = 'all',
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayVariableTypeHints = true,
                    },
                },

            },
            capabilities = capabilities,
        })


        -- configure css server
        lspconfig["cssls"].setup({
            capabilities = capabilities,
            filetypes = { "css", "postcss" },
        })

        -- configure tailwindcss server
        lspconfig["tailwindcss"].setup({
            capabilities = capabilities,
            filetypes = { "svelte", "html", "typescript", "javascript", "markdown" },

            root_pattern =
            {
                'tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.mjs', 'tailwind.config.ts',
                'postcss.config.js', 'postcss.config.cjs', 'postcss.config.mjs', 'postcss.config.ts', 'package.json',
                'node_modules', '.git' },

            settings = {
                tailwindCSS = {
                    classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
                    lint = {
                        cssConflict = "warning",
                        invalidApply = "error",
                        invalidConfigPath = "error",
                        invalidScreen = "error",
                        invalidTailwindDirective = "error",
                        invalidVariant = "error",
                        recommendedVariantOrder = "warning"
                    },
                    validate = true
                }
            },
        })

        -- configure svelte server
        lspconfig["svelte"].setup({
            capabilities = capabilities,
        })

        -- configure prisma orm server
        lspconfig["prismals"].setup({
            capabilities = capabilities,
        })

        -- configure graphql language server
        lspconfig["graphql"].setup({
            capabilities = capabilities,
            filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        })

        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
            capabilities = capabilities,
            filetypes = { "htmldjango", "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less",
            },
        })

        -- configure python server
        lspconfig["pyright"].setup({
            settings = {
                pyright = {
                    autoImportCompletion = true,
                },
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = 'openFilesOnly',
                        useLibraryCodeForTypes = false,
                        typeCheckingMode = 'off', -- Disable type checking
                    },
                },
            },
            capabilities = {
                textDocument = {
                    publishDiagnostics = {
                        tagSupport = {
                            valueSet = { 2 },
                        },
                    },
                },
            },
        })

        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({

            capabilities = capabilities,
            settings = { -- custom settings for lua
                Lua = {
                    hint = { enable = true },
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                        checkThirdParty = false,
                    },
                },
            },
        })
    end,

}
