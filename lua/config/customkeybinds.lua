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

-- Ctrl + Left Click → Go to definition
vim.keymap.set('n', '<C-LeftMouse>', '<LeftMouse>gd', {
  remap = true,
  desc = 'Go to definition (reuse gd)',
})

vim.keymap.set({ 'n', 'v' }, '<C-f>', '<leader>/', {
  remap = true,
  desc = 'Ctrl+F → buffer fuzzy find',
})

vim.keymap.set({ 'n', 'v' }, '<C-S-f>', function()
  local builtin = require 'telescope.builtin'
  local themes = require 'telescope.themes'

  -- Yank visual selection into register z
  vim.cmd 'normal! "zy'

  local text = vim.fn.getreg 'z'
  text = text:gsub('\n', '') -- live_grep must be single-line

  builtin.live_grep(themes.get_dropdown {
    winblend = 15,
    previewer = true,
    default_text = text,
  })
end, { desc = 'Live grep' })
