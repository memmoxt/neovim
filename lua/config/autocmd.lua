-- Change indentation spaces for filetypes
vim.cmd [[
  filetype plugin indent on

  autocmd FileType html,javascript setlocal tabstop=2 shiftwidth=2 expandtab
]]

