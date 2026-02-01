return {
  'ThePrimeagen/harpoon',
  config = function()
    require('harpoon').setup()
    vim.keymap.set('n', '<leader>ha', '<cmd>:lua require("harpoon.mark").add_file()<CR>', { noremap = true })
    vim.keymap.set('n', '<leader>he', '<cmd>:lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true })
    vim.keymap.set('n', '<leader>hf', '<cmd>:Telescope harpoon marks<CR>', { noremap = true })
    vim.keymap.set('n', '<leader>h1', '<cmd>:lua require("harpoon.term").gotoTerminal(1)<CR>', { noremap = true })
    vim.keymap.set('n', '<leader>h2', '<cmd>:lua require("harpoon.term").gotoTerminal(2)<CR>', { noremap = true })
    vim.keymap.set('n', '<leader>h3', '<cmd>:lua require("harpoon.term").gotoTerminal(3)<CR>', { noremap = true })
    vim.keymap.set('n', '<leader>h4', '<cmd>:lua require("harpoon.term").gotoTerminal(4)<CR>', { noremap = true })
  end,
}
