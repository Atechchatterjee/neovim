vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

-- -- Create a new autocommand group for diagnostics
-- local augroup = vim.api.nvim_create_augroup('RobotDiagnostics', {})
-- -- Define an autocommand to configure diagnostics for .robot files
-- vim.api.nvim_create_autocmd('FileType', {
--   group = augroup,
--   pattern = 'robot',
--   callback = function()
--     -- Set diagnostic options specifically for .robot files
--     vim.diagnostic.config {
--       virtual_text = false,
--       signs = false,
--       underline = false,
--     }
--   end,
-- })

vim.cmd [[set colorcolumn=0]]

vim.opt.mouse = 'a'

vim.opt.showmode = false

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250

vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.cursorline = false

vim.opt.scrolloff = 10

vim.wo.wrap = false

-- sets the vim cursor to underscore
-- vim.cmd [[set guicursor=i:hor20-Cursor]]

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  spec = {
    { import = 'plugins' },
  },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      init = '⚙',
      keys = '🗝',
      runtime = '💻',
    },
  },
})

require 'config.customkeybinds'

-- vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]
-- vim.cmd [[hi SignColumn guibg=#282727]]

-- sets the cursor color
vim.cmd [[hi Cursor guibg=#606060]]
-- vim.cmd [[hi CursorLine guibg=#141414]]

-- keybinds for todo-comments
vim.keymap.set('n', ']t', function()
  require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })

vim.keymap.set('n', '[t', function()
  require('todo-comments').jump_prev()
end, { desc = 'Previous todo comment' })

vim.keymap.set('n', '<leader>ft', function()
  vim.cmd [[TodoTelescope]]
end, { desc = 'Open list of todos in telescope' })

-- vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]
-- vim.cmd [[highlight Normal ctermfg=grey ctermbg=black]]

vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
vim.g.lazygit_floating_window_border_chars = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' } -- customize lazygit popup window border characters
vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed

vim.g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
vim.g.lazygit_config_file_path = '' -- custom config file path
-- OR
vim.g.lazygit_config_file_path = {} -- table of custom config file paths

vim.g.lazygit_on_exit_callback = nil -- optional function callback when exiting lazygit (useful for example to refresh some UI elements after lazy git has made some changes)

vim.api.nvim_set_hl(0, 'FloatBorder', {
  fg = '#6F6D3A',
  bg = 'none',
})

vim.api.nvim_set_hl(0, 'NormalFloat', {
  fg = '#CFCFCF', -- color200
  bg = '#121212', -- color800
})

vim.diagnostic.config {
  float = {
    border = 'rounded', -- or "single"
    source = 'if_many',
    header = '',
    prefix = '',
  },
}

vim.opt.fillchars = { vert = '│', horiz = '─', ... } -- Use unicode or other characters
vim.cmd 'hi VertSplit guifg=#3d3226 guibg=#111111'
vim.cmd 'hi WinSeparator guifg=#3d3226 guibg=#111111' -- For horizontal splits with laststatus=3
vim.opt.laststatus = 3 -- Optional: unified status line

-- vim.cmd.colorscheme 'parchment-candlelight'
-- require('parchment-candlelight').setup()
-- vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]
-- vim.opt.termguicolors = true
