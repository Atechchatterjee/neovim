return {
  'ramojus/mellifluous.nvim',
  init = function()
    vim.cmd.colorscheme 'mellifluous'
  end,
  config = function()
    require('mellifluous').setup {
      dim_inactive = true,
      colorset = 'mountain',
      styles = { -- see :h attr-list for options. set {} for NONE, { option = true } for option
        main_keywords = {},
        other_keywords = {},
        types = {},
        operators = {},
        strings = {},
        functions = {},
        constants = {},
        comments = { italic = true },
        markup = {
          headings = { bold = true },
        },
        folds = {},
      },
      transparent_background = {
        enabled = true,
        floating_windows = true,
        telescope = true,
        file_tree = true,
        cursor_line = true,
        status_line = false,
      },
      flat_background = {
        line_numbers = false,
        floating_windows = false,
        file_tree = false,
        cursor_line_number = false,
      },
      plugins = {
        cmp = true,
        gitsigns = true,
        indent_blankline = true,
        nvim_tree = {
          enabled = true,
          show_root = false,
        },
        neo_tree = {
          enabled = true,
        },
        telescope = {
          enabled = true,
          nvchad_like = true,
        },
        startify = true,
      },
    }
  end,
}
