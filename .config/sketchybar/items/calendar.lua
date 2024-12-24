local settings = require("settings")
local colors = require("colors")
local icons = require("icons")

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

local cal = sbar.add("item", {
  icon = {
    font = {
        style = settings.font.style_map["Semibold"],
        size = 18.0,
    },
    string = icons.calendar,
    color = colors.orange,
  },
  label = {
    color = colors.white,
    padding_left = 8,
    padding_right = 8,
    font = {
      style = settings.font.style_map["Semibold"],
      size = 12.0,
    },
  },
  position = "right",
  update_freq = 30,
  padding_left = 1,
  padding_right = 1,
  -- background = {
  --   color = colors.bg2,
  --   border_color = colors.black,
  --   border_width = 1
  -- },
})

-- Double border for calendar using a single item bracket
sbar.add("bracket", { cal.name }, {
  background = {
    color = colors.transparent,
    border_color = colors.grey,
  }
})

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
  cal:set({ label = os.date("%a %d %b") })
end)

cal:subscribe(
    "mouse.clicked",
    function(env)
        sbar.exec("open -a 'Calendar'")
    end
)
