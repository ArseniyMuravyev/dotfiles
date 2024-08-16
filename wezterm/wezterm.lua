local wezterm = require("wezterm")

return {
	enable_tab_bar = false,
	font_size = 21.0,
	font = wezterm.font("JetBrains Mono"),
	macos_window_background_blur = 25,
	initial_cols = 105,
	initial_rows = 30,
	window_background_opacity = 0.86,
	window_decorations = "RESIZE",
	keys = {
		{
			key = "f",
			mods = "CTRL",
			action = wezterm.action.ToggleFullScreen,
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
