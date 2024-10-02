local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Set font
config.font = wezterm.font("RobotoMono Nerd Font Mono")
config.font_size = 13

-- Set tab-related
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE" 
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.window_frame = {
  font = require('wezterm').font 'Roboto',
  font_size = 12,
  border_left_width = '0.5cell',
  border_right_width = '0.5cell',
  border_bottom_height = '0.25cell',
  border_top_height = '0.35cell',
}

-- Set colors
config.color_scheme = "Catppuccin Macchiato"
config.colors = {
    tab_bar = {
        background = "rgba(0, 0, 0, 0)",
        inactive_tab = {
            fg_color = "#FFFFFF",
            bg_color = "rgba(0, 0, 0, 0)"
        },
    }
}

-- Set keys
config.keys = {
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
    -- Make Option-Right equivalent to Alt-f; forward-word
    {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
}

return config
