vim.pack.add({ 'https://github.com/saghen/blink.lib', 'https://github.com/saghen/blink.cmp' })
local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup(
    {
        signature = { enabled = true },
        appearance = {
            nerd_font_variant = 'mono',
            kind_icons = {
                Text = "󰊄 ",
                Method = "m ",
                Function = "󰡱 ",
                Constructor = " ",
                Field = " ",
                Variable = "󰎠 ",
                Class = " ",
                Interface = " ",
                Module = " ",
                Property = " ",
                Unit = "󰑭 ",
                Value = " ",
                Enum = " ",
                Keyword = " ",
                Snippet = " ",
                Color = " ",
                File = " ",
                Reference = " ",
                Folder = " ",
                EnumMember = " ",
                Constant = " ",
                Struct = " ",
                Event = " ",
                Operator = " ",
                TypeParameter = " ",
                Tailwindcss = "󱏿 ",
                Emmet = " ",
                Svelte = " ",
                CSS = " ",
                TypeScript = "󰛦 ",
                Lua = "󰢱 ",
            },
        },
        completion = {
            menu = {
                enabled = true,
                min_width = 15,
                max_height = 10,
                border = { '╭', '─', '┐', '│', '┘', '─', '╰', '│' },
                winblend = 0,
                winhighlight =
                'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
                scrolloff = 2,
                scrollbar = true,
                direction_priority = { 's', 'n' },
                auto_show = true,
                cmdline_position = function()
                    if vim.g.ui_cmdline_pos ~= nil then
                        local pos = vim.g.ui_cmdline_pos
                        return { pos[1] - 1, pos[2] }
                    end
                    local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
                    return { vim.o.lines - height, 0 }
                end,
                draw = {
                    align_to = 'label',
                    padding = 2,
                    gap = 1,
                    treesitter = { 'lsp' },
                    columns = {
                        { 'kind_icon' },
                        { 'label',    'label_description', gap = 1 },
                        { 'kind' },
                        { 'source_id' },
                    },
                    components = {
                        kind_icon = {
                            ellipsis = false,
                            text = function(ctx)
                                return ctx.kind_icon .. ctx.icon_gap
                            end,
                            highlight = function(ctx) return ctx.kind_hl end,

                        },
                        kind = {
                            ellipsis = false,
                            width = { fill = true },
                            text = function(ctx) return ctx.kind end,
                            highlight = function(ctx) return ctx.kind_hl end,
                        },
                        label = {
                            width = { fill = true, max = 60 },
                            text = function(ctx) return ctx.label .. ctx.label_detail end,
                            highlight = function(ctx)
                                local highlights = {
                                    { 0, #ctx.label, group = ctx.deprecated and 'BlinkCmpLabelDeprecated' or 'BlinkCmpLabel' },
                                }
                                if ctx.label_detail then
                                    table.insert(highlights,
                                        { #ctx.label, #ctx.label + #ctx.label_detail, group = 'BlinkCmpLabelDetail' })
                                end
                                for _, idx in ipairs(ctx.label_matched_indices) do
                                    table.insert(highlights, { idx, idx + 1, group = 'BlinkCmpLabelMatch' })
                                end
                                return highlights
                            end,
                        },
                        label_description = {
                            width = { max = 30 },
                            text = function(ctx) return ctx.label_description end,
                            highlight = 'BlinkCmpLabelDescription',
                        },
                        source_id = {
                            width = { max = 30 },
                            text = function(ctx)
                                -- Replace "snippets" with "luasnip"

                                if ctx.source_id == 'snippets' then
                                    return "[" .. "LuaSnip" .. "]"
                                end

                                -- -- If source is lsp, show filetype icon
                                -- if ctx.source_id == 'lsp' then
                                --     local filetype = vim.bo.filetype
                                --     local kind_icons = {
                                --         svelte = "  ",
                                --         typescript = " 󰛦 ",
                                --         lua = " 󰢱 ",
                                --         css = "  ",
                                --         javascript = " 󰌞 ",
                                --         html = " 󰌝 ",
                                --         python = " 󰌠 ",
                                --         -- Add more filetypes and their icons as needed
                                --     }
                                --     return kind_icons[filetype] or "lsp"
                                -- end

                                -- Return original source_id for other cases
                                return "[" .. ctx.source_id .. "]"
                            end,
                            highlight = 'BlinkCmpSource',
                        },
                    },
                },
            },
            documentation = {
                auto_show = false,
                auto_show_delay_ms = 500,
                update_delay_ms = 50,
                treesitter_highlighting = true,
                draw = function(opts) opts.default_implementation() end,
                window = {
                    min_width = 20,
                    max_width = 80,
                    max_height = 20,
                    border = 'single',
                    winblend = 0,
                    winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
                    scrollbar = true,
                    direction_priority = {
                        menu_north = { 'e', 'w', 'n', 's' },
                        menu_south = { 'e', 'w', 's', 'n' },
                    },
                },
            },
        },

        snippets = { preset = 'luasnip' },

        sources = {
            default = { 'snippets', 'lsp', 'path', 'buffer' },
            per_filetype = {
                sql = { 'dadbod', 'buffer' },
            },
            providers = {
                buffer = {
                    transform_items = function(ctx, items)
                        for _, item in ipairs(items) do
                            item.kind_icon = '📝'
                            item.kind_name = 'Text'
                        end
                        return items
                    end
                },
                dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
            }
        },
    })
