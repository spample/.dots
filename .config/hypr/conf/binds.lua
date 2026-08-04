---@module 'hl'
-- Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
-- Finding keyboard-keys:  Use comman "wev"
-- SUPER key
local mainMod = "SUPER"
local term = "kitty"
local browser = "zen-browser"
local fileManager = "nemo"
-- Actions

-- Open kitty terminal
hl.bind(mainMod .. " + " .. "RETURN", hl.dsp.exec_cmd("kitty"))

-- Close current window
hl.bind(mainMod .. " + " .. "Q", hl.dsp.window.close())

-- Exit Hyprland
hl.bind(mainMod .. " + " .. "M", hl.dsp.exit())

-- Press Super + E to open a one-time floating Nemo
hl.bind(mainMod .. " + " .. "E", hl.dsp.exec_cmd("nemo"))

-- Toggle between tiling and floating window
hl.bind(mainMod .. " + " .. "T", hl.dsp.window.float())

-- Open the window in fullscreen
hl.bind(mainMod .. " + " .. "F", hl.dsp.window.fullscreen())

-- Open rofi
--bind = $mainMod, SPACE, exec, rofi -show drun # Open rofi
hl.bind(mainMod .. " + " .. "SPACE", hl.dsp.exec_cmd("~/.config/rofi/launchers/type-7/launcher.sh"))

-- dwindle
hl.bind(mainMod .. " + " .. "P", hl.dsp.window.pseudo())

-- dwindle
hl.bind(mainMod .. " + " .. "S", hl.dsp.layout("togglesplit"))

-- Opens the browser
hl.bind(mainMod .. " + " .. "B", hl.dsp.exec_cmd("zen-browser"))

-- Reload Waybar
--hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "B", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr-stuff/scripts/reload-waybar.sh"))

-- Reload hyprpaper after a changing the wallpaper
--hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "W", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr-stuff/scripts/reload-hyprpaper.sh"))

-- Next Wallpaper
--hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "K", hl.dsp.exec_cmd("wpaperctl next"))

-- Previous Wallpaper
--hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "J", hl.dsp.exec_cmd("wpaperctl previous"))

-- Disable Touchpad (Laptop)
hl.bind(mainMod .. " + " .. "CONTROL" .. " + " .. "code:202", hl.dsp.exec_cmd("/home/spample/.config/hypr-stuff/scripts/toggle-touchpad.sh"))

-- Raise Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"))

-- Lower Volume
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"))

-- Mute Audio
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))

-- Set Brightness Up
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 10%+"))

-- Set Brightness Down
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"))

-- IDK
hl.bind("XF86Refresh", hl.dsp.exec_cmd("xdotool key F5"))

-- Capture focused window
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "S", hl.dsp.exec_cmd("QT_SCALE_FACTOR=1 XDG_CURRENT_DESKTOP=hyprland flameshot gui"))

-- Bind to start and stop recording the entire screen
--bind = $mainMod, R, exec, wf-recorder -f ~/Videos/recording.mp4 -g "$(slurp)"

-- clipboard
hl.bind("SUPER" .. " + " .. "V", hl.dsp.exec_cmd("kitty --class clipse -e 'clipse'"))

-- emoji picker
-- hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "E", hl.dsp.exec_cmd("rofi -modi emoji -show emoji -emoji-format ' { emoji } { name } '"))

-- Move focus with mainMod + arrow keys
--
-- Move focus left
hl.bind(mainMod .. " + " .. "left", hl.dsp.focus({ direction = "left" }))

-- Move focus right
hl.bind(mainMod .. " + " .. "right", hl.dsp.focus({ direction = "right" }))

-- Move focus up
hl.bind(mainMod .. " + " .. "up", hl.dsp.focus({ direction = "up" }))

-- Move focus down
hl.bind(mainMod .. " + " .. "down", hl.dsp.focus({ direction = "down" }))


-- Switch workspaces with mainMod + [0-9]
hl.bind(mainMod .. " + " .. 1, hl.dsp.focus({ workspace = 1 }))
-- Switch to workspace 1
hl.bind(mainMod .. " + " .. 2, hl.dsp.focus({ workspace = 2 }))
-- Switch to workspace 2
hl.bind(mainMod .. " + " .. 3, hl.dsp.focus({ workspace = 3 }))
-- Switch to workspace 3
hl.bind(mainMod .. " + " .. 4, hl.dsp.focus({ workspace = 4 }))
-- Switch to workspace 4
hl.bind(mainMod .. " + " .. 5, hl.dsp.focus({ workspace = 5 }))
-- Switch to workspace 5
hl.bind(mainMod .. " + " .. 6, hl.dsp.focus({ workspace = 6 }))
-- Switch to workspace 6
hl.bind(mainMod .. " + " .. 7, hl.dsp.focus({ workspace = 7 }))
-- Switch to workspace 7
hl.bind(mainMod .. " + " .. 8, hl.dsp.focus({ workspace = 8 }))
-- Switch to workspace 8
hl.bind(mainMod .. " + " .. 9, hl.dsp.focus({ workspace = 9 }))
-- Switch to workspace 9
hl.bind(mainMod .. " + " .. 0, hl.dsp.focus({ workspace = 10 }))
-- Switch to workspace 10

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 1, hl.dsp.window.move({ workspace = 1 }))
--  Move window to workspace 1
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 2, hl.dsp.window.move({ workspace = 2 }))
--  Move window to workspace 2
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 3, hl.dsp.window.move({ workspace = 3 }))
--  Move window to workspace 3
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 4, hl.dsp.window.move({ workspace = 4 }))
--  Move window to workspace 4
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 5, hl.dsp.window.move({ workspace = 5 }))
--  Move window to workspace 5
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 6, hl.dsp.window.move({ workspace = 6 }))
--  Move window to workspace 6
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 7, hl.dsp.window.move({ workspace = 7 }))
--  Move window to workspace 7
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 8, hl.dsp.window.move({ workspace = 8 }))
--  Move window to workspace 8
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 9, hl.dsp.window.move({ workspace = 9 }))
--  Move window to workspace 9
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 0, hl.dsp.window.move({ workspace = 10 }))
--  Move window to workspace 10

-- Move Workspace focus
--
-- Right
hl.bind(mainMod .. " + " .. "H", hl.dsp.focus({ workspace = "m-1" }))
-- Left
hl.bind(mainMod .. " + " .. "L", hl.dsp.focus({ workspace = "r+1" }))

-- Move active window to next/previous monitor
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.exec_cmd("hyprctl dispatch movecurrentworkspacetomonitor +1"))
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.exec_cmd("hyprctl dispatch movecurrentworkspacetomonitor -1"))

-- Scroll workspaces 
hl.bind(mainMod .. " + " .. "mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move active window to a special "hidden" workspace
hl.bind(mainMod .. " + " .. "MINUS", hl.dsp.window.move({ workspace = "special:hidden" }))
-- Toggle the special hidden workspace to view/restore your windows
hl.bind(mainMod .. " + " .. "EQUAL", hl.dsp.workspace.toggle_special("hidden"))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })

-- Move window
hl.bind(mainMod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })
