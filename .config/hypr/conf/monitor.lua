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
-- Computer Display Left
hl.monitor({
    output   = "DP-2",
    mode     = "1920x1080@144",
    position = "0x0",
    scale    = 1,
})
-- Computer Display Right
hl.monitor({
    output   = "DP-3",
    mode     = "1920x1080@144",
    position = "1920x0",
    scale    = 1,
})
-- Display for HDMI
--monitor=eDP-1,1920x1080@60,0x0,1.3333
--
-- HDMI Display Configuring
--
-- Mirror HDMI from eDP-1
--monitor=HDMI-A-1,1920x1080@60,1920x0,1,mirror,eDP-1
-- Extend HDMI from eDP-1
-- monitor=HDMI-A-1,1920x1080@60,1920x0,1.3333
