vim.pack.add { 'https://github.com/vyfor/cord.nvim' }
require('cord').setup {
    display = {
        swap_icons = true,  -- editor icon becomes the large image, file icon the small one
        swap_fields = true, -- show the workspace name above the file name
    },
    buttons = {
        {
            label = 'My Repo',
            url = 'https://github.com/memmoxt',
        },
    },
    idle = {
        show_status = false, -- clear the presence instead of showing an idle status
    }
}
