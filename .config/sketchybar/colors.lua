return {
  black = 0xff24283b,
  white = 0xffa9b1d6,
  red = 0xfff7768e,
  green = 0xff58b99d,
  blue = 0xff7aa2f7,
  yellow = 0xffe0af68,
  orange = 0xffff9e64,
  magenta = 0xffbb9af7,
  grey = 0xff7f8490,
  transparent = 0x00000000,
  jet_black = 0xff000000,

  theme = {
      light = 0xff829181,
      dark = 0xff7aa2f7,
  },
  bar = {
    bg = 0xff1a1b26,
    transparent = 0x00000000,
    border = 0xffbb9af7,
  },
  popup = {
    bg = 0xff24283b,
    border = 0xff7f8490,
  },
  bg1 = 0xff363944,
  bg2 = 0xff414550,
  bg3 = 0xff3b4261,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then return color end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}
