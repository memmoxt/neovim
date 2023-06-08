use ({
  'projekt0n/github-nvim-theme',
  config = function()
    require('github-theme').setup({
      -- ...
    })

    vim.cmd('colorscheme github_dark')
  end
})
