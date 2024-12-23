local wezterm = require("wezterm")

return {
	automatically_reload_config = true,
	color_scheme = "Dracula",
	enable_tab_bar = false,
	font_size = 19.0,
	font = wezterm.font_with_fallback({
		"BlexMono Nerd Font",
		"JetBrains Mono",
	}),
	font_rules = {
		{
			italic = true,
			font = wezterm.font({
				family = "BlexMono Nerd Font",
				style = "Italic",
			}),
		},
		{
			italic = true,
			font = wezterm.font({
				family = "BlexMono Nerd Font",
				style = "Italic",
			}),
		},
		{
			italic = true,
			intensity = "Normal",
			font = wezterm.font({
				family = "BlexMono Nerd Font",
				style = "Italic",
			}),
		},
	},
	macos_window_background_blur = 20,
	window_background_opacity = 0.92,
	window_decorations = "RESIZE",
	keys = {
		{
			key = "f",
			mods = "CTRL",
			action = wezterm.action.ToggleFullScreen,
		},
		{ key = "r", mods = "CTRL", action = wezterm.action.ReloadConfiguration },
	},
	mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
}
