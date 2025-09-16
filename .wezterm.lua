-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

local JETBRAINSMONO = "JetBrainsMono Nerd Font Mono"
local LEKTON = "Lekton Nerd Font Mono"
local TERMINESS = "Terminess Nerd Font"
local PROPO = "3270 Nerd Font Propo"
local IOSEVKA = "IosevkaTerm Nerd Font"

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
	-- You can specify some parameters to influence the font selection;
	-- for example, this selects a Bold, Italic font variant.
	-- config.font = wezterm.font('JetBrainsMono Nerd Font Mono', { weight = 460 })
	-- config.font = wezterm.font('3270 Nerd Font Mono', { weight = 500 })
	-- config.font = wezterm.font(JETBRAINSMONO, { weight = 500 })
	-- config.font = wezterm.font(IOSEVKA, { weight = 500 })
	-- config.font_size = 16
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.window_background_opacity = 0.9
-- config.color_scheme = "Cai"
-- config.color_scheme = "matrix"
-- config.color_scheme = 'Materia (base16)'
-- config.color_scheme = "Mono Amber (Gogh)"
-- config.color_scheme = 'Material Vivid (base16)'
-- config.color_scheme = 'Seafoam Pastel (Gogh)'
-- config.color_scheme = 'Silk Light (base16)'

-- Key bindings
config.keys = {
	-- Activate the next tab
	{
		key = "RightArrow",
		mods = "CMD",
		action = wezterm.action.ActivateTabRelative(1),
	},
	-- Activate the previous tab
	{
		key = "LeftArrow",
		mods = "CMD",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	-- Spawning Panes
	{
		key = "r",
		mods = "ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "ALT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- Pane navigation
	{
		key = "LeftArrow",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	-- Pane resizing
	{
		key = "LeftArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Left", 1 }),
	},
	{
		key = "RightArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Right", 1 }),
	},
	{
		key = "UpArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Up", 1 }),
	},
	{
		key = "DownArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Down", 1 }),
	},
}

config.front_end = "OpenGL"

-- and finally, return the configuration to wezterm
return config
