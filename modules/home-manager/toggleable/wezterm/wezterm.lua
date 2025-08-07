local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 25

config.font_size = 14

local my_rose_pine = wezterm.color.get_builtin_schemes()['rose-pine']
my_rose_pine.background = '#141318'

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

return config
