return {
  {
    'rktjmp/lush.nvim',
  },
  {
    'NTBBloodbath/doom-one.nvim',
    config = function()
      -- Add color to cursor
      vim.g.doom_one_cursor_coloring = false
      -- Set :terminal colors
      vim.g.doom_one_terminal_colors = true
      -- Enable italic comments
      vim.g.doom_one_italic_comments = false
      -- Enable TS support
      vim.g.doom_one_enable_treesitter = true
      -- Color whole diagnostic text or only underline
      vim.g.doom_one_diagnostics_text_color = false
      -- Enable transparent background
      vim.g.doom_one_transparent_background = false

      -- Pumblend transparency
      vim.g.doom_one_pumblend_enable = false
      vim.g.doom_one_pumblend_transparency = 20

      -- Plugins integration
      vim.g.doom_one_plugin_neorg = true
      vim.g.doom_one_plugin_barbar = false
      vim.g.doom_one_plugin_telescope = false
      vim.g.doom_one_plugin_neogit = true
      vim.g.doom_one_plugin_nvim_tree = true
      vim.g.doom_one_plugin_dashboard = true
      vim.g.doom_one_plugin_startify = true
      vim.g.doom_one_plugin_whichkey = true
      vim.g.doom_one_plugin_indent_blankline = true
      vim.g.doom_one_plugin_vim_illuminate = true
      vim.g.doom_one_plugin_lspsaga = false
    end,
  },
  {
    'L-Colombo/oldschool.nvim',
    config = true,
    -- to ovverride palette colors:
    -- opts = { <color> = "<hex value>"}
    -- config = function()
    -- end,
  },
  {
    'savq/melange-nvim',
    config = function()
      -- vim.cmd.colorscheme 'melange'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function()
      require('catppuccin').setup {
        background = {
          dark = 'mocha',
        },
        float = {
          transparent = false,
          solid = false,
        },
        term_colors = true,
        dim_inactive = {
          enabled = true, -- dims the background color of inactive window
          shade = 'dark',
          percentage = 0.01, -- percentage of the shade to apply to the inactive window
        },
      }
      -- vim.cmd [[ colorscheme catppuccin-mocha ]]
    end,
  },
  {
    'nuvic/flexoki-nvim',
    name = 'flexoki',
    config = function()
      -- vim.cmd [[ colorscheme flexoki ]]
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    opts = {
      transparent_mode = true,
    },
  },
  {
    'sainnhe/gruvbox-material',
    config = function()
      -- vim.cmd [[colorscheme gruvbox-material]]
      -- vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]
    end,
  },
  {
    'ramojus/mellifluous.nvim',
    init = function()
      -- vim.cmd.colorscheme 'mellifluous'
    end,
    config = function()
      require('mellifluous').setup {
        dim_inactive = false,
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
          telescope = {
            enabled = true,
            nvchad_like = true,
          },
          startify = true,
        },
      }
      -- vim.cmd [[colorscheme mellifluous]]
      -- vim.api.nvim_create_autocmd('ColorScheme', {
      --   command = [[highlight CursorLine guibg=#2B2A2A cterm=underline]],
      -- })
      -- vim.api.nvim_create_autocmd('BufEnter', {
      --   command = [[highlight Visual cterm=NONE ctermbg=#424242  ctermfg=none]],
      -- })
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require('tokyonight').setup {
        style = 'night',
        dim_inactive = true,
        styles = {
          keywords = { italic = false },
        },
        transparent = true,
        on_colors = function() end,
        on_highlights = function(hl, c)
          local prompt = '#141923'
          hl.TelescopeNormal = {
            bg = prompt,
            fg = c.fg_dark,
          }
          hl.TelescopeBorder = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePromptNormal = {
            bg = prompt,
            fg = c.fg_dark,
          }
          hl.TelescopePromptBorder = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePromptTitle = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePreviewTitle = {
            bg = prompt,
            fg = c.bg_dark,
          }
          hl.TelescopeResultsTitle = {
            bg = prompt,
            fg = c.bg_dark,
          }
        end,
      }
      -- vim.cmd.colorscheme 'tokyonight'
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        variant = 'main', -- auto, main, moon, or dawn
        dark_variant = 'main', -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = false,

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = false,
          transparency = true,
        },

        -- groups = {
        --   border = 'muted',
        --   link = 'iris',
        --   panel = 'surface',
        --
        --   error = 'love',
        --   hint = 'iris',
        --   info = 'foam',
        --   note = 'pine',
        --   todo = 'rose',
        --   warn = 'gold',
        --
        --   git_add = 'foam',
        --   git_change = 'rose',
        --   git_delete = 'love',
        --   git_dirty = 'rose',
        --   git_ignore = 'muted',
        --   git_merge = 'iris',
        --   git_rename = 'pine',
        --   git_stage = 'iris',
        --   git_text = 'rose',
        --   git_untracked = 'subtle',
        --
        --   h1 = 'iris',
        --   h2 = 'foam',
        --   h3 = 'rose',
        --   h4 = 'gold',
        --   h5 = 'pine',
        --   h6 = 'foam',
        -- },

        palette = {},

        before_highlight = function(group, highlight, palette) end,
      }
      -- vim.api.nvim_create_autocmd('ColorScheme', {
      --   command = [[highlight CursorLine guibg=#141414 cterm=underline]],
      -- })
      -- vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#7C7C7C' })
      -- vim.api.nvim_set_hl(0, 'LineNr', { fg = '#ffffff' })
      -- vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#7C7C7C' })
      -- vim.cmd.colorscheme 'rose-pine-moon'
    end,
  },
  {
    'craftzdog/solarized-osaka.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require('solarized-osaka').setup {
        transparent = false,
        dim_inactive = true,
      }
      -- vim.cmd.colorscheme 'solarized-osaka'
    end,
  },
  -- {
  --   'Atechchatterjee/tejas.nvim',
  --   config = function()
  --     vim.cmd.colorscheme 'tejas'
  --   end,
  -- },
  {
    dir = '~/coding/tejas.nvim',
    config = function()
      vim.cmd.colorscheme 'tejas'
    end,
  },
  {
    dir = '~/coding/yugen-light.nvim',
    config = function()
      -- vim.cmd.colorscheme 'yugen-light'
    end,
  },
  {
    dir = '~/coding/neelam.nvim',
    config = function()
      -- vim.cmd.colorscheme 'neelam'
    end,
  },
  {
    'fenetikm/falcon',
  },
  {
    'steguiosaur/fullerene.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'fullerene'
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    opts = {
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = false },
      functionStyle = { bold = false },
      keywordStyle = { italic = false },
      statementStyle = { bold = false },
      typeStyle = {},
      transparent = true, -- do not set background color
      dimInactive = true, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = { -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function(colors) -- add/modify highlights
        return {}
      end,
      theme = 'dragon', -- Load "wave" theme when 'background' option is not set
      background = { -- map the value of 'background' option to a theme
        dark = 'dragon', -- try "dragon" !
        light = 'lotus',
      },
    },
    init = function()
      -- vim.cmd.colorscheme 'kanagawa'
    end,
  },
  {
    'HoNamDuong/hybrid.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
    init = function()
      -- vim.cmd.colorscheme 'hybrid'
    end,
  },
  {
    'metalelf0/jellybeans-nvim',
  },
  { 'dasupradyumna/midnight.nvim' },
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup {}

      -- vim.cmd 'colorscheme github_dark_default'
    end,
  },
  {
    'marko-cerovac/material.nvim',
    config = function()
      require('material').setup {

        contrast = {
          terminal = false, -- Enable contrast for the built-in terminal
          sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
          floating_windows = false, -- Enable contrast for floating windows
          cursor_line = false, -- Enable darker background for the cursor line
          lsp_virtual_text = false, -- Enable contrasted background for lsp virtual text
          non_current_windows = false, -- Enable contrasted background for non-current windows
          filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
        },

        styles = { -- Give comments style such as bold, italic, underline etc.
          comments = { --[[ italic = true ]]
          },
          strings = { --[[ bold = true ]]
          },
          keywords = { --[[ underline = true ]]
          },
          functions = { --[[ bold = true, undercurl = true ]]
          },
          variables = {},
          operators = {},
          types = {},
        },

        plugins = {},

        disable = {
          colored_cursor = false, -- Disable the colored cursor
          borders = false, -- Disable borders between vertically split windows
          background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
          term_colors = false, -- Prevent the theme from setting terminal colors
          eob_lines = false, -- Hide the end-of-buffer lines
        },

        high_visibility = {
          lighter = false, -- Enable higher contrast text for lighter style
          darker = false, -- Enable higher contrast text for darker style
        },

        lualine_style = 'default', -- Lualine style ( can be 'stealth' or 'default' )

        async_loading = true, -- Load parts of the theme asynchronously for faster startup (turned on by default)

        custom_colors = nil, -- If you want to override the default colors, set this to a function

        custom_highlights = {}, -- Overwrite highlights with your own
      }
    end,
  },
  {
    'navarasu/onedark.nvim',
    opts = {
      style = 'darker',
    },
    init = function()
      -- vim.cmd 'colorscheme onedark'
    end,
  },
  { 'bluz71/vim-nightfly-colors', name = 'nightfly', lazy = false, priority = 1000 },
  {
    'EdenEast/nightfox.nvim',
    config = function()
      -- Default options
      require('nightfox').setup {
        options = {
          -- Compiled file's destination location
          compile_path = vim.fn.stdpath 'cache' .. '/nightfox',
          compile_file_suffix = '_compiled', -- Compiled file suffix
          transparent = true, -- Disable setting background
          terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
          dim_inactive = false, -- Non focused panes set to alternative background
          module_default = true, -- Default enable value for modules
          colorblind = {
            enable = true, -- Enable colorblind support
            simulate_only = true, -- Only show simulated colorblind colors and not diff shifted
            severity = {
              protan = 0, -- Severity [0,1] for protan (red)
              deutan = 0, -- Severity [0,1] for deutan (green)
              tritan = 0, -- Severity [0,1] for tritan (blue)
            },
          },
          styles = { -- Style to be applied to different syntax groups
            comments = 'italic', -- Value is any valid attr-list value `:help attr-list`
            conditionals = 'NONE',
            constants = 'NONE',
            functions = 'NONE',
            keywords = 'NONE',
            numbers = 'NONE',
            operators = 'NONE',
            strings = 'NONE',
            types = 'NONE',
            variables = 'NONE',
          },
          inverse = { -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
          modules = { -- List of various plugins and additional options
            -- ...
          },
        },
        palettes = {},
        specs = {
          all = {
            syntax = {
              keywords = 'orange.bright',
              number = 'orange.bright',
            },
          },
        },
        groups = {},
      }

      -- setup must be called before loading
      -- vim.cmd 'colorscheme nightfox'
    end,
  },
  {
    'lunacookies/vim-substrata',
    opts = {
      transparent = true,
    },
    config = function() end,
  },
  {
    'cocopon/iceberg.vim',
    config = function()
      -- vim.cmd 'colorscheme iceberg'
    end,
  },
  {
    'oxfist/night-owl.nvim',
    config = function()
      -- vim.cmd 'colorscheme night-owl'
    end,
  },
  {
    'protesilaos/tempus-themes',
  },
}
