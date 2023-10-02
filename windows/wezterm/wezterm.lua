local wezterm = require("wezterm")
local act = wezterm.action
local default_font = wezterm.font("Terminess Nerd Font", {
	weight = "Medium",
	style = "Normal",
})

return {
	color_scheme = "Catppuccin Mocha",
	-- color_scheme = "Dracula (Official)",

	default_prog = {
		"pwsh.exe",
		"-NoLogo",
	},
	font = default_font,
	font_size = 10.5,
	launch_menu = {},
	leader = { key = "b", mods = "CTRL" },
	disable_default_key_bindings = true,
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	window_decorations = "RESIZE",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	-- unix_domains = {
	-- 	{
	-- 		name = "unix",
	-- 	},
	-- },
	-- default_gui_startup_args = { "connect", "unix" },

	keys = {
		{
			key = "-",
			mods = "LEADER",
			action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
		},
		{
			key = "|",
			mods = "LEADER|SHIFT",
			action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},
		{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
		{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ key = "p", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = -1 }) },
		{ key = "n", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = 1 }) },
		{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
		{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
		{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
		{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
		{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
		{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
		{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
		{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
		{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
		{ key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
		{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
		{ key = "n", mods = "SHIFT|CTRL", action = "ToggleFullScreen" },
		{ key = "v", mods = "SHIFT|CTRL", action = wezterm.action.PasteFrom("Clipboard") },
		{ key = "c", mods = "SHIFT|CTRL", action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
		{ key = "p", mods = "WIN|ALT", action = wezterm.action.SendString("\\p") },
		{ key = "o", mods = "WIN|ALT", action = wezterm.action.SendString("\\o") },
		{ key = "f", mods = "WIN|ALT|SHIFT", action = wezterm.action.SendString("\\f") },
		{ key = ".", mods = "WIN|ALT", action = wezterm.action.SendString(" ca") },
		{ key = "A", mods = "WIN|SHIFT", action = wezterm.action.SendString("\\\x1b[65;1u") },

		{
			mods = "LEADER|SHIFT",
			key = "h",
			action = wezterm.action.ActivateKeyTable({
				name = "resize_pane",
				timeout_milliseconds = 1000,
				one_shot = false,
			}),
		},
		{
			mods = "LEADER|SHIFT",
			key = "j",
			action = wezterm.action.ActivateKeyTable({
				name = "resize_pane",
				timeout_milliseconds = 1000,
				one_shot = false,
			}),
		},
		{
			mods = "LEADER|SHIFT",
			key = "k",
			action = wezterm.action.ActivateKeyTable({
				name = "resize_pane",
				timeout_milliseconds = 1000,
				one_shot = false,
			}),
		},
		{
			mods = "LEADER|SHIFT",
			key = "l",
			action = wezterm.action.ActivateKeyTable({
				name = "resize_pane",
				timeout_milliseconds = 1000,
				one_shot = false,
			}),
		},
	},

	key_tables = {
		resize_pane = {
			{ key = "h", mods = "SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
			{ key = "l", mods = "SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },
			{ key = "k", mods = "SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
			{ key = "j", mods = "SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
		},
	},

	mouse_bindings = {
		-- Change the default selection behavior so that it only selects text,
		-- but doesn't copy it to a clipboard or open hyperlinks.
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "NONE",
			action = wezterm.action({ ExtendSelectionToMouseCursor = "Cell" }),
		},
		-- Don't automatically copy the selection to the clipboard
		-- when double clicking a word
		{
			event = { Up = { streak = 2, button = "Left" } },
			mods = "NONE",
			action = "Nop",
		},
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = "OpenLinkAtMouseCursor",
		},
	},

	set_environment_variables = {},
}
