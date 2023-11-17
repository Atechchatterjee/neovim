return {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

        'folke/neodev.nvim',
    },
}
