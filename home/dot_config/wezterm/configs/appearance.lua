--apperance configurations
local wezterm = require "wezterm"
local target  = wezterm.target_triple

--local colors = require("colors.iTerm2") --use DIY color scheme hosted in colors dir
local colors = wezterm.color.get_builtin_schemes()['Catppuccin Frappe']
colors.scrollbar_thumb = '#f6f2eb' -- evident scrollbar
--colors.cursor_bg = 'white'
--colors.cursor_fg = 'green'

local M = {}
function M.append(config)
    local options = {
	----FPS
	animation_fps = 60,
	max_fps = 120,

	----Colors
	colors = colors, --self defined colors
		--color_scheme = 'Catppuccin Frappe', -- or Mocha, Macchiato, Frappe, Latte which are Catppuccin series
		--color_scheme = 'Gruvbox Light', -- or Argonaut, Arthur

	----Scrollbar
	enable_scroll_bar = true,
	scrollback_lines = 10000, --defauls: 3500
	min_scroll_bar_height = "5%",

	----Window
	window_close_confirmation = 'NeverPrompt',
	---window background
	--window_background_gradient = {
	--    orientation = 'Horizontal',
	--    --colors = { '#EEBD89', '#D13ABD' },
	--    preset = 'Blues', --Greys, Blues, RdBu
	--    interpolation = 'Linear', --Basis, CatmullRom
	--    noise = 8,
	--    blend = 'Rgb',
	--},
	window_background_opacity = 0.98,

	----window decorations
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",
	----integrated title buttons
    integrated_title_buttons = { 'Hide','Maximize', 'Close' },
    integrated_title_button_alignment = "Right",
	--integrated_title_button_style = "Windows", --The default value is "MacOsNative" on macOS systems, but "Windows" on other systems.
	integrated_title_button_color = "Auto", -- or "Red", "#434343"

	----window padding
	window_padding = { left = 0, right = 10, top = 0, bottom = 0 },

	----Tab bar
    use_fancy_tab_bar = true,
    enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab   = false,
	show_new_tab_button_in_tab_bar = false,
    show_tab_index_in_tab_bar = true,
	show_tabs_in_tab_bar = true,
    switch_to_last_active_tab_when_closing_tab = true,
    tab_bar_at_bottom = false,
	---window frame, affect the fancy tab bar
	window_frame = {
		font = wezterm.font { family = 'FiraCode Nerd Font', weight = 'Bold' },
		font_size = 13,
		-- The overall background color of the tab bar when the window is focused
		active_titlebar_bg   = '#cccccc',
		inactive_titlebar_bg   = '#cccccc',

	},
	
	----Text cursor
	default_cursor_style = 'BlinkingBlock', -- options: "BlinkingBlock", "SteadyBlock", "BlinkingUnderline", "SteadyUnderline", "BlinkingBar", "SteadyBar"
	--cursor_thickness = "150%", --for Bar and Underline

    ----styling inactive panes
    inactive_pane_hsb = {
		saturation = 0.8,
		brightness = 0.5,
    },
    }

    for key, value in pairs(options) do
        config[key] = value
    end
end 
return M
