-- sets a keybind to toggle the 80 char column
vim.keymap.set('n', '<leader>ccl', function()
  if vim.o.colorcolumn == '0' then
    vim.cmd [[set colorcolumn=80]]
  else
    vim.cmd [[set colorcolumn=0]]
  end
end, { desc = 'Toggles 80 char column line' })
