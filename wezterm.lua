local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("RobotoMono Nerd Font Mono")
config.font_size = 13

config.enable_tab_bar = false

config.window_decorations = "RESIZE" 

config.color_scheme = "Catppuccin Macchiato"

return config
