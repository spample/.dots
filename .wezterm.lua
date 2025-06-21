local wezterm = require 'wezterm'

return {

  --  Fonts --
  font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Medium" }),
  font_size = 14.0,
  default_prog = { "/usr/bin/zsh" },
  
  -- Transparency --

  window_background_opacity = 0.8,  -- Adjust to your preference (0 = fully transparent, 1 = opaque)
  text_background_opacity = 1.0,     -- Keeps text background solid
  enable_wayland = true,           -- Optional: may help with transparency on X11-based setups

  --  Gradiant Background --

    background = {
    {
	    source = { File = "/home/spample/Documents/Linux-Terminal-Customization-laptop/gradiant-folder/purple-gradient.png" },
      opacity = 0.8,
      width = "100%",
      height = "100%",
	  },
	},

  --  Remove Top Bar  --

  window_decorations = "RESIZE",  -- Removes title bar but keeps window resize handles
  hide_tab_bar_if_only_one_tab = true, -- Hides the tab bar if you only have one tab open

  --  Window Size --

  initial_cols = 100,
  initial_rows = 28,

  window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
  },

  window_frame = {
    font_size = 9,         -- Shrinks the tab bar text
    border_left_width = 0,
    border_right_width = 0,
    border_bottom_height = 0,
    border_top_height = 0,

    border_left_color = "#000000",
    border_right_color = "#000000",
    border_bottom_color = "#000000",
    border_top_color = "#000000",
  },
  
  visual_bell = {
    fade_in_function = "EaseIn",
    fade_out_function = "EaseOut",
    fade_in_duration_ms = 0,
    fade_out_duration_ms = 0,
  },


  default_cursor_style = "BlinkingBlock",

  keys = {
  -- Open a new tab with CTRL+SHIFT+T
  {
    key = "T",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },

  -- Add a keybinding to split the terminal vertically
  {
    key = ">",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },

  -- Add a keybinding to split the terminal horizontally
  {
    key = "<",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },

  -- Close the current pane with CTRL+SHIFT+W
  {
    key = "W",
    mods = "CTRL|SHIFT",
    action = wezterm.action.CloseCurrentPane({ confirm = false }),
  },

  -- Switch to the next pane (CTRL+SHIFT+RightArrow)
  {
    key = "RightArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },

  -- Switch to the previous pane (CTRL+SHIFT+LeftArrow)
  {
    key = "LeftArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },

  -- Switch to the next pane (CTRL+SHIFT+DownArrow)
  {
    key = "DownArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },

  -- Switch to the previous pane (CTRL+SHIFT+UpArrow)
  {
    key = "UpArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
},


window_background_image_hsb = {
  brightness = 0.1,
  hue = 1.0,
  saturation = 1.0,
},

scrollback_lines = 10000,

inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.7,
},

-- Inactive pane color adjustment --
  inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.7,
  },


colors = {
  cursor_bg = "#a37acc",    -- Soft purple
  cursor_fg = "#1a1a1a",
  cursor_border = "#a37acc",
},

mouse_bindings = {
  {
    event = { Up = { streak = 1, button = "Right" } },
    action = wezterm.action.PasteFrom("Clipboard"),
    mods = "NONE",
  },
},

}
