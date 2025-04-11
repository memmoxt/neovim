return {
    "L3MON4D3/LuaSnip", -- snippet engine
    -- Youtube tutorial: https://www.youtube.com/watch?v=FmHhonPjvvA
    config = function()
        -- set keybinds for both INSERT and VISUAL.
        vim.api.nvim_set_keymap("i", "<C-n>", "<Plug>luasnip-next-choice", {})
        vim.api.nvim_set_keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
        vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
        vim.api.nvim_set_keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", {})


        local ls = require "luasnip"
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node
        local extras = require("luasnip.extras")
        local rep = extras.rep

        -- Move to the next item within the snippet
        -- COMMAND => CTRL + e
        vim.keymap.set({ "i", "s" }, "<c-down>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { silent = true, desc = "Go to next item whithin the snippet" })

        -- Move to the previous item within the snippet
        -- COMMAND => CTRL + i
        vim.keymap.set({ "i", "s" }, "<c-up>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true, desc = "Go to previous item whithin the snippet" })

        -- Svelte/CSS snippets
        ls.add_snippets("svelte", {
            s("--script-ts", {
                t('<script lang="ts">'),
                t({ "", "\t" }), i(0),
                t({ "", "</script>" }),
            }),

            s("--style-scss", {
                t('<style lang="scss">'),
                t({ "", "\t" }),
                t('@import "$lib/tailwindColors";'),
                t({ "", "\t" }), i(0),
                t({ "", "</style>" }),
            }),

            -- CSS
            s("--all-border-sides", {
                t('border-top:'), t(" "), i(1, "size"), t(" "), i(2, "solid"), t(" "), i(3, "color"), t(";"),
                t({ "", "" }),
                t('border-right:'), t(" "), rep(1, "size"), t(" "), rep(2, "solid"), t(" "), rep(3, "color"), t(";"),
                t({ "", "" }),
                t('border-bottom:'), t(" "), rep(1, "size"), t(" "), rep(2, "solid"), t(" "), rep(3, "color"), t(";"),
                t({ "", "" }),
                t('border-left:'), t(" "), rep(1, "size"), t(" "), rep(2, "solid"), t(" "), rep(3, "color"), t(";"),
            }),

            --TAILWIND UTILITY

            -- stroke-color-500 stroke-[1px] fill-color
            s("--stroke&fill", {
                t('stroke-'), i(1, 'color'), t('-'), i(2, 'number'), t(' stroke-['), i(3, 'number '), t('px]'),
                t(' fill-'), i(4, 'color')
            }),

        })

        -- SVG
        ls.add_snippets("all", {

            -- <line x1="number" y1="number" x2="number" y2="number" class="stroke-color-number stroke-[1px]"> </line>
            s("--svg-line", {
                t('<line '),
                t('x1='), t('"'), i(1, "number"), t('" '),
                t('y1='), t('"'), i(2, "number"), t('" '),
                t('x2='), t('"'), i(3, "number"), t('" '),
                t('y2='), t('"'), i(4, "number"), t('" '),
                t('class='), t('"stroke-'), i(5, "color"), t('-'), i(6, 'number'), t(' '),
                t('stroke-['), i(7, '1'), t('px]"'), t('>'),
                t('</line>')
            }),

            -- <rect x="number" width="" height="" y="number" rx="0" ry="0" class="stroke-color-number"></rect>
            s("--svg-rect", {
                t('<rect '), t('x="'), i(1, 'number'), t('" y="'), i(2, 'number'),t('"'),
                t(' width="'), i(3, '0'), t('"'),
                t(' height="'), i(4, '0'), t('"'),
                t(' rx="'), i(5, '0'), t('"'),
                t(' ry="'), i(6, '0'), t('"'),
                t(' class="'), i(7, ''), t('"></rect>')
            }),

            -- <circle cx="50" cy="50" r="number" class=""></circle>
            s("--svg-circle", {
                t('<circle cx="'), i(1, '50'), t('" cy="'), i(2, '50'), t('" r="'), i(3, 'number'), t('" class="'),
                i(4, ''), t('"></circle>')
            }),

            -- <ellipse cx="50" cy="50" rx="number" ry="number" class=""></ellipse>
            s("--svg-ellipse", {
                t('<ellipse cx="'), i(1, '50'), t('" cy="'), i(2, '50'), t('" rx="'), i(3, 'number'), t('" ry="'),
                i(4, 'number'), t('" class="'), i(5, ''), t('"></ellipse>')
            }),

            -- <polygon points="" class=""></polygon>
            s("--svg-polygon", {
                t('<polygon points="'), i(1, ''), t('" class="'), i(2, ''), t('"></polygon>')
            }),

            -- <polyline points="" class=""></polyline>
            s("--svg-polyline", {
                t('<polyline points="'), i(1, ''), t('" class="'), i(2, ''), t('"></polyline>')
            }),

            -- <path d="" class=""></path>
            s("--svg-path", {
                t('<path d="'), i(1, ''), t('" class="'), i(2, ''), t('"></path>')
            }),

            -- <use xlink:href="#id_name" x="0" y="0" width="" height="" class=""></use>
            s("--svg-use", {
                t('<use xlink:href="#'), i(1, 'id_name'), t('" x="'), i(2, '0'), t('" y="'), i(3, '0'), t('"'),
                t(' width="'), i(4, ''), t('" height="'), i(5, ''), t('" class="'), i(6, ''), t('"></use>')
            })
        })

        -- Define a table with Tailwind color names and their hex values
        local tailwind_colors = {
            -- Slate shades
            ["slate-50"] = "#f8fafc",
            ["slate-100"] = "#f1f5f9",
            ["slate-200"] = "#e2e8f0",
            ["slate-300"] = "#cbd5e1",
            ["slate-400"] = "#94a3b8",
            ["slate-500"] = "#64748b",
            ["slate-600"] = "#475569",
            ["slate-700"] = "#334155",
            ["slate-800"] = "#1e293b",
            ["slate-900"] = "#0f172a",
            ["slate-950"] = "#020617",

            -- Gray shades
            ["gray-50"] = "#f9fafb",
            ["gray-100"] = "#f3f4f6",
            ["gray-200"] = "#e5e7eb",
            ["gray-300"] = "#d1d5db",
            ["gray-400"] = "#9ca3af",
            ["gray-500"] = "#6b7280",
            ["gray-600"] = "#4b5563",
            ["gray-700"] = "#374151",
            ["gray-800"] = "#1f2937",
            ["gray-900"] = "#111827",
            ["gray-950"] = "#030712",

            -- Zinc shades
            ["zinc-50"] = "#fafafa",
            ["zinc-100"] = "#f4f4f5",
            ["zinc-200"] = "#e4e4e7",
            ["zinc-300"] = "#d4d4d8",
            ["zinc-400"] = "#a1a1aa",
            ["zinc-500"] = "#71717a",
            ["zinc-600"] = "#52525b",
            ["zinc-700"] = "#3f3f46",
            ["zinc-800"] = "#27272a",
            ["zinc-900"] = "#18181b",
            ["zinc-950"] = "#09090b",

            -- Neutral shades
            ["neutral-50"] = "#fafafa",
            ["neutral-100"] = "#f5f5f5",
            ["neutral-200"] = "#e5e5e5",
            ["neutral-300"] = "#d4d4d4",
            ["neutral-400"] = "#a3a3a3",
            ["neutral-500"] = "#737373",
            ["neutral-600"] = "#525252",
            ["neutral-700"] = "#404040",
            ["neutral-800"] = "#262626",
            ["neutral-900"] = "#171717",
            ["neutral-950"] = "#0a0a0a",

            -- Stone shades
            ["stone-50"] = "#fafaf9",
            ["stone-100"] = "#f5f5f4",
            ["stone-200"] = "#e7e5e4",
            ["stone-300"] = "#d6d3d1",
            ["stone-400"] = "#a8a29e",
            ["stone-500"] = "#78716c",
            ["stone-600"] = "#57534e",
            ["stone-700"] = "#44403c",
            ["stone-800"] = "#292524",
            ["stone-900"] = "#1c1917",
            ["stone-950"] = "#0c0a09",

            -- Red shades
            ["red-50"] = "#fef2f2",
            ["red-100"] = "#fee2e2",
            ["red-200"] = "#fecaca",
            ["red-300"] = "#fca5a5",
            ["red-400"] = "#f87171",
            ["red-500"] = "#ef4444",
            ["red-600"] = "#dc2626",
            ["red-700"] = "#b91c1c",
            ["red-800"] = "#991b1b",
            ["red-900"] = "#7f1d1d",
            ["red-950"] = "#450a0a",

            -- Orange shades
            ["orange-50"] = "#fff7ed",
            ["orange-100"] = "#ffedd5",
            ["orange-200"] = "#fed7aa",
            ["orange-300"] = "#fdba74",
            ["orange-400"] = "#fb923c",
            ["orange-500"] = "#f97316",
            ["orange-600"] = "#ea580c",
            ["orange-700"] = "#c2410c",
            ["orange-800"] = "#9a3412",
            ["orange-900"] = "#7c2d12",
            ["orange-950"] = "#431407",

            -- Amber shades
            ["amber-50"] = "#fffbeb",
            ["amber-100"] = "#fef3c7",
            ["amber-200"] = "#fde68a",
            ["amber-300"] = "#fcd34d",
            ["amber-400"] = "#fbbf24",
            ["amber-500"] = "#f59e0b",
            ["amber-600"] = "#d97706",
            ["amber-700"] = "#b45309",
            ["amber-800"] = "#92400e",
            ["amber-900"] = "#78350f",
            ["amber-950"] = "#451a03",

            -- Yellow shades
            ["yellow-50"] = "#fefce8",
            ["yellow-100"] = "#fef9c3",
            ["yellow-200"] = "#fef08a",
            ["yellow-300"] = "#fde047",
            ["yellow-400"] = "#facc15",
            ["yellow-500"] = "#eab308",
            ["yellow-600"] = "#ca8a04",
            ["yellow-700"] = "#a16207",
            ["yellow-800"] = "#854d0e",
            ["yellow-900"] = "#713f12",
            ["yellow-950"] = "#422006",

            -- Lime shades
            ["lime-50"] = "#f7fee7",
            ["lime-100"] = "#ecfccb",
            ["lime-200"] = "#d9f99d",
            ["lime-300"] = "#bef264",
            ["lime-400"] = "#a3e635",
            ["lime-500"] = "#84cc16",
            ["lime-600"] = "#65a30d",
            ["lime-700"] = "#4d7c0f",
            ["lime-800"] = "#3f6212",
            ["lime-900"] = "#365314",
            ["lime-950"] = "#1a2e05",

            -- Green shades
            ["green-50"] = "#f0fdf4",
            ["green-100"] = "#dcfce7",
            ["green-200"] = "#bbf7d0",
            ["green-300"] = "#86efac",
            ["green-400"] = "#4ade80",
            ["green-500"] = "#22c55e",
            ["green-600"] = "#16a34a",
            ["green-700"] = "#15803d",
            ["green-800"] = "#166534",
            ["green-900"] = "#14532d",
            ["green-950"] = "#052e16",

            -- Emerald shades
            ["emerald-50"] = "#ecfdf5",
            ["emerald-100"] = "#d1fae5",
            ["emerald-200"] = "#a7f3d0",
            ["emerald-300"] = "#6ee7b7",
            ["emerald-400"] = "#34d399",
            ["emerald-500"] = "#10b981",
            ["emerald-600"] = "#059669",
            ["emerald-700"] = "#047857",
            ["emerald-800"] = "#065f46",
            ["emerald-900"] = "#064e3b",
            ["emerald-950"] = "#022c22",

            -- Teal shades
            ["teal-50"] = "#f0fdfa",
            ["teal-100"] = "#ccfbf1",
            ["teal-200"] = "#99f6e4",
            ["teal-300"] = "#5eead4",
            ["teal-400"] = "#2dd4bf",
            ["teal-500"] = "#14b8a6",
            ["teal-600"] = "#0d9488",
            ["teal-700"] = "#0f766e",
            ["teal-800"] = "#115e59",
            ["teal-900"] = "#134e4a",
            ["teal-950"] = "#042f2e",

            -- Cyan shades
            ["cyan-50"] = "#ecfeff",
            ["cyan-100"] = "#cffafe",
            ["cyan-200"] = "#a5f3fc",
            ["cyan-300"] = "#67e8f9",
            ["cyan-400"] = "#22d3ee",
            ["cyan-500"] = "#06b6d4",
            ["cyan-600"] = "#0891b2",
            ["cyan-700"] = "#0e7490",
            ["cyan-800"] = "#155e75",
            ["cyan-900"] = "#164e63",
            ["cyan-950"] = "#083344",

            -- Sky shades
            ["sky-50"] = "#f0f9ff",
            ["sky-100"] = "#e0f2fe",
            ["sky-200"] = "#bae6fd",
            ["sky-300"] = "#7dd3fc",
            ["sky-400"] = "#38bdf8",
            ["sky-500"] = "#0ea5e9",
            ["sky-600"] = "#0284c7",
            ["sky-700"] = "#0369a1",
            ["sky-800"] = "#075985",
            ["sky-900"] = "#0c4a6e",
            ["sky-950"] = "#082f49",

            -- Blue shades
            ["blue-50"] = "#eff6ff",
            ["blue-100"] = "#dbeafe",
            ["blue-200"] = "#bfdbfe",
            ["blue-300"] = "#93c5fd",
            ["blue-400"] = "#60a5fa",
            ["blue-500"] = "#3b82f6",
            ["blue-600"] = "#2563eb",
            ["blue-700"] = "#1d4ed8",
            ["blue-800"] = "#1e40af",
            ["blue-900"] = "#1e3a8a",
            ["blue-950"] = "#172554",

            -- Indigo shades
            ["indigo-50"] = "#eef2ff",
            ["indigo-100"] = "#e0e7ff",
            ["indigo-200"] = "#c7d2fe",
            ["indigo-300"] = "#a5b4fc",
            ["indigo-400"] = "#818cf8",
            ["indigo-500"] = "#6366f1",
            ["indigo-600"] = "#4f46e5",
            ["indigo-700"] = "#4338ca",
            ["indigo-800"] = "#3730a3",
            ["indigo-900"] = "#312e81",
            ["indigo-950"] = "#1e1b4b",

            -- Violet shades
            ["violet-50"] = "#f5f3ff",
            ["violet-100"] = "#ede9fe",
            ["violet-200"] = "#ddd6fe",
            ["violet-300"] = "#c4b5fd",
            ["violet-400"] = "#a78bfa",
            ["violet-500"] = "#8b5cf6",
            ["violet-600"] = "#7c3aed",
            ["violet-700"] = "#6d28d9",
            ["violet-800"] = "#5b21b6",
            ["violet-900"] = "#4c1d95",
            ["violet-950"] = "#2e1065",

            -- Purple shades
            ["purple-50"] = "#faf5ff",
            ["purple-100"] = "#f3e8ff",
            ["purple-200"] = "#e9d5ff",
            ["purple-300"] = "#d8b4fe",
            ["purple-400"] = "#c084fc",
            ["purple-500"] = "#a855f7",
            ["purple-600"] = "#9333ea",
            ["purple-700"] = "#7e22ce",
            ["purple-800"] = "#6b21a8",
            ["purple-900"] = "#581c87",
            ["purple-950"] = "#3b0764",

            -- Fuchsia shades
            ["fuchsia-50"] = "#fdf4ff",
            ["fuchsia-100"] = "#fae8ff",
            ["fuchsia-200"] = "#f5d0fe",
            ["fuchsia-300"] = "#f0abfc",
            ["fuchsia-400"] = "#e879f9",
            ["fuchsia-500"] = "#d946ef",
            ["fuchsia-600"] = "#c026d3",
            ["fuchsia-700"] = "#a21caf",
            ["fuchsia-800"] = "#86198f",
            ["fuchsia-900"] = "#701a75",
            ["fuchsia-950"] = "#4a044e",

            -- Pink shades
            ["pink-50"] = "#fdf2f8",
            ["pink-100"] = "#fce7f3",
            ["pink-200"] = "#fbcfe8",
            ["pink-300"] = "#f9a8d4",
            ["pink-400"] = "#f472b6",
            ["pink-500"] = "#ec4899",
            ["pink-600"] = "#db2777",
            ["pink-700"] = "#be185d",
            ["pink-800"] = "#9d174d",
            ["pink-900"] = "#831843",
            ["pink-950"] = "#500724",

            -- Rose shades
            ["rose-50"] = "#fff1f2",
            ["rose-100"] = "#ffe4e6",
            ["rose-200"] = "#fecdd3",
            ["rose-300"] = "#fda4af",
            ["rose-400"] = "#fb7185",
            ["rose-500"] = "#f43f5e",
            ["rose-600"] = "#e11d48",
            ["rose-700"] = "#be123c",
            ["rose-800"] = "#9f1239",
            ["rose-900"] = "#881337",
            ["rose-950"] = "#4c0519",

            -- In-between Colors
            ["slate-150"] = "#EAEFF5",
            ["slate-250"] = "#D7DFE9",
            ["slate-350"] = "#B0BCCD",
            ["slate-450"] = "#7C8CA2",
            ["slate-550"] = "#56657A",
            ["slate-650"] = "#3D4B5F",
            ["slate-750"] = "#293548",
            ["slate-850"] = "#172033",
            ["gray-150"] = "#ECEEF1",
            ["gray-250"] = "#DBDEE3",
            ["gray-350"] = "#B7BCC5",
            ["gray-450"] = "#848B98",
            ["gray-550"] = "#5B6472",
            ["gray-650"] = "#414B5A",
            ["gray-750"] = "#2B3544",
            ["gray-850"] = "#18212F",
            ["zinc-150"] = "#ECECEE",
            ["zinc-250"] = "#DCDCE0",
            ["zinc-350"] = "#BBBBC1",
            ["zinc-450"] = "#898992",
            ["zinc-550"] = "#62626B",
            ["zinc-650"] = "#494951",
            ["zinc-750"] = "#333338",
            ["zinc-850"] = "#202023",
            ["neutral-150"] = "#EDEDED",
            ["neutral-250"] = "#DDDDDD",
            ["neutral-350"] = "#BCBCBC",
            ["neutral-450"] = "#8B8B8B",
            ["neutral-550"] = "#636363",
            ["neutral-650"] = "#494949",
            ["neutral-750"] = "#333333",
            ["neutral-850"] = "#1F1F1F",
            ["stone-150"] = "#EEEDEC",
            ["stone-250"] = "#DFDCDB",
            ["stone-350"] = "#BFBBB8",
            ["stone-450"] = "#908A85",
            ["stone-550"] = "#68625D",
            ["stone-650"] = "#4E4A45",
            ["stone-750"] = "#373330",
            ["stone-850"] = "#231F1E",
            ["red-150"] = "#FED6D6",
            ["red-250"] = "#FDB8B8",
            ["red-350"] = "#FA8B8B",
            ["red-450"] = "#F66666",
            ["red-550"] = "#E63535",
            ["red-650"] = "#CB2121",
            ["red-750"] = "#A91C1C",
            ["red-850"] = "#8C1C1C",
            ["orange-150"] = "#FFE2C0",
            ["orange-250"] = "#FEC98F",
            ["orange-350"] = "#FCA658",
            ["orange-450"] = "#FA8329",
            ["orange-550"] = "#F26611",
            ["orange-650"] = "#D64D0C",
            ["orange-750"] = "#AE3B0F",
            ["orange-850"] = "#8B3112",
            ["amber-150"] = "#FEEDA9",
            ["amber-250"] = "#FDDD6C",
            ["amber-350"] = "#FCC939",
            ["amber-450"] = "#F8AF18",
            ["amber-550"] = "#E78B09",
            ["amber-650"] = "#C76508",
            ["amber-750"] = "#A34A0C",
            ["amber-850"] = "#853B0F",
            ["yellow-150"] = "#FEF5A7",
            ["yellow-250"] = "#FEE869",
            ["yellow-350"] = "#FCD62E",
            ["yellow-450"] = "#F2C00F",
            ["yellow-550"] = "#DA9F06",
            ["yellow-650"] = "#B67606",
            ["yellow-750"] = "#93580B",
            ["yellow-850"] = "#7B4610",
            ["lime-150"] = "#E3FBB4",
            ["lime-250"] = "#CCF681",
            ["lime-350"] = "#B1EC4D",
            ["lime-450"] = "#94D926",
            ["lime-550"] = "#75B812",
            ["lime-650"] = "#59900E",
            ["lime-750"] = "#466F11",
            ["lime-850"] = "#3B5B13",
            ["green-150"] = "#CCFADC",
            ["green-350"] = "#68E796",
            ["green-450"] = "#36D26F",
            ["green-550"] = "#1CB454",
            ["green-650"] = "#169244",
            ["green-750"] = "#167339",
            ["green-850"] = "#155C31",
            ["emerald-150"] = "#BCF7DB",
            ["emerald-250"] = "#8BEDC4",
            ["emerald-350"] = "#51DDA8",
            ["emerald-450"] = "#22C68D",
            ["emerald-550"] = "#0BA875",
            ["emerald-650"] = "#058760",
            ["emerald-750"] = "#056C4F",
            ["emerald-850"] = "#065741",
            ["teal-150"] = "#B3F9EB",
            ["teal-250"] = "#7CF0DC",
            ["teal-350"] = "#46DFCA",
            ["teal-450"] = "#21C6B3",
            ["teal-550"] = "#11A697",
            ["teal-650"] = "#0E857B",
            ["teal-750"] = "#106A64",
            ["teal-850"] = "#125652",
            ["cyan-150"] = "#BAF7FD",
            ["cyan-250"] = "#86EEFB",
            ["cyan-350"] = "#45DEF4",
            ["cyan-450"] = "#14C5E1",
            ["cyan-550"] = "#07A4C3",
            ["cyan-650"] = "#0B83A1",
            ["cyan-750"] = "#126983",
            ["cyan-850"] = "#16566C",
            ["sky-150"] = "#CDECFE",
            ["sky-250"] = "#9CDDFD",
            ["sky-350"] = "#5BC8FA",
            ["sky-450"] = "#23B1F1",
            ["sky-550"] = "#0895D8",
            ["sky-650"] = "#0377B4",
            ["sky-750"] = "#056193",
            ["sky-850"] = "#0A527A",
            ["blue-150"] = "#CDE3FE",
            ["blue-250"] = "#A9D0FE",
            ["blue-350"] = "#7AB5FC",
            ["blue-450"] = "#4E94F8",
            ["blue-550"] = "#3073F1",
            ["blue-650"] = "#2159E2",
            ["blue-750"] = "#1E47C4",
            ["blue-850"] = "#1E3D9D",
            ["indigo-150"] = "#D4DDFF",
            ["indigo-250"] = "#B6C3FD",
            ["indigo-350"] = "#93A0FA",
            ["indigo-450"] = "#7279F5",
            ["indigo-550"] = "#5956EB",
            ["indigo-650"] = "#493FD8",
            ["indigo-750"] = "#3D34B7",
            ["indigo-850"] = "#342F92",
            ["violet-150"] = "#E5E0FE",
            ["violet-250"] = "#D1C6FE",
            ["violet-350"] = "#B6A0FC",
            ["violet-450"] = "#9974F8",
            ["violet-550"] = "#7C4BF2",
            ["violet-650"] = "#6531E3",
            ["violet-750"] = "#5C25C8",
            ["violet-850"] = "#541FA6",
            ["purple-150"] = "#EEDFFF",
            ["purple-250"] = "#E1C5FF",
            ["purple-350"] = "#CC9CFD",
            ["purple-450"] = "#B46DFA",
            ["purple-550"] = "#9E44F1",
            ["purple-650"] = "#812BDC",
            ["purple-750"] = "#6D22BB",
            ["purple-850"] = "#621F98",
            ["fuchsia-150"] = "#F8DCFF",
            ["fuchsia-250"] = "#F3BEFD",
            ["fuchsia-350"] = "#EC92FB",
            ["fuchsia-450"] = "#E160F4",
            ["fuchsia-550"] = "#CD36E1",
            ["fuchsia-650"] = "#B121C1",
            ["fuchsia-750"] = "#941B9F",
            ["fuchsia-850"] = "#7B1A82",
            ["pink-150"] = "#FCDBEE",
            ["pink-250"] = "#FABCDE",
            ["pink-350"] = "#F78DC5",
            ["pink-450"] = "#F05DA8",
            ["pink-550"] = "#E43888",
            ["pink-650"] = "#CD206A",
            ["pink-750"] = "#AE1855",
            ["pink-850"] = "#901848",
            ["rose-150"] = "#FFD9DD",
            ["rose-250"] = "#FEB9C1",
            ["rose-350"] = "#FC8B9A",
            ["rose-450"] = "#F85872",
            ["rose-550"] = "#EB2E53",
            ["rose-650"] = "#D01842",
            ["rose-750"] = "#AF123B",
            ["rose-850"] = "#941338"
        }

        -- Create snippets for each color in the table
        for color_name, hex_value in pairs(tailwind_colors) do
            ls.add_snippets("all", {
                s("--" .. color_name, { t(hex_value) })
            })
        end
    end,
}
