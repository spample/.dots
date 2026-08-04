---@module 'hl'

-- Workspace assignments

hl.workspace_rule({
    workspace = 1,
    monitor = "DP-2",
    default = true,
})

hl.workspace_rule({
    workspace = 2,
    monitor = "DP-3",
    default = true,
})

hl.workspace_rule({
    workspace = 3,
    monitor = "DP-2",
})

hl.workspace_rule({
    workspace = 4,
    monitor = "DP-3",
})

hl.workspace_rule({
    workspace = 5,
    monitor = "DP-2",
})
