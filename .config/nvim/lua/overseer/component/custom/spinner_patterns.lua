local M = {}

M.check = {
  "✔"
}

M.dots = {
  "⠋",
  "⠙",
  "⠹",
  "⠸",
  "⠼",
  "⠴",
  "⠦",
  "⠧",
  "⠇",
  "⠏",
}

-- Originally called dots2
M.dots_negative = {
  "⣾",
  "⣽",
  "⣻",
  "⢿",
  "⡿",
  "⣟",
  "⣯",
  "⣷",
}

-- Originally called dots3
M.dots_snake = {
  "⠋",
  "⠙",
  "⠚",
  "⠒",
  "⠂",
  "⠂",
  "⠒",
  "⠲",
  "⠴",
  "⠦",
  "⠖",
  "⠒",
  "⠐",
  "⠐",
  "⠒",
  "⠓",
  "⠋",
}

-- Originally called dots10
M.dots_footsteps = {
  "⢄",
  "⢂",
  "⢁",
  "⡁",
  "⡈",
  "⡐",
  "⡠",
}

-- Originally called dots11
M.dots_hop = {
  "⠁",
  "⠂",
  "⠄",
  "⡀",
  "⢀",
  "⠠",
  "⠐",
  "⠈",
}

M.line = {
  "-",
  "\\",
  "|",
  "/",
}

M.pipe = {
  "┤",
  "┘",
  "┴",
  "└",
  "├",
  "┌",
  "┬",
  "┐",
}

-- Originally called simpleDots
M.dots_ellipsis = {
  ".  ",
  ".. ",
  "...",
  "   ",
}

-- Originally called simpleDotsScrolling
M.dots_scrolling = {
  ".  ",
  ".. ",
  "...",
  " ..",
  "  .",
  "   ",
}

M.star = {
  "✶",
  "✸",
  "✹",
  "✺",
  "✹",
  "✷",
}

M.flip = {
  "_",
  "_",
  "_",
  "-",
  "`",
  "`",
  "'",
  "´",
  "-",
  "_",
  "_",
  "_",
}

M.hamburger = {
  "☱",
  "☲",
  "☴",
}

-- Originally called growVertical
M.grow_vertical = {
  "▁",
  "▃",
  "▄",
  "▅",
  "▆",
  "▇",
  "▆",
  "▅",
  "▄",
  "▃",
}

-- Originally called growHorizontal
M.grow_horizontal = {
  "▏",
  "▎",
  "▍",
  "▌",
  "▋",
  "▊",
  "▉",
  "▊",
  "▋",
  "▌",
  "▍",
  "▎",
}

M.noise = {
  "▓",
  "▒",
  "░",
}

-- Originally called bounce
M.dots_bounce = {
  "⠁",
  "⠂",
  "⠄",
  "⠂",
}

M.triangle = {
  "◢",
  "◣",
  "◤",
  "◥",
}

M.arc = {
  "◜",
  "◠",
  "◝",
  "◞",
  "◡",
  "◟",
}

M.circle = {
  "◡",
  "⊙",
  "◠",
}

-- Originally called squareCorners
M.square_corners = {
  "◰",
  "◳",
  "◲",
  "◱",
}

-- Originally called circleQuarters
M.circle_quarters = {
  "◴",
  "◷",
  "◶",
  "◵",
}

-- Originally called circleHalves
M.circle_halves = {
  "◐",
  "◓",
  "◑",
  "◒",
}

-- Originally called toggle
M.dots_toggle = {
  "⊶",
  "⊷",
}

-- Originally called toggle2
M.box_toggle = {
  "▫",
  "▪",
}

M.arrow = {
  "←",
  "↖",
  "↑",
  "↗",
  "→",
  "↘",
  "↓",
  "↙",
}

-- Originally called arrow3
M.zip = {
  "▹▹▹▹▹",
  "▸▹▹▹▹",
  "▹▸▹▹▹",
  "▹▹▸▹▹",
  "▹▹▹▸▹",
  "▹▹▹▹▸",
}

-- Originally called bouncingBar
M.bouncing_bar = {
  "[    ]",
  "[=   ]",
  "[==  ]",
  "[=== ]",
  "[ ===]",
  "[  ==]",
  "[   =]",
  "[    ]",
  "[   =]",
  "[  ==]",
  "[ ===]",
  "[====]",
  "[=== ]",
  "[==  ]",
  "[=   ]",
}

-- Originally called bouncingBall
M.bouncing_ball = {
  "( ●    )",
  "(  ●   )",
  "(   ●  )",
  "(    ● )",
  "(     ●)",
  "(    ● )",
  "(   ●  )",
  "(  ●   )",
  "( ●    )",
  "(●     )",
}

M.clock = {
  "🕛 ",
  "🕐 ",
  "🕑 ",
  "🕒 ",
  "🕓 ",
  "🕔 ",
  "🕕 ",
  "🕖 ",
  "🕗 ",
  "🕘 ",
  "🕙 ",
  "🕚 ",
}

M.earth = {
  "🌍 ",
  "🌎 ",
  "🌏 ",
}

M.moon = {
  "🌑 ",
  "🌒 ",
  "🌓 ",
  "🌔 ",
  "🌕 ",
  "🌖 ",
  "🌗 ",
  "🌘 ",
}

-- Originally called point
M.dots_pulse = {
  "∙∙∙∙∙",
  "●∙∙∙∙",
  "∙●∙∙∙",
  "∙∙●∙∙",
  "∙∙∙●∙",
  "∙∙∙∙●",
  "∙∙∙∙∙",
}

M.aesthetic = {
    "▰▱▱▱▱▱▱",
    "▰▰▱▱▱▱▱",
    "▰▰▰▱▱▱▱",
    "▰▰▰▰▱▱▱",
    "▰▰▰▰▰▱▱",
    "▰▰▰▰▰▰▱",
    "▰▰▰▰▰▰▰",
    "▰▱▱▱▱▱▱",
}

return M
