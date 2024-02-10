local wezterm = require("wezterm")
local act = wezterm.action
local target = wezterm.target_triple
-----
----x86_64-pc-windows-mscv - Windows
----x86_64-apple-darwin    - macOS (Intel)
----aarch64-apple-darwin   - macOS (Apple Silicon)
----x86_64-unknown-linux-gnua - Linux
-----
local mod = {}
if target == "x86_64-pc-windows-msvc" then
	mod.SUPER = 'ALT' -- to not conflict with Windows key shortcuts
	mod.SUPER_REV = 'CTRL'
elseif target == "x86_64-apple-darwin" then
	mod.SUPER = 'SUPER' --CMD
	mod.SUPER_REV = 'SUPER'
end

local M = {}

-- Disabled: Make the status always flashing
--
-- Show which key table is active in the status area
--wezterm.on("update-right-status", function(window, _)
--    local message = ""
--    if window:leader_is_active() then
--        message = "⌛" .. message
--    end
--    window:set_right_status(message or "")
--end)

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, _)
    local name = window:active_key_table()
    if name then
        name = "⌛" .. name
    end
    window:set_right_status(name or "")
end)

-- Copy text under selection then clear the selection.
function M.copy_and_clear_selection(window, pane)
    local has_selection = window:get_selection_text_for_pane(pane) ~= ""
    if has_selection then
        window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
        window:perform_action(act.ClearSelection, pane)
        window:toast_notification("Wezterm", "Text copied to clipboard.", nil, 2000)
    end
end

