local wezterm = require "wezterm"
local act = wezterm.action

local M = {}

local function prompt_tab_title(window, pane)
  window:perform_action(
    act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(prompt_window, _, line)
        if line and line ~= '' then
          prompt_window:active_tab():set_title(line)
        end
      end),
    },
    pane
  )
end

function M.setup()
  wezterm.on('spawn-tab-with-title', function(window, pane)
    window:perform_action(act.SpawnTab 'CurrentPaneDomain', pane)
    prompt_tab_title(window, pane)
  end)

  wezterm.on('augment-command-palette', function(window, pane)
    return {
      {
        brief = 'Rename tab',
        icon  = 'md_rename_box',

        action = act.PromptInputLine {
          description = 'Enter new name for tab',
          action = wezterm.action_callback(function(window, pane, line)
            if line and line ~= '' then
              window:active_tab():set_title(line)
            end
          end),
        },
      },
    }
  end)
end

return M
