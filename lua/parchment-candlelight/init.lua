-- Parchment Candlelight - A warm color scheme with rich orange tones
-- Maintainer: Claude
-- License: MIT

local M = {}

M.colors = {
  -- Background colors
  bg0 = '#1a1410',
  bg1 = '#1f1812',
  bg2 = '#2d2419',
  bg3 = '#3d3226',
  bg4 = '#4d3a26',
  bg5 = '#5d4a36',

  -- Foreground colors
  fg0 = '#c0aa86',
  fg1 = '#d0ba96',
  fg2 = '#8a7a5f',
  fg3 = '#7a6a5a',
  fg4 = '#6a5a4f',
  fg5 = '#5a4a3a',
  fg6 = '#4a3a2f',

  -- Orange spectrum (10 shades)
  orange1 = '#d89a72', -- Deep orange - constants, booleans, numbers
  orange2 = '#d8a572', -- Medium orange - labels
  orange3 = '#d8a872', -- Warm orange - keywords, operators, tags
  orange4 = '#e8b882', -- Light orange - special punctuation
  orange5 = '#e8ca82', -- Golden orange - types, properties, constructors
  orange6 = '#f5db92', -- Bright orange - functions, titles
  orange7 = '#c8a882', -- Soft orange - special strings
  orange8 = '#b8a88a', -- Tan orange - regular strings
  orange9 = '#a89878', -- Subtle orange - icons, brackets
  orange10 = '#9a8a6f', -- Muted orange - punctuation

  -- Additional colors
  blue = '#8aa8c8',
  purple = '#c89ab8',
  cyan = '#8ac8b8',
  green = '#b8a882',

  -- Status colors
  error = '#d89a72',
  warning = '#e8ca82',
  info = '#8aa8c8',
  hint = '#9a8a6f',
  success = '#c8b882',
}

