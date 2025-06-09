local wezterm = require("wezterm")
local config = wezterm.config_builder()

if true then
    -- Set font
    config.font = wezterm.font("RobotoMono Nerd Font Mono")
    config.font_size = 14

    -- Set tab-related
    config.window_close_confirmation = 'AlwaysPrompt'
    config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
    config.adjust_window_size_when_changing_font_size = false
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
    config.color_scheme = "Github"
    -- config.color_scheme = "Catppuccin Macchiato"
    config.colors = {
        tab_bar = {
            background = "#F4F4F4",
            inactive_tab = {
                fg_color = "#000000",
                bg_color = "#F4F4F4"
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
end

return config
