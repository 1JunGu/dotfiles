local wezterm = require "wezterm"

local target = wezterm.target_triple

local M = {}

function M.append(config)
	local options = {
	    ----General
	    automatically_reload_config = true,
	    audible_bell="Disabled", --disable bell sound
	    hide_mouse_cursor_when_typing = true,
	    command_palette_font_size =14.5,
	    --Use the defaults as a base
	    hyperlink_rules = wezterm.default_hyperlink_rules(),
	    }

	    if target == "x86_64-pc-windows-msvc" then
	        options.default_prog = {'powershell'}
    	        --options.default_domain = "WSL:Ubuntu"
	        -----The Launcher Menu
	    	options.launch_menu = {
	    	  { label = 'PowerShell Desktop', args = { 'powershell' } },
	    	  { label = 'Command Prompt', args = { 'cmd.exe' } },
	    	  { label = 'Ubuntu', args = { 'wsl' } },
	    	}

	    elseif target == "x86_64-apple-darwin" then
	        options.default_prog = {'zsh'}
	    end

   for key, value in pairs(options) do
       config[key] = value
   end
end 
return M

