local wezterm = require('wezterm')
local keys = require('keymaps')
local config = {
    color_scheme = "tokyonight_storm",
    color_scheme_dirs = { os.getenv("HOME") .. "/.config/wezterm/colors/" },

    font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Medium' }),
    font_size = 18,
    font_rules = {
        {
            intensity = "Bold",
            italic = false,
            font = wezterm.font('JetBrainsMono Nerd Font',{
                weight = 'Bold',
                foreground = '#58b99d',
            })
        },
    },
    bold_brightens_ansi_colors = "BrightAndBold",
    freetype_load_flags = 'NO_HINTING',

    window_decorations = "RESIZE",
    window_background_opacity = 0.9,
    macos_window_background_blur = 30,
    window_padding = {
        left = 4,
        right = 4,
        top = 1,
        bottom = 0,
    },
    -- enable_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,

    -- Keybinds
    leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 },
    keys = keys,
    mouse_bindings = {
        -- Ctrl-click will open the link under the mouse cursor
        {
            event = { Up = { streak = 1, button = 'Left' } },
            mods = 'CTRL',
            action = wezterm.action.OpenLinkAtMouseCursor,
        },
    },

    -- General
    scrollback_lines = 3500,
}

return config
