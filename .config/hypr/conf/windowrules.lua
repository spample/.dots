---@module 'hl'
-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
--
-- App Window-Rules
hl.window_rule({
    name  = "flameshot-windowRule",
    match = {
        class = "^(flameshot)$",
    },
    float = true,
    center = true,
    pin = true,
    no_shadow = true,
    border_size = 0,
    rounding = 0,
})

hl.window_rule({
    name  = "clipse-float",
    match = {
        class = "^(clipse)$",
    },
    float = true,
    size = { 622, 652 },
    pin = true,
    center = true,
})

-- --- Opacity ----
hl.window_rule({
    name  = "zen-opacity",
    match = {
        class = "^(zen)$",
    },
    opacity = 1,
})

hl.window_rule({
    name  = "firefox-opacity",
    match = {
        class = "^(firefox)$",
    },
    opacity = 0.95,
})

hl.window_rule({
    name  = "nemo-opacity",
    match = {
        class = "^(nemo)$",
    },
    opacity = "0.85 0.75 ",
})

--windowrule {
--  name = discord-opacity
--  match:class = ^(discord)$
--  opacity = 0.85 0.75
--}
