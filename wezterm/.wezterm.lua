local function change_padding(window, app_name, padding)
	local overrides = window:get_config_overrides() or {}

	if app_name == "nvim" then
		overrides.window_padding = padding
	else
		overrides.window_padding = nil
	end

	window:set_config_overrides(overrides)
end

local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.enable_wayland = true

config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400

config.font = wezterm.font("JetBrainsMono Nerd Font")

config.char_select_bg_color = "#acc2e8"
config.char_select_fg_color = "#acc2e8"
config.char_select_font_size = 12.0

config.colors = {
	selection_bg = "rgba(100, 100, 100, 0.4)",
	scrollbar_thumb = "rgba(170, 170, 170, 0.4)",
}
config.color_scheme = "Brogrammer"

config.window_background_opacity = 0.4

config.animation_fps = 1

config.default_cursor_style = "BlinkingUnderline"
config.cursor_blink_rate = 727 -- WYSI
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

config.enable_scroll_bar = true

config.use_fancy_tab_bar = true
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false

config.window_frame = {
	font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Regular" }),
	font_size = 12.0,
}

config.window_padding = {
	left = "1.5cell",
	right = "1cell",
	top = "0.75cell",
	bottom = "0.5cell",
}

config.adjust_window_size_when_changing_font_size = false

config.audible_bell = "Disabled"

config.enable_wayland = true

--  No padding for neovim
wezterm.on("window-resized", function(window, pane)
	local app_name = pane:get_app().executable:lower()
	change_padding(window, app_name, {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	})
end)

return config