M.setup = function()
  vim.cmd 'hi clear'
  if vim.fn.exists 'syntax_on' then
    vim.cmd 'syntax reset'
  end

  vim.o.background = 'dark'
  vim.g.colors_name = 'parchment-candlelight'

  local c = M.colors
  local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- ====================
  -- UI Colors
  -- ====================

  -- Editor colors
  hl('Normal', { fg = c.fg0, bg = c.bg1 })
  hl('NormalFloat', { fg = c.fg0, bg = c.bg0 })
  hl('NormalNC', { fg = c.fg0, bg = c.bg0 })

  -- Cursor
  hl('Cursor', { fg = c.bg1, bg = c.fg0 })
  hl('CursorLine', { bg = c.bg2 })
  hl('CursorLineNr', { fg = c.orange9, bg = c.bg1 })
  hl('CursorColumn', { bg = c.bg2 })

  -- Line numbers
  hl('LineNr', { fg = c.fg5, bg = c.bg1 })
  hl('SignColumn', { fg = c.fg5, bg = c.bg1 })

  -- Selection
  hl('Visual', { fg = c.orange6, bg = c.bg4 })
  hl('VisualNOS', { fg = c.orange6, bg = c.bg4 })

  -- Search
  hl('Search', { fg = c.bg1, bg = c.orange5 })
  hl('IncSearch', { fg = c.bg1, bg = c.orange6, bold = true })
  hl('CurSearch', { fg = c.bg1, bg = c.orange6, bold = true })
  hl('Substitute', { fg = c.bg1, bg = c.orange5 })

  -- UI Elements
  hl('StatusLine', { fg = c.fg0, bg = c.bg2 })
  hl('StatusLineNC', { fg = c.fg2, bg = c.bg1 })
  hl('TabLine', { fg = c.fg2, bg = c.bg1 })
  hl('TabLineFill', { bg = c.bg1 })
  hl('TabLineSel', { fg = c.orange6, bg = c.bg2, bold = true })
  hl('VertSplit', { fg = c.bg3, bg = c.bg1 })
  hl('WinSeparator', { fg = c.bg3, bg = c.bg1 })

  -- Popup Menu
  hl('Pmenu', { fg = c.fg0, bg = c.bg0 })
  hl('PmenuSel', { fg = c.orange6, bg = c.bg4, bold = true })
  hl('PmenuSbar', { bg = c.bg2 })
  hl('PmenuThumb', { bg = c.bg4 })

  -- Folding
  hl('Folded', { fg = c.fg2, bg = c.bg1, italic = true })
  hl('FoldColumn', { fg = c.fg2, bg = c.bg1 })

  -- Diff
  hl('DiffAdd', { fg = c.green, bg = c.bg2 })
  hl('DiffChange', { fg = c.orange5, bg = c.bg1 })
  hl('DiffDelete', { fg = c.fg2, bg = c.bg1 })
  hl('DiffText', { fg = c.orange6, bg = c.bg3, bold = true })

  -- Messages
  hl('ErrorMsg', { fg = c.error, bg = c.bg1, bold = true })
  hl('WarningMsg', { fg = c.warning, bg = c.bg1, bold = true })
  hl('MoreMsg', { fg = c.success, bg = c.bg1 })
  hl('ModeMsg', { fg = c.fg0, bg = c.bg1 })
  hl('Question', { fg = c.orange6, bg = c.bg1, bold = true })

  -- Misc
  hl('MatchParen', { fg = c.orange6, bg = c.bg4, bold = true })
  hl('ColorColumn', { bg = c.bg2 })
  hl('Conceal', { fg = c.fg2 })
  hl('Directory', { fg = c.orange5 })
  hl('NonText', { fg = c.bg4 })
  hl('SpecialKey', { fg = c.bg4 })
  hl('Title', { fg = c.orange6, bold = true })
  hl('WildMenu', { fg = c.orange6, bg = c.bg4, bold = true })

  -- Spelling
  hl('SpellBad', { fg = c.error, undercurl = true, sp = c.error })
  hl('SpellCap', { fg = c.warning, undercurl = true, sp = c.warning })
  hl('SpellLocal', { fg = c.orange7, undercurl = true, sp = c.orange7 })
  hl('SpellRare', { fg = c.orange2, undercurl = true, sp = c.orange2 })

  -- ====================
  -- Syntax Highlighting
  -- ====================

  -- Comments
  hl('Comment', { fg = c.fg4, italic = true })
  hl('SpecialComment', { fg = c.fg3, italic = true })

  -- Constants
  hl('Constant', { fg = c.orange1, bold = true })
  hl('String', { fg = c.orange8 })
  hl('Character', { fg = c.orange8 })
  hl('Number', { fg = c.orange1 })
  hl('Boolean', { fg = c.orange1, bold = true })
  hl('Float', { fg = c.orange1 })

  -- Identifiers
  hl('Identifier', { fg = c.fg0 })
  hl('Function', { fg = c.orange6 })

  -- Statements
  hl('Statement', { fg = c.orange3, bold = true })
  hl('Conditional', { fg = c.orange3, bold = true })
  hl('Repeat', { fg = c.orange3, bold = true })
  hl('Label', { fg = c.orange2 })
  hl('Operator', { fg = c.orange3 })
  hl('Keyword', { fg = c.orange3, bold = true })
  hl('Exception', { fg = c.orange3, bold = true })

  -- PreProc
  hl('PreProc', { fg = c.orange3 })
  hl('Include', { fg = c.orange3, bold = true })
  hl('Define', { fg = c.orange3 })
  hl('Macro', { fg = c.orange3 })
  hl('PreCondit', { fg = c.orange3 })

  -- Types
  hl('Type', { fg = c.orange5 })
  hl('StorageClass', { fg = c.orange3, bold = true })
  hl('Structure', { fg = c.orange5, bold = true })
  hl('Typedef', { fg = c.orange5 })

  -- Special
  hl('Special', { fg = c.orange4 })
  hl('SpecialChar', { fg = c.orange1 })
  hl('Tag', { fg = c.orange3, bold = true })
  hl('Delimiter', { fg = c.orange10 })
  hl('Debug', { fg = c.orange1 })

  -- Misc
  hl('Underlined', { fg = c.blue, underline = true })
  hl('Ignore', { fg = c.fg6 })
  hl('Error', { fg = c.error, bg = c.bg4, bold = true })
  hl('Todo', { fg = c.warning, bg = c.bg1, bold = true, italic = true })

  -- ====================
  -- TreeSitter
  -- ====================

  -- Misc
  hl('@none', {})
  hl('@text', { fg = c.fg0 })
  hl('@text.strong', { fg = c.fg0, bold = true })
  hl('@text.emphasis', { fg = c.fg0, italic = true })
  hl('@text.underline', { fg = c.fg0, underline = true })
  hl('@text.strike', { fg = c.fg0, strikethrough = true })
  hl('@text.title', { fg = c.orange6, bold = true })
  hl('@text.literal', { fg = c.orange7 })
  hl('@text.uri', { fg = c.blue, underline = true })
  hl('@text.math', { fg = c.orange5 })
  hl('@text.reference', { fg = c.orange2 })
  hl('@text.todo', { fg = c.warning, bg = c.bg1, bold = true })
  hl('@text.note', { fg = c.success, bg = c.bg1 })
  hl('@text.warning', { fg = c.warning, bg = c.bg1, bold = true })
  hl('@text.danger', { fg = c.error, bg = c.bg1, bold = true })

  -- Comments
  hl('@comment', { fg = c.fg4, italic = true })
  hl('@comment.documentation', { fg = c.fg3, italic = true })

  -- Punctuation
  hl('@punctuation.delimiter', { fg = c.orange10 })
  hl('@punctuation.bracket', { fg = c.orange9 })
  hl('@punctuation.special', { fg = c.orange4 })

  -- Constants
  hl('@constant', { fg = c.orange1, bold = true })
  hl('@constant.builtin', { fg = c.orange1, bold = true })
  hl('@constant.macro', { fg = c.orange3 })
  hl('@string', { fg = c.orange8 })
  hl('@string.regex', { fg = c.orange3 })
  hl('@string.escape', { fg = c.orange1 })
  hl('@string.special', { fg = c.orange7 })
  hl('@character', { fg = c.orange8 })
  hl('@character.special', { fg = c.orange1 })
  hl('@number', { fg = c.orange1 })
  hl('@boolean', { fg = c.orange1, bold = true })
  hl('@float', { fg = c.orange1 })

  -- Functions
  hl('@function', { fg = c.orange6 })
  hl('@function.builtin', { fg = c.orange6 })
  hl('@function.macro', { fg = c.orange3 })
  hl('@function.call', { fg = c.orange6 })
  hl('@method', { fg = c.orange6 })
  hl('@method.call', { fg = c.orange6 })
  hl('@constructor', { fg = c.orange5, bold = true })
  hl('@parameter', { fg = c.fg0 })

  -- Keywords
  hl('@keyword', { fg = c.orange3, bold = true })
  hl('@keyword.function', { fg = c.orange3, bold = true })
  hl('@keyword.operator', { fg = c.orange3 })
  hl('@keyword.return', { fg = c.orange3, bold = true })
  hl('@conditional', { fg = c.orange3, bold = true })
  hl('@repeat', { fg = c.orange3, bold = true })
  hl('@label', { fg = c.orange2 })
  hl('@operator', { fg = c.orange3 })
  hl('@exception', { fg = c.orange3, bold = true })

  -- Types
  hl('@type', { fg = c.orange5 })
  hl('@type.builtin', { fg = c.orange5 })
  hl('@type.definition', { fg = c.orange5, bold = true })
  hl('@type.qualifier', { fg = c.orange3 })
  hl('@storageclass', { fg = c.orange3, bold = true })
  hl('@attribute', { fg = c.orange5 })
  hl('@field', { fg = c.orange5 })
  hl('@property', { fg = c.orange5 })

  -- Variables
  hl('@variable', { fg = c.fg0 })
  hl('@variable.builtin', { fg = c.orange6 })

  -- Identifiers
  hl('@namespace', { fg = c.orange5 })
  hl('@symbol', { fg = c.orange5 })

  -- Text
  hl('@tag', { fg = c.orange3, bold = true })
  hl('@tag.attribute', { fg = c.orange5 })
  hl('@tag.delimiter', { fg = c.orange10 })

  -- ====================
  -- LSP Semantic Tokens
  -- ====================

  hl('@lsp.type.class', { fg = c.orange5, bold = true })
  hl('@lsp.type.decorator', { fg = c.orange5 })
  hl('@lsp.type.enum', { fg = c.orange5 })
  hl('@lsp.type.enumMember', { fg = c.orange1, bold = true })
  hl('@lsp.type.function', { fg = c.orange6 })
  hl('@lsp.type.interface', { fg = c.orange5, bold = true })
  hl('@lsp.type.macro', { fg = c.orange3 })
  hl('@lsp.type.method', { fg = c.orange6 })
  hl('@lsp.type.namespace', { fg = c.orange5 })
  hl('@lsp.type.parameter', { fg = c.fg0 })
  hl('@lsp.type.property', { fg = c.orange5 })
  hl('@lsp.type.struct', { fg = c.orange5, bold = true })
  hl('@lsp.type.type', { fg = c.orange5 })
  hl('@lsp.type.typeParameter', { fg = c.orange5 })
  hl('@lsp.type.variable', { fg = c.fg0 })

  -- ====================
  -- Language Specific
  -- ====================

  -- HTML
  hl('htmlTag', { fg = c.orange3 })
  hl('htmlEndTag', { fg = c.orange3 })
  hl('htmlTagName', { fg = c.orange3, bold = true })
  hl('htmlArg', { fg = c.orange5 })
  hl('htmlSpecialChar', { fg = c.orange1 })

  -- CSS
  hl('cssClassName', { fg = c.orange5 })
  hl('cssIdentifier', { fg = c.orange5 })
  hl('cssTagName', { fg = c.orange3 })
  hl('cssProp', { fg = c.orange5 })
  hl('cssAttr', { fg = c.orange8 })
  hl('cssValueLength', { fg = c.orange1 })
  hl('cssValueNumber', { fg = c.orange1 })
  hl('cssBraces', { fg = c.orange9 })

  -- JavaScript
  hl('javaScriptFunction', { fg = c.orange3, bold = true })
  hl('javaScriptIdentifier', { fg = c.orange3, bold = true })
  hl('javaScriptNull', { fg = c.orange1, bold = true })
  hl('javaScriptNumber', { fg = c.orange1 })
  hl('javaScriptBraces', { fg = c.orange9 })

  -- Python
  hl('pythonFunction', { fg = c.orange6 })
  hl('pythonBuiltin', { fg = c.orange6 })
  hl('pythonDecorator', { fg = c.orange5 })
  hl('pythonDecoratorName', { fg = c.orange5 })

  -- Markdown
  hl('markdownH1', { fg = c.orange6, bold = true })
  hl('markdownH2', { fg = c.orange6, bold = true })
  hl('markdownH3', { fg = c.orange6, bold = true })
  hl('markdownH4', { fg = c.orange6, bold = true })
  hl('markdownH5', { fg = c.orange6, bold = true })
  hl('markdownH6', { fg = c.orange6, bold = true })
  hl('markdownHeadingDelimiter', { fg = c.orange3, bold = true })
  hl('markdownCode', { fg = c.orange7 })
  hl('markdownCodeBlock', { fg = c.orange7 })
  hl('markdownCodeDelimiter', { fg = c.orange1 })
  hl('markdownBlockquote', { fg = c.fg2, italic = true })
  hl('markdownListMarker', { fg = c.orange2 })
  hl('markdownOrderedListMarker', { fg = c.orange2 })
  hl('markdownRule', { fg = c.bg5 })
  hl('markdownUrl', { fg = c.blue, underline = true })
  hl('markdownLinkText', { fg = c.orange2 })
  hl('markdownLinkDelimiter', { fg = c.orange10 })
  hl('markdownLinkTextDelimiter', { fg = c.orange10 })

  -- JSON
  hl('jsonKeyword', { fg = c.orange5 })
  hl('jsonString', { fg = c.orange8 })
  hl('jsonBoolean', { fg = c.orange1, bold = true })
  hl('jsonNumber', { fg = c.orange1 })
  hl('jsonQuote', { fg = c.orange10 })
  hl('jsonBraces', { fg = c.orange9 })

  -- YAML
  hl('yamlKey', { fg = c.orange5 })
  hl('yamlString', { fg = c.orange8 })
  hl('yamlBlockMappingKey', { fg = c.orange5 })
  hl('yamlAnchor', { fg = c.orange2 })

  -- ====================
  -- Plugin Support
  -- ====================

  -- GitGutter / GitSigns
  hl('GitGutterAdd', { fg = c.green, bg = c.bg1 })
  hl('GitGutterChange', { fg = c.orange5, bg = c.bg1 })
  hl('GitGutterDelete', { fg = c.orange1, bg = c.bg1 })
  hl('GitSignsAdd', { fg = c.green, bg = c.bg1 })
  hl('GitSignsChange', { fg = c.orange5, bg = c.bg1 })
  hl('GitSignsDelete', { fg = c.orange1, bg = c.bg1 })

  -- NERDTree
  hl('NERDTreeDir', { fg = c.orange5 })
  hl('NERDTreeDirSlash', { fg = c.orange10 })
  hl('NERDTreeFile', { fg = c.fg0 })
  hl('NERDTreeExecFile', { fg = c.green })
  hl('NERDTreeOpenable', { fg = c.orange3 })
  hl('NERDTreeClosable', { fg = c.orange3 })

  -- Telescope
  hl('TelescopeBorder', { fg = c.bg3, bg = c.bg0 })
  hl('TelescopePromptBorder', { fg = c.bg5, bg = c.bg0 })
  hl('TelescopeResultsBorder', { fg = c.bg3, bg = c.bg0 })
  hl('TelescopePreviewBorder', { fg = c.bg3, bg = c.bg0 })
  hl('TelescopeNormal', { fg = c.fg0, bg = c.bg0 })
  hl('TelescopePromptNormal', { fg = c.fg0, bg = c.bg0 })
  hl('TelescopeResultsNormal', { fg = c.fg0, bg = c.bg0 })
  hl('TelescopePreviewNormal', { fg = c.fg0, bg = c.bg0 })
  hl('TelescopeSelection', { fg = c.orange6, bg = c.bg4, bold = true })
  hl('TelescopeSelectionCaret', { fg = c.orange6, bg = c.bg4, bold = true })
  hl('TelescopeMultiSelection', { fg = c.orange5, bg = c.bg3 })
  hl('TelescopeMatching', { fg = c.orange6, bold = true })

  -- WhichKey
  hl('WhichKey', { fg = c.orange6, bold = true })
  hl('WhichKeyGroup', { fg = c.orange5 })
  hl('WhichKeySeparator', { fg = c.orange10 })
  hl('WhichKeyDesc', { fg = c.fg0 })

  -- Nvim-cmp
  hl('CmpItemAbbrDeprecated', { fg = c.fg2, strikethrough = true })
  hl('CmpItemAbbrMatch', { fg = c.orange6, bold = true })
  hl('CmpItemAbbrMatchFuzzy', { fg = c.orange6, bold = true })
  hl('CmpItemKindVariable', { fg = c.fg0 })
  hl('CmpItemKindInterface', { fg = c.orange5 })
  hl('CmpItemKindText', { fg = c.fg0 })
  hl('CmpItemKindFunction', { fg = c.orange6 })
  hl('CmpItemKindMethod', { fg = c.orange6 })
  hl('CmpItemKindKeyword', { fg = c.orange3 })
  hl('CmpItemKindProperty', { fg = c.orange5 })
  hl('CmpItemKindUnit', { fg = c.orange1 })
  hl('CmpItemKindConstant', { fg = c.orange1 })

  -- Diagnostic
  hl('DiagnosticError', { fg = c.error })
  hl('DiagnosticWarn', { fg = c.warning })
  hl('DiagnosticInfo', { fg = c.info })
  hl('DiagnosticHint', { fg = c.hint })
  hl('DiagnosticUnderlineError', { undercurl = true, sp = c.error })
  hl('DiagnosticUnderlineWarn', { undercurl = true, sp = c.warning })
  hl('DiagnosticUnderlineInfo', { undercurl = true, sp = c.info })
  hl('DiagnosticUnderlineHint', { undercurl = true, sp = c.hint })

  -- Terminal colors
  vim.g.terminal_color_0 = c.bg0
  vim.g.terminal_color_1 = c.orange1
  vim.g.terminal_color_2 = c.green
  vim.g.terminal_color_3 = '#e8c078'
  vim.g.terminal_color_4 = c.blue
  vim.g.terminal_color_5 = c.purple
  vim.g.terminal_color_6 = c.cyan
  vim.g.terminal_color_7 = c.fg0
  vim.g.terminal_color_8 = c.fg6
  vim.g.terminal_color_9 = '#e8aa82'
  vim.g.terminal_color_10 = '#c8b892'
  vim.g.terminal_color_11 = c.orange6
  vim.g.terminal_color_12 = '#9ab8d8'
  vim.g.terminal_color_13 = '#d8aac8'
  vim.g.terminal_color_14 = '#9ad8c8'
  vim.g.terminal_color_15 = '#e5d592'
end

return M
