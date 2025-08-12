local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

config.initial_cols = 100
config.initial_rows = 25
config.adjust_window_size_when_changing_font_size = false

config.font_size = 14

local my_rose_pine = wezterm.color.get_builtin_schemes()['rose-pine']
my_rose_pine.background = '#0F0F0F'
my_rose_pine.selection_bg = '#404040'
my_rose_pine.selection_fg = '#EA8DC1'

config.color_schemes = {
  ['my-rose-pine'] = my_rose_pine,
  ['my-default'] = my_rose_pine,
}

config.color_scheme = 'my-default'

-- config.window_background_opacity = 0.9

config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

config.scrollback_lines = 10000

config.window_close_confirmation = 'NeverPrompt'

config.disable_default_key_bindings = true
config.keys = {
  -- Essentials
  { key = '=', mods = 'CTRL', action = act.IncreaseFontSize },
  { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
  { key = '0', mods = 'CTRL', action = act.ResetFontSize },
  { key = 'c', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
  { key = 'v', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
  { key = 'f', mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'x', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
  { key = 'l', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },

  -- Compatability binds
  { key = 'Enter', mods = 'CTRL', action = act.SendString '✗' },
  { key = 'Enter', mods = 'CTRL|SHIFT', action = act.SendString '✓' },
  { key = 'i', mods = 'CTRL', action = act.SendString '◆' },
  { key = 'm', mods = 'CTRL', action = act.SendString '▶' },
  { key = ',', mods = 'CTRL', action = act.SendString '★' },
  { key = 'h', mods = 'CTRL|SHIFT', action = act.SendString '●' },
}

return config
