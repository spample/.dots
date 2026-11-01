---@module 'hl'

-- See https://wiki.hyprland.org/Configuring/Variables/ for more

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        layout = "dwindle",
        resize_on_border = true,
        col = {
            active_border = { colors = { "rgba(C4A1D4ee)", "rgba(7b48d4ee)" }, angle = 135 },
            inactive_border = "rgba(9e89b3aa)",
        },
    },
})
