-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Use fish as default shell
config.default_prog = { '/usr/local/bin/fish', '-l' }

-- Use fira mono font
config.font = wezterm.font 'Fira Mono'

-- and finally, return the configuration to wezterm
return config
