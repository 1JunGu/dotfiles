local wezterm = require "wezterm"

local general  = require("configs.general")
local keybinds = require("configs.key-bindings")
local fonts    = require("configs.fonts")
local apperance= require("configs.apperance")
local command  = require("configs.command_palette")

local config = {}

general.append(config)
keybinds.append(config)
fonts.append(config)
apperance.append(config)

return config
