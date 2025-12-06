local wezterm = require("wezterm")

return {
	-----------------------------
	-- FONT + EMOJI SUPPORT
	-----------------------------

	font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Medium" }),
	font_size = 10.0,

	-- Ligatures
	harfbuzz_features = { "calt", "liga", "clig" },

	-----------------------------
	-- WINDOW LOOK + FEEL
	-----------------------------
	color_scheme = "Catppuccin Mocha",

	window_background_opacity = 0.92,
	text_background_opacity = 1.0,

	window_padding = {
		left = 6,
		right = 6,
		top = 4,
		bottom = 4,
	},

	use_fancy_tab_bar = true,
	hide_tab_bar_if_only_one_tab = false,
	tab_max_width = 30,

	-----------------------------
	-- WSL2 ARCH SETTINGS
	-----------------------------
	default_domain = "WSL:archlinux",
	-- Change “Arch” if your distro is named differently in `wsl -l`

	-----------------------------
	-- PERFORMANCE
	-----------------------------
	animation_fps = 120,
	max_fps = 120,
	front_end = "WebGpu",

	-----------------------------
	-- QUALITY OF LIFE
	-----------------------------
	enable_wayland = true, -- WSLg Wayland support
	audible_bell = "Disabled",
	check_for_updates = false,
}
