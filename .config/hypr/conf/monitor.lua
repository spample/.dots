---@module 'hl'
-- See https://wiki.hyprland.org/Configuring/Monitors/
--
-- Laptop Display Configuring
--
-- Laptop display
--monitor=eDP-1,2560x1600@165,0x0,1.3333
--
-- Computer Display Configuring
--

-- monitor=HDMI-A-1,1920x1080@60,1920x0,1.3333
--

-- Laptop display
hl.monitor({
	output = "eDP-2",
	mode = "2560x1600@165",
	position = "0x0",
	scale = 1.6,
})
--
-- Laptop HDMI Stuff
-- hl.monitor({
--     output = "eDP-2",
--     mode = "1920x1080@165",
--     position = "0x0",
--     scale = 1,
-- })
--
-- -- HDMI mirrors the laptop
hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@60",
	position = "0x0",
	scale = 1.33,
	mirror = "eDP-2",
})
