vim.pack.add({
    { src = 'https://github.com/nvim-mini/mini.starter', version = 'stable' },
})
local starter = require('mini.starter')
starter.setup({
    evaluate_single = true,

    header = function()
        local art = [[

                      
                   
                
              
               
                    
                      
                   
                  
                    
                      
                          


]]
        local greeting = "Welcome back, Memmo."
        return art .. greeting
    end,

    items = nil,
    content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.indexing('all', { 'Builtin actions' }),
        starter.gen_hook.aligning('center', 'center'),
        starter.gen_hook.padding(0, 0),
    },
    footer = "\n           🇧🇷 @memmoxt [   󰗃      ]",
})

