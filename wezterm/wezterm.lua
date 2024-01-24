local wezterm = require 'wezterm'
local config = {
    ---Fonts
    font_size = 14,
    font = wezterm.font("Fira Code", {weight="Regular"}), --or FiraCode Nerd Font Mono
    --window_decorations = "RESIZE",
    --macos_window_background_blur = 0.9,

    text_background_opacity = 0.9,

    ---Colors
    color_scheme = 'Catppuccin Mocha', -- or Mocha, Macchiato, Frappe, Latte which are Catppuccin series
    --color_scheme = 'Sea Shells', -- or Mocha, Macchiato, Frappe, Latte which are Catppuccin series

    ---Apperance
    -- tab bar
    enable_tab_bar = true,
    use_fancy_tab_bar = true,
    hide_tab_bar_if_only_one_tab = false,
    tab_bar_at_bottom = false,
    window_frame = {
        font = wezterm.font{family = 'Fira Code', weight = 'Bold', italic= false},
        font_size = 10.5,
        active_titlebar_bg = '#033333',
        inactive_titlebar_bg = '#933333'
    },
    show_tab_index_in_tab_bar = true,
    switch_to_last_active_tab_when_closing_tab = true,
    show_new_tab_button_in_tab_bar = true,
    -- window padding
    window_decorations = "INTEGRATED_BUTTONS",
    integrated_title_button_alignment = "Right",
    integrated_title_buttons = { 'Hide','Maximize', 'Close' },
    integrated_title_button_color = "Auto", -- or "Red", "#434343"
    integrated_title_button_style = "Gnome",
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    -- styling inactive panes
    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.8,
    },
    -- window background opacity
    window_background_opacity = 0.9,
    -- scrollbar
    enable_scroll_bar = true,
    -- fps
    animation_fps = 60,
    max_fps = 60,
    -- window
    adjust_window_size_when_changing_font_size = false,
    window_close_confirmation = 'NeverPrompt',

    ---The Launcher Menu
    --default_domain = "WSL:Ubuntu",
    --default_prog = {'powershell'},
    launch_menu = {
      { label = 'PowerShell Desktop', args = { 'powershell' } },
      { label = 'Command Prompt', args = { 'cmd' } },
      { label = 'Ubuntu', args = { 'wsl' } },
    },

    -- domains
    ssh_domains = {},
    --wsl_domains = {
    --    {
    --        name = 'WSL:Ubuntu',
    --        distribution = 'Ubuntu',
    --        username = 'jungu',
    --    }
    --},

    audible_bell="Disabled", --disable bell sound
}

return config