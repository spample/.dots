---@module 'hl'

-- See https://wiki.hyprland.org/Configuring/Variables/ for more

hl.config({
    decoration = {
        rounding = 10,
        dim_inactive = true,
        dim_strength = 0.1,
        inactive_opacity = 0.9,
        blur = {
            enabled = true,
            size = 4,
            passes = 2,
        },
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
    },
})
