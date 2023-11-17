require('solarized-osaka').setup {
    transparent = false,
    styles = {
        floats = "dark",
        comments = { italic = true },
        keywords = {},
        functions = { italic = true },
        variables = {},
    },
    hide_inactive_statusline = true,
    dim_inactive = false,
    on_colors = function(_colors) end,
    on_highlights = function(_highlights, _colors) end,
}
