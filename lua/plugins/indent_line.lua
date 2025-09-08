return {
  'lukas-reineke/indent-blankline.nvim',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help ibl`
  main = 'ibl',
  opts = {},
  config = function()
    local highlight = {
      'RainbowRed',
      'RainbowYellow',
      'RainbowBlue',
      'RainbowOrange',
      'RainbowGreen',
      'RainbowViolet',
      'RainbowCyan',
    }

    local hooks = require 'ibl.hooks'
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      local indent_color = '#212121'
      vim.api.nvim_set_hl(0, 'RainbowRed', { fg = indent_color })
      vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = indent_color })
      vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = indent_color })
      vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = indent_color })
      vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = indent_color })
      vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = indent_color })
      vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = indent_color })
    end)

    require('ibl').setup { indent = { highlight = highlight } }
  end,
}
