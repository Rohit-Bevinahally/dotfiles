local wezterm = require('wezterm')
local helpers = require('helpers')

local keys = {
    {
        mods   = "LEADER",
        key    = "-",
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
        mods   = "LEADER",
        key    = "\\",
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    -- Maximize Active Pane
    {
        mods = 'LEADER',
        key = 'm',
        action = wezterm.action.TogglePaneZoomState
    },
    -- rotate panes
    {
        mods = "LEADER",
        key = "Space",
        action = wezterm.action.RotatePanes "Clockwise"
    },
    -- show the pane selection mode, but have it swap the active and selected panes
    {
        mods = 'LEADER',
        key = '0',
        action = wezterm.action.PaneSelect {
            mode = 'SwapWithActive',
        },
    },
    -- move between split panes
    helpers.split_nav('move', 'h'),
    helpers.split_nav('move', 'j'),
    helpers.split_nav('move', 'k'),
    helpers.split_nav('move', 'l'),
    -- resize panes
    helpers.split_nav('resize', 'h'),
    helpers.split_nav('resize', 'j'),
    helpers.split_nav('resize', 'k'),
    helpers.split_nav('resize', 'l'),
    -- copy mode
    {
        mods = 'LEADER',
        key = 'Enter',
        action = wezterm.action.ActivateCopyMode,
    },
    -- Clear and Preserve Scrollback
    {
        mods='CTRL|SHIFT',
        key = 'K',
        action = wezterm.action_callback(
            function(_, pane)
                local pos = pane:get_cursor_position()
                local dims = pane:get_dimensions()
                local move_viewport_to_scrollback = string.rep('\r\n', pos.y - dims.physical_top)
                pane:inject_output(move_viewport_to_scrollback)
                pane:send_text('\x0c') -- CTRL-L
            end
        ),
    },
}

return keys
