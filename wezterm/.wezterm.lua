local wezterm = require("wezterm")

return {
	font = wezterm.font_with_fallback({
		"JetBrainsMono Nerd Font",
	}),
	font_size = 10,

	window_background_image = "C:/Users/vk23-2/Pics/bg.jpg",
	window_background_image_hsb = {
		brightness = 0.03,
		hue = 1.0,
		saturation = 1.0,
	},

	win32_system_backdrop = "Acrylic",
	macos_window_background_blur = 20,

	window_decorations = "RESIZE|TITLE",

	color_scheme = "Monokai (Dark)",
	colors = {
		background = "#151515",
	},
	inactive_pane_hsb = {
		brightness = 0.8,
		saturation = 0.9,
	},

	enable_tab_bar = true,
	use_fancy_tab_bar = true,

	default_prog = { "wsl.exe" },
	initial_cols = 145,
	initial_rows = 33,

	keys = {
		{ key = "C", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
		{ key = "V", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
		{ key = "v", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
	},

	mouse_bindings = {
		{
			event = { Down = { streak = 1, button = "Right" } },
			mods = "NONE",
			action = wezterm.action.PasteFrom("Clipboard"),
		},
	},
}
