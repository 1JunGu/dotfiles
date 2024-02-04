-- Please check `lua/core/settings.lua` to view the full list of configurable settings
local settings = {}

-- Examples
settings["use_ssh"] = true

-- Available values are: `catppuccin`, `catppuccin-latte`, `catppucin-mocha`, `catppuccin-frappe`, `catppuccin-macchiato`.
settings["colorscheme"] = "catppuccin-macchiato"

settings["lsp_deps"] = function(defaults)
	return {
		defaults[0], -- "bash_ls"
		defaults[5], -- "lua_ls"
		"fortls",
		"pyright",
	}
end

settings["null_ls_deps"] = function(defaults)
	return {
		defaults[3], --prettier for javascript, JSON, HTML, markdown
		defaults[4], --shfmt for shell
		defaults[5], --stylua for lua
		defaults[6], --vint for vim script
		"ruff", --python
		"fprettify", --fortran
	}
end

settings["dap_deps"] = function(defaults)
	return {
		defaults[0], -- C-Family
		defaults[1], -- Python (debugpy)
	}
end

settings["treesitter_deps"] = function(defaults)
	return {
		defaults[0], --bash
		defaults[1], --c
		defaults[2], --cpp
		defaults[6], --html
		defaults[8], --json
		defaults[9], --latex
		defaults[10], --lua
		defaults[11], --make
		defaults[12], --markdown
		defaults[13], --markdown_inline
		defaults[14], --python
		defaults[19], --yaml
		"fortran",
	}
end

return settings
