local colors = require("colors")
local settings = require("settings")
local icons = require("icons")

sbar.add("item", "front_app_prefix", {
    position = "left",
    display = "active",
    icon = {
        font = {
            style = settings.font.style_map["Semibold"],
            size = 18.0,
        },
        string = icons.window,
        color = colors.white,
    },
    label = {
        font = {
            style = settings.font.style_map["Semibold"],
            size = 16.0,
        },
        padding_top = 1,
        padding_left = 10,
        string = icons.chevron_right,
        color = colors.white,
    },
    padding_left = 10,
})

local front_app = sbar.add("item", "front_app", {
  position = "left",
  display = "active",
  icon = {
    background = {
      drawing = true,
      image = {
        drawing = true,
        scale = 0.8,
        padding_left = 2,
        padding_right = 5,
      },
    },
  },
  label = {
    font = {
      style = settings.font.style_map["Semibold"],
      size = 14.0,
    },
    padding_right = 15,
    color = colors.white,
  },
  updates = true,
  -- background = {
  --   color = colors.bg1,
  --   border_width = 1,
  --   height = 30,
  --   border_color = colors.black,
  -- },
})

front_app:subscribe("front_app_switched", function(env)
  local image = "app." .. env.INFO
  local text = env.INFO
  front_app:set({
    icon = {
      background = {
        image = {
          string = image,
        },
      },
    },
    label = { string = text }
  })
end)

-- front_app:subscribe("mouse.clicked", function(env)
--   sbar.trigger("swap_menus_and_spaces")
-- end)
