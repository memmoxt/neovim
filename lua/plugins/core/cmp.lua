return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",           -- source for text in buffer
        "hrsh7th/cmp-path",             -- source for file system paths
        "L3MON4D3/LuaSnip",             -- snippet engine
        "saadparwaiz1/cmp_luasnip",     -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
        "hrsh7th/cmp-emoji",
        "js-everts/cmp-tailwind-colors",
    },
    config = function()
        local cmp = require("cmp")

        local luasnip = require("luasnip")


        -- load vs-code like snippets from plugins (e.g. friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()

        -- to change the color of the kind-icons
        -- vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#d5c4a1"})--this changes the Text icon

        -- Custom menu color:
        -- vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", italic = false, bold = false })

        --   פּ ﯟ   some other good icons
        local kind_icons = {
            Text = "",
            Method = "m",
            Function = "",
            Constructor = "",
            Field = "",
            Variable = "",
            Class = "",
            Interface = "",
            Module = "",
            Property = "",
            Unit = "",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = "",
            Tailwindcss = "󱏿",
            Emmet = "",
        }

        vim.opt.completeopt = "menu,menuone,noinsert"
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered({ border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' } }),
                -- documentation = cmp.config.window.bordered(),
                side_padding = 0,
                col_offset = -6,
            },
            mapping = cmp.mapping.preset.insert({
                ["<Down>"] = cmp.mapping.close(),
                ["<Up>"] = cmp.mapping.close(),
                ["<A-Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<A-Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                -- ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                -- ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<A-b>"] = cmp.mapping.scroll_docs(-4),
                ["<A-f>"] = cmp.mapping.scroll_docs(4),
                ["<A-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<A-e>"] = cmp.mapping.abort(),        -- close completion window
                ["<A-CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            -- sources for autocompletion
            sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- lsp
                { name = "luasnip" },  -- snippets
                { name = "buffer" },   -- text within current buffer
                { name = "path" },     -- file system paths
                { name = "emoji" },
            }),

            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, item)
                    -- Colored Icons for CMP with tailwindcss
                    if item.kind == "Color" then
                        item = require("cmp-tailwind-colors").format(entry, item)

                        if item.kind ~= "Color" then
                            item.menu = "    " .. kind_icons.Tailwindcss
                            return item
                        end
                    end

                    -- menu abbr width size
                    item.abbr = string.sub(item.abbr, 1, 50)
                    -- Kind icons
                    -- item.kind = string.format("%s", kind_icons[item.kind])
                    item.kind = string.format(kind_icons[item.kind], item.kind) -- This concatonates the icons with the name of the item kind
                    item.menu = ({
                        nvim_lsp = "[LSP]",
                        nvim_lua = "[NVIM_LUA]",
                        luasnip = "[Snippet]",
                        buffer = "[Buffer]",
                        path = "[Path]",
                    })[entry.source.name]


                    local cmp_item = entry:get_completion_item() --- @type lsp.CompletionItem

                    if entry.source.name == 'nvim_lsp' then
                        -- Display which LSP servers this item came from.
                        local lspserver_name = nil
                        pcall(function()
                            lspserver_name = entry.source.source.client.name

                            -- Define a table that maps lspserver_name values to their corresponding icons or menu items
                            local lsp_menu_mapping = {
                                ["tailwindcss"] = kind_icons.Tailwindcss,
                                ["emmet_ls"] = kind_icons.Emmet,
                                -- Add more mappings for other lspserver_name values as needed
                            }

                            -- Check if lspserver_name exists in the mapping table, and set item.menu accordingly
                            if lsp_menu_mapping[lspserver_name] then
                                item.menu = "    " .. lsp_menu_mapping[lspserver_name] .. " "
                            else
                                item.menu = lspserver_name
                            end
                        end)
                    end


                    return item
                end,
            },
        })
    end,
}
