return {
  'nvim-telescope/telescope-file-browser.nvim',
  config = function()
    vim.keymap.set('n', '<A-S-n>', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { noremap = true })
  end,
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
}
