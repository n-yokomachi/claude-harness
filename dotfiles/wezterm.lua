local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Window
config.window_background_opacity = 0.6
config.macos_window_background_blur = 0
config.window_decorations = "RESIZE"

-- Font
config.font_size = 14.0

-- Bold is bright
config.bold_brightens_ansi_colors = "BrightAndBold"

-- TokyoNight Night color scheme
config.colors = {
  foreground = "#c0caf5",
  background = "#1a1b26",
  cursor_fg = "#1a1b26",
  cursor_bg = "#c0caf5",
  selection_fg = "#c0caf5",
  selection_bg = "#283457",
  ansi = {
    "#15161e", -- black
    "#f7768e", -- red
    "#9ece6a", -- green
    "#e0af68", -- yellow
    "#7aa2f7", -- blue
    "#bb9af7", -- magenta
    "#7dcfff", -- cyan
    "#a9b1d6", -- white
  },
  brights = {
    "#414868", -- bright black
    "#f7768e", -- bright red
    "#9ece6a", -- bright green
    "#e0af68", -- bright yellow
    "#7aa2f7", -- bright blue
    "#bb9af7", -- bright magenta
    "#7dcfff", -- bright cyan
    "#c0caf5", -- bright white
  },
}

return config
