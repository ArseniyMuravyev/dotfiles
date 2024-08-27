local wezterm = require("wezterm")

return {
	color_scheme = "Kanagawa (Gogh)",
	enable_tab_bar = false,
	font_size = 21.0,
	font = wezterm.font("JetBrains Mono"),
	initial_cols = 105,
	initial_rows = 30,
	macos_window_background_blur = 30,
	window_background_opacity = 0.9,
	window_decorations = "RESIZE",
	keys = {
		{
			key = "f",
			mods = "CTRL",
			action = wezterm.action.ToggleFullScreen,
		},
		{
			key = "'",
			mods = "CTRL",
			action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
		},
	},
	mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
		{
			event = { Down = { streak = 1, button = { WheelUp = 1 } } },
			mods = "NONE",
			action = wezterm.action.ScrollByLine(-3),
		},
		{
			event = { Down = { streak = 1, button = { WheelDown = 1 } } },
			mods = "NONE",
			action = wezterm.action.ScrollByLine(3),
		},
	},
}
