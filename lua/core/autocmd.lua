-- autocmd to highlight current line while yanking
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

-- autocmd to format on save
vim.api.nvim_create_autocmd("BufWrite", {
	pattern = { "*.c", "*.lua", "*.ts", ".tsx" },
	command = ":Format",
})
