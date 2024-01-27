local wezterm = require "wezterm"
local act = wezterm.action

local keybinds = require("key-bindings")
local fonts    = require("fonts")
local apperance= require("apperance")


wezterm.on('augment-command-palette', function(window, pane)
  return {
    {
      brief = 'Rename tab',
      icon = 'md_rename_box',

      action = act.PromptInputLine {
        description = 'Enter new name for tab',
        action = wezterm.action_callback(function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end),
      },
    },
  }
end)

local config = {}
    ----General
    config.audible_bell="Disabled" --disable bell sound
    config.hide_mouse_cursor_when_typing = true
    config.command_palette_font_size =14.5

    ---- styling inactive panes
    --inactive_pane_hsb = {
    --    saturation = 0.9,
    --    brightness = 0.8,
    --},
    ---- window
    --char_select_fg_color = '#000000',

    -----The Launcher Menu
    ----default_domain = "WSL:Ubuntu",
    ----default_prog = {'powershell'},
    ----launch_menu = {
    ----  { label = 'PowerShell Desktop', args = { 'powershell' } },
    ----  { label = 'Command Prompt', args = { 'cmd' } },
    ----  { label = 'Ubuntu', args = { 'wsl' } },
    ----},

    ---- domains
    --ssh_domains = {},
    ----wsl_domains = {
    ----    {
    ----        name = 'WSL:Ubuntu',
    ----        distribution = 'Ubuntu',
    ----        username = 'jungu',
    ----    }
    ----},

    -- Use the defaults as a base
    --hyperlink_rules = wezterm.default_hyperlink_rules(),
    --
-- Use the defaults as a base
--config.hyperlink_rules = wezterm.default_hyperlink_rules()

keybinds.append(config)
fonts.append(config)
apperance.append(config)

return config
