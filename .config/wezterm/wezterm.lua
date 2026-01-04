local wezterm = require('wezterm')
local keys = require('keymaps')
local fc = require('fonts')

local session_manager = require 'plugins/wezterm-session-manager/session-manager'
wezterm.on("save_session", function(window) session_manager.save_state(window) end)
wezterm.on("load_session", function(window) session_manager.load_state(window) end)
wezterm.on("restore_session", function(window) session_manager.restore_state(window) end)

local config = {
    -- Colorscheme
    color_scheme_dirs = { os.getenv("HOME") .. "/.config/wezterm/colors/" },
    color_scheme = "tokyonight_storm",
    -- color_scheme = "Everforest Dark (Soft)",
    -- background = {
    --     {
    --         source = {
    --             File = '/Users/rohitb/Documents/wally/Aerial_City.jpg',
    --         },
    --         opacity = 0.5
    --     },
    -- },

    -- Font
    font = fc.font,
    font_size = fc.font_size,
    font_rules = fc.font_rules,
    bold_brightens_ansi_colors = "BrightAndBold",
    freetype_load_flags = 'NO_HINTING',

    window_decorations = "RESIZE",
    macos_window_background_blur = 30,
    window_padding = {
        left = 2,
        right = 0,
        top = 4,
        bottom = 0,
    },
    -- enable_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,

    -- Cursor
    default_cursor_style = "BlinkingBar",
    force_reverse_video_cursor = true,

    -- Keybinds
    leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 3000 },
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
    scrollback_lines = 5000,
    audible_bell = "Disabled",
    use_fancy_tab_bar = false,
    switch_to_last_active_tab_when_closing_tab = true,

    -- Mux
    unix_domains = {
        {
            name = 'unix',
        },
    },

    -- Command Palette
    command_palette_font_size = 13,
    command_palette_bg_color = "#394b70",
    command_palette_fg_color = "#828bb8",
}

return config
