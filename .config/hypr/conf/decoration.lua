---@module 'hl'

local function get_pywal_accent()
	local f = io.open(os.getenv("HOME") .. "/.cache/wal/colors", "r")
	if not f then
		return "rgb(14,14,14)"
	end
	local count = 0
	for line in f:lines() do
		count = count + 1
		if count == 1 then
			f:close()
			return "rgb(" .. line:gsub("#", "") .. ")"
		end
	end
	f:close()
	return "rgb(14,14,14)"
end

local dynamic_accent = get_pywal_accent()

hl.config({
	decoration = {
		rounding = 10,
		dim_inactive = true,
		dim_strength = 0.1,
		inactive_opacity = 0.9,
		blur = {
			enabled = true,
			size = 7,
			passes = 3,
			ignore_opacity = true,
			noise = 0.03,
			contrast = 1.5,
			--variant = "drops",
		},
		shadow = {
			enabled = true,
			range = 30,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
		glow = {
			enabled = true,
			range = 12,
			render_power = 2,
			color = { colors = { dynamic_accent, dynamic_accent }, angle = 45 },
			color_inactive = "rgba(00000000)",
		},
	},
	-- plugin = {
	-- 	hyprglass = {
	-- 		default_theme = "dark",
	-- 		default_preset = "clear",
	-- 		tint_color = 0x8899aa22,
	-- 		brightness = 0.9,
	-- 		glass_opacity = 0.7,
	-- 		blur_strength = 1,
	-- 		lens_distortion = 0.8,
	-- 	},
	-- },
})

-- Keep the layer whitelists outside the main config block
-- hl.dispatch("hyprglass:layer", "waybar preset:subtle mask_threshold:0.05")
-- hl.dispatch("hyprglass:layer", "quickshell:bezel preset:ui mask_threshold:0.3")
