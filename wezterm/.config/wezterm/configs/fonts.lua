local wezterm = require "wezterm"
local target = wezterm.target_triple

local M = {}
function M.append(config)
    local options = {
	--font_size = 14,
	font = wezterm.font("Fira Code", {weight="Medium"}), --or FiraCode Nerd Font Mono

    }
    if target == "x86_64-pc-windows-msvc" then
        options.font_size = 14

    elseif target == "x86_64-apple-darwin" then
        options.font_size = 15
    end

    for key, value in pairs(options) do
        config[key] = value
    end
 end 
 return M


