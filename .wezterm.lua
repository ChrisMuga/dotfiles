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
	config.font = wezterm.font('JetBrainsMonoNL Nerd Font', { weight = 500 })
	config.font_size = 14
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:

-- Dark themes 
-- config.color_scheme = 'Cai'
-- config.color_scheme = 'matrix'
-- config.color_scheme = 'Rosé Pine (Gogh)'
-- config.color_scheme = 'Kanagawa (Gogh)'
-- config.color_scheme = 'darkermatrix'
-- config.color_scheme = 'darkmoss (base16)'
config.color_scheme = 'UnderTheSea'

-- Light Theme
-- config.color_scheme = 'Solarized (light) (terminal.sexy)'
-- config.color_scheme = 'Londontube (light) (terminal.sexy)'
-- config.color_scheme = 'Rosé Pine Dawn (Gogh)'

-- Transparency
-- config.window_background_opacity = 0.85

-- MacOS fullscreen transitions
config.native_macos_fullscreen_mode = true

-- Hyperlinks
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- Key bindings
config.keys = {
	-- Activate the next tab
	  {
		key = 'RightArrow',
		mods = 'CMD',
		action = wezterm.action.ActivateTabRelative(1) ,
	  },
	-- Activate the previous tab
	  {
		key = 'LeftArrow',
		mods = 'CMD',
		action = wezterm.action.ActivateTabRelative(-1) ,
	  },
}

return config
