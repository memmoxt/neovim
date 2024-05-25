-- Change indentation spaces for filetypes
vim.cmd [[
  filetype plugin indent on

  autocmd FileType html,javascript setlocal tabstop=2 shiftwidth=2 expandtab
]]

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]]