function M.append(config)
    local options = {
        disable_default_key_bindings = true, 
        disable_default_mouse_bindings = false, --use default mouse bindings

        quick_select_alphabet = "qwerty", -- default: qwerty
        --
        -- Disable Mouse mappings
        --
        --mouse_bindings = {
        --    -- Change the default click behavior so that it populates
        --    -- the Clipboard rather the PrimarySelection.
        --    {
        --        event = { Up = { streak = 1, button = "Left" } },
        --        mods = "NONE",
        --        action = wezterm.action_callback(function(window, pane)
        --            M.copy_and_clear_selection(window, pane)
        --        end),
        --    },
        --    -- Ctrl-click will open the link under the mouse cursor
        --    {
        --        event = { Up = { streak = 1, button = "Left" } },
        --        mods = "CTRL",
        --        action = act.OpenLinkAtMouseCursor,
        --    },
        --    -- Scrolling up while holding CTRL increases the font size
        --    {
        --        event = { Down = { streak = 1, button = { WheelUp = 1 } } },
        --        mods = "CTRL",
        --        action = act.IncreaseFontSize,
        --    },
        --    -- Scrolling down while holding CTRL decreases the font size
        --    {
        --        event = { Down = { streak = 1, button = { WheelDown = 1 } } },
        --        mods = "CTRL",
        --        action = act.DecreaseFontSize,
        --    },
        --    -- Ctrl + mouse middle button reset font size
        --    {
        --        event = { Down = { streak = 1, button = "Middle" } },
        --        mods = "CTRL",
        --        action = act.ResetFontSize,
        --    },
        --},
        --
        -- Keyboard mappings
        --
        -- timeout_milliseconds defaults to 5000
        -- send lead key to `CTL + a`
        leader = { key = "a", mods = "CTRL", timeout_milliseconds = 5000 },
        --Remap keys
        keys = {
            { key = "f", mods = "LEADER", action = "QuickSelect" },
            { key = "/", mods = "LEADER", action = act({ Search = { CaseInSensitiveString = "" } }) },
            { key = "C", mods = "CTRL", action = act({ CopyTo = "Clipboard" }) },
            { key = "Insert", mods = "SHIFT", action = act.PasteFrom('Clipboard') }, -- Windows keyboad
            { key = "v", mods = mod.SUPER, action = act.PasteFrom('Clipboard') }, -- macOS keyboard
            { key = 'C', mods = mod.SUPER, action = act.ActivateCopyMode },

            { key = "PageUp", mods = "", action = act.ScrollByPage(-1) },
            { key = "PageDown", mods = "", action = act.ScrollByPage(1) },
            --tab behaviours
            { key = "W", mods = mod.SUPER_REV, action = act({ CloseCurrentTab = { confirm = false } }) }, -- close without confirmation
            { key = "t", mods = mod.SUPER_REV, action = act({ SpawnTab = "CurrentPaneDomain" }) },
            { key = "T", mods = mod.SUPER_REV, action = act({ SpawnTab = "DefaultDomain" }) },
            { key = "1", mods = mod.SUPER, action = act.ActivateTab(1 - 1) },
            { key = "2", mods = mod.SUPER, action = act.ActivateTab(2 - 1) },
            { key = "3", mods = mod.SUPER, action = act.ActivateTab(3 - 1) },
            { key = "4", mods = mod.SUPER, action = act.ActivateTab(4 - 1) },
            { key = "9", mods = mod.SUPER, action = act.ActivateLastTab },
            --command palette
            { key = "P", mods = mod.SUPER_REV, action = act.ActivateCommandPalette },
	    --Launch menu
            { key = "s", mods = "ALT", action = act.ShowLauncher },
            { key = "9", mods = "ALT", action = act.ShowLauncherArgs {flags = 'FUZZY|DOMAINS|KEY_ASSIGNMENTS'} },
            --reload configrations
            { key = "r", mods = mod.SUPER_REV, action = "ReloadConfiguration" },
	    --Spawn window
            { key = "N", mods = mod.SUPER_REV, action = act.SpawnWindow },
	    --Change font size
	    { key = '=', mods = mod.SUPER_REV, action = act.IncreaseFontSize },
	    { key = '-', mods = mod.SUPER_REV, action = act.DecreaseFontSize },
	    { key = '0', mods = mod.SUPER_REV, action = act.ResetFontSize },


            --key tables
            {
                key = "p",
                mods = "LEADER",
                action = act.ActivateKeyTable({
                    name = "pane",
                    one_shot = false,
                }),
            },
            {
                key = "s",
                mods = "LEADER",
                action = act.ActivateKeyTable({
                    name = "scroll",
                    one_shot = false,
                }),
            },
        },

        key_tables = {
            --tab = {
            --    {
            --        key = "r",
            --        action = act.PromptInputLine({
            --            description = "Enter new tab name:",
            --            action = wezterm.action_callback(function(window, _, line)
            --                if line then
            --                    window:active_tab():set_title(line)
            --                end
            --            end),
            --        }),
            --    },
            --    { key = "Escape", action = "PopKeyTable" },
            --    { key = "Return", action = "PopKeyTable" },
            --},
            pane = {
                -- Vertical in Wezterm is different than Emacs/Neovim
                { key = "-", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
                { key = "|", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },

                { key = "x", action = act({ CloseCurrentPane = { confirm = true } }) },
                { key = "z", action = act.TogglePaneZoomState },

                { key = "RightArrow", action = act({ ActivatePaneDirection = "Right" }) },
                { key = "DownArrow", action = act({ ActivatePaneDirection = "Down" }) },
                { key = "UpArrow", action = act({ ActivatePaneDirection = "Up" }) },
                { key = "LeftArrow", action = act({ ActivatePaneDirection = "Left" }) },

                { key = "h", action = act({ ActivatePaneDirection = "Left" }) },
                { key = "j", action = act({ ActivatePaneDirection = "Down" }) },
                { key = "k", action = act({ ActivatePaneDirection = "Up" }) },
                { key = "l", action = act({ ActivatePaneDirection = "Right" }) },

                { key = "Return", action = "PopKeyTable" },
                { key = "Escape", action = "PopKeyTable" },
            },
            scroll = {
                { key = "b", mods = "CTRL", action = act({ ScrollByPage = -1 }) },
                { key = "f", mods = "CTRL", action = act({ ScrollByPage = 1 }) },

                { key = "PageUp", action = act.ScrollByPage(-0.5) },
                { key = "PageDown", action = act.ScrollByPage(0.5) },

                { key = "u", mods = "CTRL", action = act.ScrollByPage(-0.5) },
                { key = "d", mods = "CTRL", action = act.ScrollByPage(0.5) },

                { key = "Return", action = "PopKeyTable" },
                { key = "Escape", action = "PopKeyTable" },
            },
            copy_mode = {
                {
                    key = "y",
                    mods = "NONE",
                    action = wezterm.action_callback(function(window, pane)
                        M.copy_and_clear_selection(window, pane)
                    end),
                },

                { key = "c", mods = "CTRL", action = act.CopyMode("Close") },
                { key = "Escape", mods = "NONE", action = act.CopyMode("Close") },

                { key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
                { key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
                { key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
                { key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },

                { key = "LeftArrow", mods = "NONE", action = act.CopyMode("MoveLeft") },
                { key = "DownArrow", mods = "NONE", action = act.CopyMode("MoveDown") },
                { key = "UpArrow", mods = "NONE", action = act.CopyMode("MoveUp") },
                { key = "RightArrow", mods = "NONE", action = act.CopyMode("MoveRight") },

                { key = "f", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
                { key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWordEnd") },
                { key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },

                { key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
                { key = "$", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
                { key = "^", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") },

                { key = " ", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
                { key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
                { key = "V", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Line" }) },
                { key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },

                { key = "G", mods = "NONE", action = act.CopyMode("MoveToScrollbackBottom") },
                { key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },

                { key = "H", mods = "NONE", action = act.CopyMode("MoveToViewportTop") },
                { key = "M", mods = "NONE", action = act.CopyMode("MoveToViewportMiddle") },
                { key = "L", mods = "NONE", action = act.CopyMode("MoveToViewportBottom") },

                { key = "o", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEnd") },
                { key = "O", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },

                { key = "b", mods = "CTRL", action = act.CopyMode("PageUp") },
                { key = "f", mods = "CTRL", action = act.CopyMode("PageDown") },

                { key = "u", mods = "CTRL", action = act.CopyMode({ MoveByPage = -0.5 }) },
                { key = "d", mods = "CTRL", action = act.CopyMode({ MoveByPage = 0.5 }) },

                { key = "PageUp", action = act.ScrollByPage(-0.5) },
                { key = "PageDown", action = act.ScrollByPage(0.5) },
            },
        },
    }

    for key, value in pairs(options) do
        config[key] = value
    end
end

return M
