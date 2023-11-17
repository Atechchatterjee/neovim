-- Telescope remaps
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fc', '<cmd>:Telescope colorscheme<CR>', {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.api.nvim_set_keymap(
	"n",
	"<space>b",
	":Telescope file_browser path=%:p:h select_buffer=true<CR>",
	{ noremap = true }
)

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- custom keybinds
vim.keymap.set('n', '<A-S-n>', '<cmd>:Telescope file_browser path=%:p:h select_buffer=true<CR>', { noremap = true })
vim.keymap.set('n', '<C-l>', '<cmd>:wincmd l<CR>', { noremap = true })
vim.keymap.set('n', '<C-h>', '<cmd>:wincmd h<CR>', { noremap = true })
vim.keymap.set('n', '<C-j>', '<cmd>:wincmd j<CR>', { noremap = true })
vim.keymap.set('n', '<C-k>', '<cmd>:wincmd k<CR>', { noremap = true })

-- harpoon keybinds
vim.keymap.set('n', '<leader>ha', '<cmd>:lua require("harpoon.mark").add_file()<CR>', { noremap = true })
vim.keymap.set('n', '<leader>he', '<cmd>:lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true })
vim.keymap.set('n', '<leader>hf', '<cmd>:Telescope harpoon marks<CR>', { noremap = true })
vim.keymap.set('n', '<leader>hf', '<cmd>:Telescope harpoon marks<CR>', { noremap = true })
vim.keymap.set('n', '<leader>h1', '<cmd>:lua require("harpoon.term").gotoTerminal(1)<CR>', { noremap = true })
vim.keymap.set('n', '<leader>h2', '<cmd>:lua require("harpoon.term").gotoTerminal(2)<CR>', { noremap = true })
vim.keymap.set('n', '<leader>h3', '<cmd>:lua require("harpoon.term").gotoTerminal(3)<CR>', { noremap = true })
vim.keymap.set('n', '<leader>h4', '<cmd>:lua require("harpoon.term").gotoTerminal(4)<CR>', { noremap = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
