local sbar = sbar
local colors = require("colors")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

local spaces = {}
local space_brackets = {}
local space_highlight_color = os.getenv("CONFIG_THEME") == "LIGHT" and colors.theme.light or colors.theme.dark
local file = io.open("/Users/rohitb/.config/sketchybar/logs.txt", "w")
if file then
    file:write("test")
    -- file:write("Config theme set to: " .. os.getenv("CONFIG_THEME"))
    file:close()
end

local update_icons = function(space_name, should_animate)
    space_name = tonumber(space_name)
    spaces[space_name]:set({ label = "" })
    sbar.exec("aerospace list-windows --format %{app-name} --workspace " .. space_name, function(windows)
        local icon_line = ""
        for app in windows:gmatch("[^\r\n]+") do
            local lookup = app_icons[app]
            local icon = ((lookup == nil) and app_icons["default"] or lookup)
            icon_line = icon_line .. " " .. icon
        end

        if (should_animate) then
            sbar.animate("tanh", 10, function()
                spaces[space_name]:set({ label = icon_line })
            end)
        else
            spaces[space_name]:set({ label = icon_line })
        end
    end)
end

local update_highlights = function(space_name, selected)
    space_name = tonumber(space_name)
    local color = selected and colors.grey or colors.bg2
    spaces[space_name]:set({
        icon = { highlight = selected, },
        label = { highlight = selected },
        background = { border_color = color }
    })
    space_brackets[space_name]:set({
        background = { border_color = color }
    })
end

local item_order = ""
sbar.exec("aerospace list-workspaces --all", function(workspaces)
    for space_name in workspaces:gmatch("[^\r\n]+") do
        local space = sbar.add("item", "space." .. space_name, {
            icon = {
                font = { family = settings.font.numbers },
                string = space_name,
                padding_left = 7,
                padding_right = 3,
                y_offset = 1,
                color = colors.white,
                highlight_color = space_highlight_color,
            },
            label = {
                padding_right = 12,
                color = colors.white,
                highlight_color = space_highlight_color,
                font = "sketchybar-app-font:Regular:16.0",
                y_offset = -1,
            },
            padding_right = 1,
            padding_left = 1,
            background = {
                color = colors.transparent,
                border_width = 1,
                height = 26,
                border_color = colors.black,
            }
        })

        local space_bracket = sbar.add("bracket", { space.name }, {
            background = {
                color = colors.transparent,
                border_color = colors.bg2,
                height = 28,
                border_width = 2
            }
        })

        local space_padding = sbar.add("item", "space.padding." .. space_name, {
            script = "",
            width = settings.group_paddings,
        })

        space:subscribe("aerospace_workspace_change", function(env)
            local selected = env.FOCUSED_WORKSPACE == space_name
            update_highlights(space_name, selected)
        end)

        space:subscribe("space_windows_change", function()
            update_icons(space_name, false)
        end)

        space:subscribe("mouse.clicked", function()
            sbar.exec("aerospace workspace " .. space_name)
        end)

        item_order = item_order .. " " .. space.name .. " " .. space_padding.name
        spaces[tonumber(space_name)] = space
        space_brackets[tonumber(space_name)] = space_bracket
        update_icons(space_name, false)
    end

    sbar.exec("sketchybar --reorder apple " .. item_order .. " front_app_prefix front_app")
end)

sbar.exec("aerospace list-workspaces --focused", function(focused_workspace)
    update_highlights(focused_workspace, true)
end)
