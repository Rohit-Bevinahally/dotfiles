local settings = require("settings")
local colors = require("colors")
local icons = require("icons")

-- Padding item required because of bracket
-- sbar.add("item", { position = "right", width = settings.group_paddings })

local clock = sbar.add("item", {
  icon = {
    font = {
        style = settings.font.style_map["Semibold"],
        size = 18.0,
    },
    string = icons.clock,
    color = colors.blue,
    y_offset = 1,
    padding_right = 10,
  },
  label = {
    color = colors.white,
    padding_left = 10,
    width = 49,
    align = "right",
    font = {
        family = settings.font.numbers,
        size = 16.0,
    },
  },
  position = "center",
  update_freq = 10,
  padding_left = 1,
  padding_right = 1,
  -- background = {
  --   color = colors.bg2,
  --   border_color = colors.black,
  --   border_width = 1
  -- },
})

-- sbar.add("bracket", { clock.name }, {
--   background = {
--     color = colors.transparent,
--     height = 30,
--     border_color = colors.grey,
--   }
-- })

-- Padding item required because of bracket (adjusted in calendar already)
-- sbar.add("item", { position = "right", width = settings.group_paddings })

clock:subscribe({ "forced", "routine", "system_woke" }, function(env)
  clock:set({ label = os.date("%H:%M") })
end)

clock:subscribe(
    "mouse.clicked",
    function(env)
        sbar.exec("open -a 'Clock'")
    end
)
