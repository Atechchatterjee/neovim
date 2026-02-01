-- sets a keybind to toggle the 80 char column
vim.keymap.set('n', '<leader>ccl', function()
  if vim.o.colorcolumn == '0' then
    vim.cmd [[set colorcolumn=80]]
  else
    vim.cmd [[set colorcolumn=0]]
  end
end, { desc = 'Toggles 80 char column line' })

vim.keymap.set('n', '<ctrl>f', function()
  if vim.o.colorcolumn == '0' then
    vim.cmd [[set colorcolumn=80]]
  else
    vim.cmd [[set colorcolumn=0]]
  end
end, { desc = 'Toggles 80 char column line' })

vim.keymap.set('n', '<leader>gg', function()
  vim.cmd [[:LazyGit]]
end)

vim.keymap.set('n', '<leader>*', function()
  vim.opt.hlsearch = true
  vim.cmd 'normal! *N'
end, { desc = 'Highlight word under cursor' })
