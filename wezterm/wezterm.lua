local wezterm = require("wezterm")
return {
	enable_tab_bar = false,
	font_size = 21.0,
	font = wezterm.font("JetBrains Mono"),
	macos_window_background_blur = 30,
	initial_cols = 110,
	initial_rows = 32,
	window_background_opacity = 0.82,
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
	},
}
