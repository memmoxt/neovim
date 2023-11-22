return {
    "goolord/alpha-nvim",
    init = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        local v = vim.version()
        local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch

        dashboard.section.header.val = {
[[]],
[[              oo                                oooo                                                                                                    ]],
[[             oooo                              oooooo           ooooooooooooooooooooooooo                                                               ]],
[[            oooooo                             oooooo           ooooooooooooooooooooooooo                                                               ]],
[[           oooooooo                            oooooo           ooooooooooooooooooooooooo                                                               ]],
[[          oooooooooo                           oooooo                    oooooo                                                                         ]],
[[         oooooooooooo           ooooo    oooo  oooooo       oooooo       oooooo       ooooo          ooooo            ooooo                 ooooo       ]],
[[        ooooooo oooooo          oooooo oooooo  oooooo    oooooooo        oooooo       oooooo        oooooo   ooooo oooooooooooo         ooooooooooooo   ]],
[[       ooooooo   oooooo         ooooooooooooo  oooooo   ooooooo          oooooo        ooooooo     oooooo    oooooooooo ooooooooo     ooooooooooooooooo ]],
[[      ooooooo     oooooo        oooooooo       oooooo ooooooo            oooooo          oooooo  ooooooo     ooooooo       ooooooo   oooooo       oooooo]],
[[     ooooooo   oo    oooo       oooooo         oooooooooooo              oooooo           oooooooooooo       ooooo           oooooo  ooooooooooooooooooo]],
[[    ooooooo   ooooo    ooo      oooooo         ooooooooooooo             oooooo            oooooooooo        ooooo           oooooo  ooooooooooooooooooo]],
[[   ooooooo   ooooooooo    o     oooooo         oooooooooooooo            oooooo             oooooooo         oooooo         oooooo   oooooo             ]],
[[  ooooooo      oooooooooo       oooooo         ooooooo  ooooooo          oooooo              oooooo          ooooooooo    ooooooo     oooooo      ooo   ]],
[[ oooooooo         ooooooooo     oooooo         oooooo     oooooo         oooooo             oooooo           oooooooooooooooooo         oooooooooooooo  ]],
[[ooooooooooo          ooooooooo  oooooo         oooooo      ooooooo       oooooo            oooooo            ooooo   oooooooo             oooooooooo    ]],
[[                                                                                          oooooo             ooooo                                      ]],
[[                                                                                         oooooo              ooooo                                      ]],
[[                                                                                        oooooo               ooooo                                      ]],
[[                                                                                                                                                        ]],
[[                                                                                                                                                        ]],
[[            																						                                                      ]],
[[            									          [] memmoxt        |    	  [󰗃] arktype				                                          ]],
[[            																						                                                      ]],
[[            																						                                                      ]],
[[            																						                                                      ]],
        }

        dashboard.section.buttons.val = {
            dashboard.button("e", "  New File    ", "<cmd>enew<CR>"),
            dashboard.button("f", "  Find File   ", "<cmd>Telescope find_files<CR>"),
            dashboard.button("r", "  Find Text   ", "<cmd>Telescope live_grep<CR>"),
            dashboard.button("c", "  NVIM Config ", "<cmd>edit ~/.config/nvim/lua/config/lazy.lua<CR>"),
            dashboard.button("t", "  Telescope ", "<cmd>Telescope<CR>"),
            dashboard.button("l", "  Last Session ", "<cmd>lua require('persistence').load({last = true})<cr>"),
            dashboard.button("q", "  Quit        ", "<cmd>qa<CR>"),
        }

        dashboard.section.footer.val = {
            version,
        }

        alpha.setup(dashboard.opts)
    end,
}
