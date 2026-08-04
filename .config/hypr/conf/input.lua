---@module 'hl'

-- For all categories, see https://wiki.hyprland.org/Configuring/Variables/

hl.config({
    input = {
        kb_layout = "us",
        follow_mouse = 1,
        accel_profile = "flat",
        touchpad = {
            natural_scroll = true,
            disable_while_typing = false,
            tap_to_click = true,
        },
        sensitivity = -0.5,
        -- -1.0 - 1.0, 0 means no modification.
    },
})

hl.device({
    name = "razer-razer-basilisk-v3",
    sensitivity = -1.0,
})

hl.device({
    name = "razer-basilisk-v3-pro-keyboard-1",
    sensitivity = -1.0,
})

hl.device({
    name = "cherry-2.4g-wireless-receiver-mouse",
    sensitivity = -0.8,
})
