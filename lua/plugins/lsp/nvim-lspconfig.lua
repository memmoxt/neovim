vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
})
-- list of configs at (https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md)

-- NOTE: Diagnostic Setup
-- Define sign icons for each severity
local signs = {
    [vim.diagnostic.severity.ERROR] = " ",
    [vim.diagnostic.severity.WARN] = " ",
    [vim.diagnostic.severity.HINT] = "󰠠 ",
    [vim.diagnostic.severity.INFO] = " ",
}

-- update diagnostic config function
vim.diagnostic.config({
    signs = { text = signs },
    virtual_text = true,
    underline = true, -- Always on
    update_in_insert = false,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
    },
})

-- <leader>lx toggle for virtual text (no hover changes)
vim.keymap.set('n', '<leader>lx', function()
    local current = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({
        virtual_text = not current, -- toggle true/false
    })
    vim.notify(
        "Diagnostics virtual text " .. (not current and "enabled" or "disabled"),
        vim.log.levels.INFO,
        { title = "Diagnostics" }
    )
end, { desc = "Toggle diagnostic virtual text" })

-- NOTE: Setup servers

-- Native LSP capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- blink cmp
local ok, blink = pcall(require, "blink.cmp")
if ok then
    capabilities = blink.get_lsp_capabilities(capabilities)
end

-- Global LSP settings (applied to all servers)
vim.lsp.config('*', {
    capabilities = capabilities
})

-- Configure and enable LSP servers
-- lua_ls
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "hl" },
            },
            completion = {
                callSnippet = "Replace",
            },
            -- workspace = {
            --     library = {
            --         [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            --         [vim.fn.stdpath("config") .. "/lua"] = true,
            --     },
            -- },
        },
    },
})

-- emmet_language_server
vim.lsp.config("emmet_language_server", {
    filetypes = {
        "css",
        "html",
        "javascript",
    },
    init_options = {
        includeLanguages = {},
        excludeLanguages = {},
        extensionsPath = {},
        preferences = {},
        showAbbreviationSuggestions = true,
        showExpandedAbbreviation = "always",
        showSuggestionsAsSnippets = false,
        syntaxProfiles = {},
        variables = {},
    },
})

-- emmet_ls
vim.lsp.config("emmet_ls", {
    filetypes = {
        "html",
        "css",
        "sass",
        "scss",
        "less",
        "svelte",
    },
})

-- ts_ls (TypeScript/JavaScript)
vim.lsp.config("ts_ls", {
    workspace_required = false,
    filetypes = {
        "javascript",
        "typescript",
    },
    single_file_support = true,
    init_options = {
        preferences = {
            includeCompletionsForModuleExports = true,
            includeCompletionsForImportStatements = true,
        },
    },
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayVariableTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
            },
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = "none",
                includeInlayVariableTypeHints = false,
                includeInlayFunctionParameterTypeHints = false,
            },
        },
    },
})


-- css
vim.lsp.config("cssls", {
    filetypes = { "css", "scss", "less" },
    init_options = { provideFormatter = true },
    single_file_support = true,
    settings = {
        css = {
            lint = {
                unknownAtRules = "ignore",
            },
            validate = true
        },
        scss = {
            lint = {
                unknownAtRules = "ignore"
            },
            validate = true
        },
        less = {
            lint = {
                unknownAtRules = "ignore"
            },
            validate = true
        },
    },
})

-- tailwind
vim.lsp.config("tailwindcss", {
    filetypes = {
        "html",
        "css",
        "javascript",
        "typescript",
        "svelte",
    },
    init_options = {
        userLanguages = {
            astro = "html",
        },
    },
})


-- rust
vim.lsp.config("rust_analyzer", {
    filetypes = { "rust" },
    settings = {
        ["rust-analyzer"] = {
            -- clippy is just better
            check = {
                command = "clippy",
            },
            -- off by default (very much needed)
            procMacro = {
                enable = true,
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
                allFeatures = true,
            },
        },
    },
})

-- Enable install lsp either locally or via mason
vim.lsp.enable({
    "lua_ls",
    "cssls",
    "emmet_language_server",
    "emmet_ls",
    "ts_ls",
    "tailwindcss",
})
