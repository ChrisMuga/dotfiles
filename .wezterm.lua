-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
	-- You can specify some parameters to influence the font selection;
	-- for example, this selects a Bold, Italic font variant.
	config.font = wezterm.font('JetBrains Mono', { weight = 500 })
	config.font_size = 12
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Cai'
config.window_background_opacity = 0.9


-- and finally, return the configuration to wezterm
return config
