local wezterm = require "wezterm"


local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = "Brogrammer"

config.window_background_opacity = 0.4

config.default_cursor_style = "BlinkingUnderline"
config.cursor_blink_rate = 800

config.enable_scroll_bar = true

-- Tabs
config.use_fancy_tab_bar = true
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false

config.window_frame = {
    font = wezterm.font {family = "JetBrains Mono", weight = "Regular"},
    font_size = 11.0,    
}

config.window_padding = {
    left = "1.5cell",
    right = "1cell",
    top = "0.75cell",
    bottom = "0.5cell",
}
  
  

return config
