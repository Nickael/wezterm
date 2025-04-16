-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Apply a custom light color scheme
config.colors = {
  foreground = "#3B4252",  -- Darker text for readability
  background = "#ECEFF4",  -- Light background for clarity
  cursor_bg = "#5E81AC",
  cursor_fg = "#ECEFF4",
  cursor_border = "#5E81AC",
  selection_fg = "#2E3440",
  selection_bg = "#D8DEE9",
  scrollbar_thumb = "#A3BE8C",
  split = "#A3BE8C",
  ansi = {
    "#4C566A", "#BF616A", "#A3BE8C", "#EBCB8B",
    "#5E81AC", "#B48EAD", "#88C0D0", "#ECEFF4"
  },
  brights = {
    "#2E3440", "#BF616A", "#A3BE8C", "#EBCB8B",
    "#5E81AC", "#B48EAD", "#8FBCBB", "#D8DEE9"
  },
}

-- Keeping your other configurations
config.color_scheme = "OneHalfLight"  -- Ensuring proper light theme compatibility
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.cursor_blink_rate = 300
config.default_cursor_style = "BlinkingBlock"
config.window_padding = {
  left = 0, right = 0, top = 2, bottom = 0,
}
config.window_frame = {
  font = wezterm.font({ family = "Roboto", weight = "Bold" }),
  font_size = 12.0,
  active_titlebar_bg = "#E5E9F0",
  inactive_titlebar_bg = "#D8DEE9",
}
config.default_prog = { "/usr/bin/zsh", "-l" }
config.keys = {
  { key = "e", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "o", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "a", mods = "LEADER|CTRL", action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }) },
  { key = "x", mods = "CTRL|SHIFT", action = wezterm.action.TogglePaneZoomState },
}
config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = wezterm.action.CompleteSelectionOrOpenLinkAtMouseCursor 'Clipboard',
  },
}
config.launch_menu = {
  { args = { "top" } },
  { label = "Bash", args = { "/usr/bin/bash -i -l", "-l" } },
  { label = "Zsh", args = { "/bin/zsh -i -l", "-l" } },
}

-- Return the configuration
return config

