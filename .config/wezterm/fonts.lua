local wezterm = require('wezterm')
local harfbuzz_features = {
    "zero",
    "cv07",
    "cv11",
    "cv12",
    "cv16",
}

return {
    font = wezterm.font {
        family = "JetBrainsMono Nerd Font",
        harfbuzz_features = harfbuzz_features,
    },
    font_size = 18,
    font_rules = {
        {
            intensity = "Bold",
            italic = false,
            font = wezterm.font('JetBrainsMono Nerd Font', {
                weight = 'Bold',
                foreground = '#58b99d',
            }),
        },
        {
            intensity = "Bold",
            italic = true,
            font = wezterm.font({ family = "Maple Mono", weight = "Bold", style = "Italic" }),
        },
        {
            intensity = "Normal",
            italic = true,
            font = wezterm.font({ family = "Maple Mono", style = "Italic" }),
        },
    },
}
