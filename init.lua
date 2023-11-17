vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- setting package path for local imports
package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvim/lua/?.lua"

local function import(file_names)
    for _, name in ipairs(file_names) do
        require(name)
    end
end

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    { import = "plugins" },
}, {})

import {
    "core.options",
    "core.keymaps",
    "core.autocmd",
    "config.telescope_config",
    "config.lualine_config",
    "config.nvim-treesitter_config",
    "config.lsp_config",
    "config.whichkey_config",
    "config.mason_config",
    "config.nvim-cmp_config",
    "config.lsp-format_config",
    "config.theme.gruvbox",
    "config.theme.nightfox",
    "config.theme.solarized-osaka"
}

vim.cmd("colorscheme solarized-osaka")
