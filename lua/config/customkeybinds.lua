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

vim.keymap.set({ 'v' }, 'p', '"_dP', { desc = 'Paste without yanking' })

vim.keymap.set('n', '<A-Tab>', ':tabnext<CR>', { noremap = true })
vim.keymap.set('i', '<A-Tab>', '<ESC>:tabnext<CR>i', { noremap = true })
vim.keymap.set('n', '<A-S-Tab>', ':tabprevious<CR>', { noremap = true })
vim.keymap.set('i', '<A-S-Tab>', '<ESC>:tabprevious<CR>i', { noremap = true })

-- Directory picker that opens in a small bottom buffer and navigates with Oil
local function open_dir_picker(dirs)
  -- Create a scratch buffer
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, dirs)
  vim.bo[buf].modifiable = false
  vim.bo[buf].buftype = 'nofile'
  vim.bo[buf].filetype = 'dirpicker'

  -- Open a small horizontal split at the bottom
  local height = math.min(#dirs, 10)
  vim.cmd('botright ' .. height .. 'split')
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(win, buf)

  -- Window options
  vim.wo[win].number = false
  vim.wo[win].relativenumber = false
  vim.wo[win].signcolumn = 'no'
  vim.wo[win].wrap = false
  vim.wo[win].cursorline = true

  -- <Enter> to pick a directory and open in Oil
  vim.keymap.set('n', '<CR>', function()
    local line = vim.api.nvim_get_current_line()
    local path = line:match '^%s*(.-)%s*$' -- trim whitespace
    vim.api.nvim_win_close(win, true)
    vim.cmd('Oil ' .. vim.fn.fnameescape(path))
  end, { buffer = buf, noremap = true, silent = true })

  -- <Esc> or q to close without picking
  for _, key in ipairs { '<Esc>', 'q' } do
    vim.keymap.set('n', key, function()
      vim.api.nvim_win_close(win, true)
    end, { buffer = buf, noremap = true, silent = true })
  end
end

-- Example list of directories — replace or generate this dynamically
local my_dirs = {
  '~/coding/',
  '~/.config/',
  '~/.config/nvim/',
}

-- Bind to a keybind of your choice, e.g. <leader>fd
vim.keymap.set('n', '<leader>fd', function()
  open_dir_picker(my_dirs)
end, { desc = 'Open directory picker' })
