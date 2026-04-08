local wezterm = require "wezterm"

local general    = require("configs.general")
local keybinds   = require("configs.key-bindings")
local fonts      = require("configs.fonts")
local appearance = require("configs.appearance")
local command    = require("configs.command_palette")

local config = wezterm.config_builder()

general.append(config)
keybinds.append(config)
fonts.append(config)
appearance.append(config)
command.setup()

return config
