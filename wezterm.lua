local wezterm = require("wezterm")

return {
	color_scheme = "Catppuccin Mocha",
	font = wezterm.font("DankMono Nerd Font"),
	font_size = 14.0,
	font_rules = {
		{
			intensity = "Normal",
			italic = true,
			font = wezterm.font({
				family = "DankMono Nerd Font",
				weight = "Normal",
				style = "Italic",
			}),
		},
	},
	hide_tab_bar_if_only_one_tab = true,
}

