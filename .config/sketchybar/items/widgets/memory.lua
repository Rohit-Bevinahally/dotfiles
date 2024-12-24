local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local memory = sbar.add("item", "widgets.memory", {
  position = "right",
  icon = {
    font = {
        style = settings.font.style_map["Semibold"],
        size = 18.0,
    },
    string = icons.memory,
    pading_left = 2,
  },
  label = {
    string = "?%",
    font = {
      family = settings.font.numbers,
      style = settings.font.style_map["Bold"],
      size = 12.0,
    },
    padding_right = 5,
  },
  update_freq = 3,
})

memory:subscribe("routine", function()
    local memfn = 'memory_pressure | awk \'/^System-wide memory free percentage: /{ printf("%d\\n", 100-$5) }\''
    sbar.exec(memfn, function(value)
        memory:set({ label = value .. "%" })
    end)
end)

memory:subscribe("mouse.clicked", function()
  sbar.exec("open -a 'Activity Monitor'")
end)

sbar.add("bracket", "widgets.memory.bracket", { memory.name }, {
  background = {
      color = colors.transparent,
      border_color = colors.grey,
  }
})

sbar.add("item", "widgets.memory.padding", {
  position = "right",
  width = settings.group_paddings,
})
