require("lsp-format").setup {
    tab_width = function()
        return vim.opt.shiftwidth:get()
    end,
    typescript = {
        tab_width = function()
            return vim.opt.shiftwidth:get()
        end,
    },
    clangd = {
        tab_width = function()
            return vim.opt.shiftwidth:get()
        end,
    },
    yaml = { tab_width = 2 },
}

local lsp_format_on_attach = function(client, bufnr)
    require("lsp-format").on_attach(client, bufnr)
end
require("lspconfig").gopls.setup { on_attach = lsp_format_on_attach }
