---@module 'hl'

-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("qs -c caelestia")
    hl.exec_cmd("/usr/bin/kdeconnect-indicator")
    hl.exec_cmd("/lib/kdeconnectd")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("hyprctl setcursor nordicCursor 24")
    hl.exec_cmd("wpaperd -d")
    hl.exec_cmd("[workspace 2 silent] zen-browser")
    hl.exec_cmd("[workspace 1 silent] kitty")
    hl.exec_cmd("clipse -listen")
end)

-- Exec (run every reload)
hl.on("config.reloaded", function()
    hl.exec_cmd("swaync")
    hl.exec_cmd("fcitx5")
end)
