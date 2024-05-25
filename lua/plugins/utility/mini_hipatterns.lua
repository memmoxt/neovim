return {
    'echasnovski/mini.hipatterns',
    version = '*',
    opts = {
        highlighters = {
            fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
            hack  = { pattern = 'HACK', group = 'MiniHipatternsHack' },
            todo  = { pattern = 'TODO', group = 'MiniHipatternsTodo' },
            note  = { pattern = 'NOTE', group = 'MiniHipatternsNote' },

            part  = { pattern = 'PART', group = 'MiniHipatternsFixme' },
            art   = { pattern = 'ART', group = 'MiniHipatternsNote' }
        }
    }
}
