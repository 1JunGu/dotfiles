local wezterm = require "wezterm"

local M = {}
function M.append(config)
    local options = {
	font_size = 14,
	font = wezterm.font("Fira Code", {weight="Medium"}), --or FiraCode Nerd Font Mono

    }
    for key, value in pairs(options) do
        config[key] = value
    end
 end 
 return M


