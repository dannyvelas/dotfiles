-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Use fish as default shell
config.default_prog = { '/usr/local/bin/fish', '-l' }

-- Use fira mono font
config.font = wezterm.font 'FiraCode Nerd Font'

-- default font size
config.font_size = 24.0

-- Option should always be Meta never AltGr
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- and finally, return the configuration to wezterm
return config
