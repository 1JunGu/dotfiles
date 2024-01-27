local wezterm = require "wezterm"

--local colors = require("colors.iTerm2") --use DIY color scheme
local colors = wezterm.color.get_builtin_schemes()['Catppuccin Frappe']
colors.scrollbar_thumb = '#856D72' -- evident scroobar
--colors.cursor_bg = 'white'
--colors.cursor_fg = 'green'

local M = {}

function M.append(config)
    local options = {
	----FPS
	animation_fps = 60,
	max_fps = 60,

	----Colors
	colors = colors, --self defined colors
    	--color_scheme = 'Catppuccin Frappe', -- or Mocha, Macchiato, Frappe, Latte which are Catppuccin series
    	--color_scheme = 'Gruvbox Light', -- or Argonaut, Arthur

	----Scrollbar
	enable_scroll_bar = true,
	scrollback_lines = 10000, --defauls: 3500
	min_scroll_bar_height = "2%",

	----Window
	window_close_confirmation = 'NeverPrompt',
	---window background
	--window_background_gradient = {
	--    orientation = 'Horizontal',
	--    --colors = { '#EEBD89', '#D13ABD' },
	--    preset = 'RdBu', --Greys, Blues, RdBu
	--    interpolation = 'Linear', --Basis, CatmullRom
	--    noise = 8,
	--    blend = 'Rgb',

	--},
	window_background_opacity = 0.92,
	---window decorations
    	window_decorations = "INTEGRATED_BUTTONS|RESIZE",
        integrated_title_buttons = { 'Hide','Maximize', 'Close' },
        integrated_title_button_alignment = "Right",
    	--integrated_title_button_style = "Gnome",
    	integrated_title_button_color = "Auto", -- or "Red", "#434343"
	---window padding
	window_padding = { left = 0, right = 12, top = 0, bottom = 0 },

	----Tab bar
    	enable_tab_bar = true,
    	hide_tab_bar_if_only_one_tab = false,
	show_new_tab_button_in_tab_bar = true,
    	show_tab_index_in_tab_bar = true,
	show_tabs_in_tab_bar = true,
    	switch_to_last_active_tab_when_closing_tab = true,
    	tab_bar_at_bottom = false,
    	use_fancy_tab_bar = true,

	---window frame
	window_frame = {
		font = wezterm.font { family = 'Fira Code', weight = 'Bold' },
		font_size = 12.0,
		active_titlebar_bg = '#cccccc',
		--inactive_titlebar_bg = '#353535',
	},
	
	----Text cursor
	default_cursor_style = 'SteadyBlock',
	cursor_thickness = "100%",

    }

    for key, value in pairs(options) do
        config[key] = value
    end
 end 
 return M
