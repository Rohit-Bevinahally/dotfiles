local colors = require("colors")
local settings = require("settings")
local json = require("helpers.json")
local app_icons = require("helpers.app_icons")

local spaces = {}
local space_brackets = {}
local space_highlight_color = colors.theme.dark

local flash = function(command, callback)
    sbar.exec("/Applications/FlashSpace.app/Contents/Resources/flashspace " .. command, callback)
end

local update_icons = function(space_name, should_animate)
    spaces[space_name]:set({ label = "" })
    flash("list-apps " .. space_name, function(windows)
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

local handle = io.open("/Users/rohitb/.config/flashspace/profiles.json")
if handle == nil then
    return
end
local data_str = handle:read("*a")
local profile_data = json.parse(data_str)
handle:close()

local workspaces = nil
for _, profile in pairs(profile_data.profiles) do
    if profile.id == profile_data.selectedProfileId then
        workspaces = profile.workspaces
        break
    end
end
if workspaces == nil then
    return
end

for i, workspace in pairs(workspaces) do
    local space_id = string.upper(workspace.shortcut:sub(-1))
    local space_name = workspace.name
    local space = sbar.add("item", "space." .. i, {
        display = workspace.display == "LF27T35" and 2 or 1,
        icon = {
            font = { family = settings.font.numbers },
            string = space_id,
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

    sbar.add("item", "space.padding." .. space_id, {
        space = space_id,
        script = "",
        width = settings.group_paddings,
    })

    space:subscribe("front_app_switched", function(env)
        if workspace["appToFocus"] ~= nil then
            if env.INFO == workspace.appToFocus.name then
                update_highlights(space_name, true)
            else
                update_highlights(space_name, false)
            end
        end
    end)

    spaces[space_name] = space
    space_brackets[space_name] = space_bracket
    update_icons(space_name, false)
end

flash("get-workspace", function(focused_workspace)
    update_highlights(focused_workspace, true)
end)
