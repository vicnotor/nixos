local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 25

config.font_size = 12

local my_rose_pine = wezterm.color.get_builtin_schemes()['rose-pine']
my_rose_pine.background = '#141318'

config.color_schemes = {
  ['my-rose-pine'] = my_rose_pine,
  ['my-default'] = my_rose_pine,
}

config.color_scheme = 'my-default'

return config
