---@module 'hl'

-- --- XDG Desktop Portal ---
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- --- NVIDIA / CUDA (2026 Optimized) ---
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")

-- Fixes window metadata sync on new drivers
hl.env("__GL_VR_ALLOWED", 0)

-- --- Toolkits ---
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", 1)
-- Force Qt Quick to use hardware acceleration via Vulkan
hl.env("QMLSCENE_DEVICE", "vulkan")

-- Ensure the integrated Intel card is preferred for desktop rendering
-- hl.env("__EGL_VENDOR_LIBRARY_FILENAMES", "/usr/share/glvnd/egl_vendor.d/50_intel.json")

--env = QT_AUTO_SCREEN_SCALE_FACTOR,1
hl.env("GDK_SCALE", 1)
hl.env("MOZ_ENABLE_WAYLAND", 1)
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("OZONE_PLATFORM", "wayland")

-- --- Appearance & Misc ---
hl.env("XCURSOR_SIZE", 24)
hl.env("XCURSOR_THEME", "nordicCursor")
hl.env("HYPRCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_THEME", "nordicCursor")
hl.env("APPIMAGELAUNCHER_DISABLE", 1)

hl.config({
    xwayland = {
        enabled = true,
        force_zero_scaling = true,
    },
})

-- Exec (run every reload)
hl.on("config.reloaded", function()
    hl.exec_cmd("gsettings set org.gnome.desktop.wm.preferences theme \"Nordic\"")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme \"Nordic\"")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\"")
end)
