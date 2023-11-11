"General Plugins
call plug#begin('~/.vim/plugged')

Plug 'honza/vim-sniPpets'
Plug 'https://github.com/vifm/vifm.vim.git'
Plug 'voldikss/vim-floaterm'
Plug 'https://github.com/skammer/vim-css-color.git'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'vimwiki/vimwiki'
Plug 'https://github.com/ap/vim-css-color.git'
" Plug 'https://github.com/tpope/vim-surround.git'
" Plug 'jiangmiao/auto-pairs'
Plug 'windwp/nvim-autopairs'
Plug 'mhartington/formatter.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mattn/emmet-vim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'https://github.com/terrortylor/nvim-comment'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'akinsho/bufferline.nvim'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'prisma/vim-prisma'

" Plug 'ianding1/leetcode.vim'

" Plug 'glepnir/dashboard-nvim'

"auto-close tag configured with treesitter
Plug 'windwp/nvim-ts-autotag'
Plug 'kyazdani42/nvim-tree.lua'

" makes nvim-completely transparent
Plug 'xiyaowong/nvim-transparent' 
Plug 'iamcco/markdown-preview.nvim'
Plug 'iamcco/markdown-preview.nvim'
Plug 'https://github.com/tpope/vim-fugitive.git'

" Lsp Related Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/nvim-cmp'
" Plug 'glepnir/lspsaga.nvim'
Plug 'folke/trouble.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'onsails/lspkind.nvim'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/harpoon'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'

" Theme Plugins
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Plug 'chase/focuspoint-vim'
" Plug 'projekt0n/github-nvim-theme'
" Plug 'tomasiser/vim-code-dark'
Plug 'ayu-theme/ayu-vim'
Plug 'https://github.com/rose-pine/neovim.git'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
" Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
Plug 'bluz71/vim-nightfly-guicolors'
" Plug 'https://github.com/w0ng/vim-hybrid.git'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'https://github.com/overcache/NeoSolarized.git'

" Plug 'tjdevries/colorbuddy.vim'
" Plug 'tjdevries/gruvbuddy.nvim'
" Plug 'Yagua/nebulous.nvim'
" Plug 'jordanbrauer/citylights.nvim'
" Plug 'https://github.com/jordanbrauer/citylights.nvim.git'
Plug 'navarasu/onedark.nvim'
Plug 'neanias/everforest-nvim', { 'branch': 'main' }
Plug 'rebelot/kanagawa.nvim'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
" Plug 'martinsione/darkplus.nvim'
Plug 'Mofiqul/vscode.nvim'
" Plug 'sainnhe/sonokai'
" Plug 'https://github.com/rebelot/kanagawa.nvim'
" Plug 'shaunsingh/oxocarbon.nvim', { 'do': './install.sh' }
" Plug 'olivercederborg/poimandres.nvim'
" Plug 'Julpikar/night-owl.nvim'
" Plug 'bluz71/vim-moonfly-colors', { 'branch': 'cterm-compat' }
Plug 'https://codeberg.org/Gaarco/semplice.nvim.git'
Plug 'shaunsingh/moonlight.nvim'
" Plug 'https://github.com/cocopon/iceberg.vim/'
" Plug 'haishanh/night-owl.vim'

call plug#end()

set guifont=Cascadia_Code:h15

" let g:nightflyWinSeparator = 0
" let g:nightflyNormalFloat = v:true

" set fillchars=horiz:━,horizup:┻,horizdown:┳,vert:┃,vertleft:┨,vertright:┣,verthoriz:╋

lua << EOF
  package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvim/config/?.lua"

  local function import(file_names)
    for _, name in ipairs(file_names) do
      require(name)
    end
  end

  import {
    "treesitter_config",
    "lsp_config",
    "telescope",
    "formatter_config",
    "lualine_config",
    "nvimtree_config",
    "trouble_config",
    "gitsigns_config",
    -- "bufferline_config",
    "cmp_config",
    "telescope_harpoon"
  }


  require("nvim-autopairs").setup {}

  -- require("lspsaga.codeaction")

  require("nvim_comment").setup({
    hook = function()
      require("ts_context_commentstring.internal").update_commentstring()
    end,
  })

   require("indent_blankline").setup {
     -- for example, context is off by default, use this to turn it on
     show_current_context = true,
     show_current_context_start = true,
   }

   require("lspsaga").setup({
     preview = {
       lines_above = 0,
       lines_below = 10,
     },
     scroll_preview = {
       scroll_down = "<C-f>",
       scroll_up = "<C-b>",
     },
     request_timeout = 2000,
   })
  -- saga.init_lsp_saga()

  require('material').setup({
    italics = {
      comments = true, 
      keywords = true,
      functions = true,
      strings = false,
      variables = false 
    },
    disable = {
      colored_cursor = false,
      background = false,
    },
    contrast = {
      sidebars = true,
      floating_windows = true,
      popup_menu = false,
      non_current_windows = false,
      line_numbers = false,
      cursor_line = false
    },
    plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        "dashboard",
        "gitsigns",
        "indent-blankline",
        "nvim-cmp",
        "nvim-tree",
        "nvim-web-devicons",
        "telescope",
        "trouble",
    },
    lualine_style="stealth"
  })

  vim.g.material_style = "deep ocean"

  require("onedark").setup {
    style = "deep"
  }

  -- require('dashboard').setup {}
  -- add icons to gutter for nvim-cmp diagnostics
  local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  require('nvim-ts-autotag').setup()
  require('everforest').setup({
    background = "hard"
  })

  require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
      strings = true,
      comments = true,
      operators = false,
      folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
  })
  vim.opt.showtabline = 0

  -- vim.cmd("autocmd Colorscheme * highlight NvimTreeNormal guibg=#0F0F0F guifg=#9da5b3")
EOF

let g:leetcode_browser="firefox"
let g:leetcode_solution_filetype="java"
let g:leetcode_solution_filetype="python"
let g:leetcode_solution_filetype="golang"

set background=dark

let BASE_DIR = "/home/anish/.config/nvim/"

set termguicolors

exec "source " BASE_DIR . "config/general_settings.vim"
exec "source " BASE_DIR . "config/keybindings.vim"

let g:nightflyWinSeparator = 0
let g:nightflyVirtualTextColor = v:false
set fillchars+=vert:'|'

colorscheme NeoSolarized
