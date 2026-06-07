vim.api.nvim_create_autocmd({ 'VimEnter', 'ColorScheme' }, {
  group = vim.api.nvim_create_augroup('CustomVisuals', {}),
  group = vim.api.nvim_create_augroup('CustomVisuals', {}),
  callback = function()
    if vim.g.colors_name == 'zenburn' then
      vim.api.nvim_set_hl(0, 'Visual', { bg = '#337A00', fg = '#000000', bold = false })
      vim.cmd [[hi Normal guibg=#181818 ctermbg=NONE]]
    end
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
