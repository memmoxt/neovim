return {
    "goolord/alpha-nvim",
    init = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        local v = vim.version()
        local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch

        dashboard.section.header.val = {
            [[]],
            [[]],
            [[]],
            [[																						                          ]],
            [[																						                          ]],
            [[																						                          ]],
            [[         .%-                      .===.                                                                        ]],
            [[         %@@-                     =@@@-       +@@@@@@@@@@@@@@@@@+                                              ]],
            [[        %@@@@=                    =@@@-       -++++++*@@@#++++++-                                              ]],
            [[       %@@@@@@+                   =@@@-              :@@@-                                                     ]],
            [[     :@@@%.+@@@+       *%%%*#@@@- =@@@-  -#@@%=      :@@@-     *@@#.    .%@@*  +%%%=*%@@@@%#=      -*%@@@@@#+. ]],
            [[    :@@@%   +@@@#      #@@@@%+=-. =@@@--%@@@=        :@@@-      -@@@=  :@@@*   +@@@@+:   -#@@@:   #@@#:. .=%@@-]],
            [[   :@@@@. -:  -#@#     #@@@+      =@@@@@@@+          :@@@-       :@@@+:@@@=    +@@@-       #@@@. *@@@******#@@@]],
            [[  -@@@%. =@@%*-  --    #@@@:      =@@@@@@@@=         :@@@-        .#@@@@@-     +@@@-       #@@@. *@@@+=========]],
            [[ -@@@#    -*@@@@*-     #@@@:      =@@@+ :#@@%:       :@@@-          %@@@:      +@@@@*-...=%@@%:   *@@%+-:-+#=  ]],
            [[=@@@@#-      -*%@@%+:  #@@@:      =@@@:   =%@@+      :@@@-        .#@@%:       +@@@=+#%@@%#*-      :+#%@@@%#+. ]],
            [[                                                                 .%@@#         +@@@.                           ]],
            [[                                                                .%@@#          +@@@.                           ]],
            [[																						                          ]],
            [[									[] memmoxt 		| 		[󰗃] arktype				                          ]],
            [[																						                          ]],
            [[																						                          ]],
            [[																						                          ]],
        }

        dashboard.section.buttons.val = {
            dashboard.button("e", "  New File    ", ":enew<CR>"),
            dashboard.button("f", "  Find File   ", ":Telescope find_files<CR>"),
            dashboard.button("r", "  Find Text   ", ":Telescope live_grep<CR>"),
            dashboard.button("c", "  NVIM Config ", ":edit ~/.config/nvim/lua/config/lazy.lua<CR>"),
            dashboard.button("t", "  Telescope ", ":Telescope<CR>"),
            dashboard.button("q", "  Quit        ", ":qa<CR>"),
        }

        dashboard.section.footer.val = {
            version,
        }

        alpha.setup(dashboard.opts)
    end,
}
