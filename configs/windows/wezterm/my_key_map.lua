-- wezterm show-keys --lua > show-keys.txt

local wezterm = require 'wezterm'

local module = {} -- the table to return/export to the main script (wezterm.lua)
local act = wezterm.action

-- to use:
-- config.key = my_key_map.keys
-- config.key_tables = my_key_map.key_tables
-- returns a table containing a 'keys' table and 'key_tables'
function module.get_my_key_map() -- don't forget to add it to the module table!!
return { -- TODO: return a table with 'keys' table, or just the 'keys' table?
    keys = {

    -- NOTE: try not to move the shortcuts around, as it will likely generate the same way. it will also make it easier to diff 'n merge newer default key-mappings
      -- add to a key_table? nah, still would have to remove the defaults (non-alt mods)..


    -- some notes:
    -- https://wezfurlong.org/wezterm/config/keys.html#configuring-key-assignments
    -- CMD == WIN == SUPER
    -- OPT == ALT == META
    -- LEADER
      -- special chording, only allows the bindings you set, eats up all other input
      -- https://wezfurlong.org/wezterm/config/keys.html#leader-key

    -- VoidSymbol
      -- the key-code sent when a key is removed by os, such as caps lock

    -- https://wezfurlong.org/wezterm/config/lua/keyassignment/index.html
      -- see all the actions you can assign to a key

    -- https://wezfurlong.org/wezterm/config/default-keys.html
      -- see default keys
      -- wezterm show-keys --lua
        -- copy/pastable to config!
  
    -- was just an example, but keeping it so that the os minimizes everything except the terminal! :p
    -- Turn off the default CMD-m Hide action, allowing CMD-m to
    -- be potentially recognized and handled by the tab

    -- {
    --   key = 'm',
    --   mods = 'CMD',
    --   action = wezterm.action.DisableDefaultAssignment,
    -- },



    -- TODO: import my key-mappings for windows terminal
    
    -- functions to bind
    -- see https://wezfurlong.org/wezterm/config/lua/keyassignment/index.html
    -- TODO: go through the list

    -- main features:
    -- ActivateCopyMode
    -- ActivateCommandPalette
      -- space -> space in helix
      -- c+s+p in vs-code, and by default
    -- alt+space used by windows powertoys launcher
      -- should change to win+space!

      
    -- BEGIN my additional mappings
    -- newly added bindings (not binded by default):
    
    -- will switch back to the last active tab
    -- i/o similar to vi/helix mappings for jump-list
    { key = 'o', mods = 'ALT', action = wezterm.action.ActivateLastTab },

  
    -- changes to original config:


    -- major features

    -- good defaults:
    -- p, command pallete
    -- f, find

    -- l was default, same as the browser shortcut for javascript debug console
    { key = 'd', mods = 'ALT', action = act.ShowDebugOverlay },

    -- TODO: using z temporarily
    -- x was default, c is used by copy, v (for vi-mode) used by paste
    -- z for view pop-up by helix
    { key = 'z', mods = 'ALT', action = act.ActivateCopyMode },

    -- TODO: see docs, don't quite understand how this works..
    { key = 's', mods = 'SHIFT|CTRL', action = act.QuickSelect },



    
    -- split panes and moving between them
    { key = 'h', mods = 'ALT', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
    { key = 'l', mods = 'ALT', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },

    -- find the function for next/previous pane for j/k instead of directions
    -- https://wezfurlong.org/wezterm/config/lua/keyassignment/ActivatePaneDirection.html?h=activate+pane+next
      -- NOTE: hidden within the same function!
    -- NOTE: 'Prev' not 'Previous'
    -- { key = 'h', mods = 'ALT', action = act.ActivatePaneDirection 'Left' },
    { key = 'j', mods = 'ALT', action = act.ActivatePaneDirection 'Next' },
    { key = 'k', mods = 'ALT', action = act.ActivatePaneDirection 'Prev' },
    -- { key = 'l', mods = 'ALT', action = act.ActivatePaneDirection 'Right' },

    -- "Closes the current pane. If that was the last pane in the tab, closes the tab. If that was the last tab, closes that window. If that was the last window, wezterm terminates."
      -- the most sane defaults ever!! go wez wez wehhhhzz
    { key = 'w', mods = 'ALT', action = wezterm.action.CloseCurrentPane { confirm = true }, },
    -- END my additional mappings



    
    -- BEGIN edited generated default mappings
    -- okay
    { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
    { key = 'Tab', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
    { key = 'Enter', mods = 'ALT', action = act.ToggleFullScreen },

    -- tab crap
    { key = '!', mods = 'CTRL', action = act.ActivateTab(0) },
    { key = '!', mods = 'SHIFT|CTRL', action = act.ActivateTab(0) },

    -- changed
    -- { key = '\"', mods = 'ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
    -- { key = '\"', mods = 'SHIFT|ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },

    -- just use next/previous tab instead
    -- { key = '#', mods = 'CTRL', action = act.ActivateTab(2) },
    -- { key = '#', mods = 'SHIFT|CTRL', action = act.ActivateTab(2) },
    -- { key = '$', mods = 'CTRL', action = act.ActivateTab(3) },
    -- { key = '$', mods = 'SHIFT|CTRL', action = act.ActivateTab(3) },
    -- { key = '%', mods = 'CTRL', action = act.ActivateTab(4) },
    -- { key = '%', mods = 'SHIFT|CTRL', action = act.ActivateTab(4) },

    -- weird vim bindings?? or perl!?
    -- { key = '%', mods = 'ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
    -- { key = '%', mods = 'SHIFT|ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },

    -- { key = '&', mods = 'CTRL', action = act.ActivateTab(6) },
    -- { key = '&', mods = 'SHIFT|CTRL', action = act.ActivateTab(6) },

    -- weird vim bindings (cont.)
    -- { key = '\'', mods = 'SHIFT|ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },

    -- { key = '(', mods = 'CTRL', action = act.ActivateTab(-1) },
    -- { key = '(', mods = 'SHIFT|CTRL', action = act.ActivateTab(-1) },
    -- { key = ')', mods = 'CTRL', action = act.ResetFontSize },
    -- { key = ')', mods = 'SHIFT|CTRL', action = act.ResetFontSize },
    -- { key = '*', mods = 'CTRL', action = act.ActivateTab(7) },
    -- { key = '*', mods = 'SHIFT|CTRL', action = act.ActivateTab(7) },

    { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
    { key = '+', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },
    { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
    { key = '-', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },
    { key = '-', mods = 'SUPER', action = act.DecreaseFontSize },
    { key = '0', mods = 'CTRL', action = act.ResetFontSize },
    { key = '0', mods = 'SHIFT|CTRL', action = act.ResetFontSize },
    { key = '0', mods = 'SUPER', action = act.ResetFontSize },

    -- { key = '1', mods = 'SHIFT|CTRL', action = act.ActivateTab(0) },
    -- { key = '1', mods = 'SUPER', action = act.ActivateTab(0) },
    -- { key = '2', mods = 'SHIFT|CTRL', action = act.ActivateTab(1) },
    -- { key = '2', mods = 'SUPER', action = act.ActivateTab(1) },
    -- { key = '3', mods = 'SHIFT|CTRL', action = act.ActivateTab(2) },
    -- { key = '3', mods = 'SUPER', action = act.ActivateTab(2) },
    -- { key = '4', mods = 'SHIFT|CTRL', action = act.ActivateTab(3) },
    -- { key = '4', mods = 'SUPER', action = act.ActivateTab(3) },
    -- { key = '5', mods = 'SHIFT|CTRL', action = act.ActivateTab(4) },

    -- weird vim bindings (cont.)
    -- { key = '5', mods = 'SHIFT|ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },

    -- { key = '5', mods = 'SUPER', action = act.ActivateTab(4) },
    -- { key = '6', mods = 'SHIFT|CTRL', action = act.ActivateTab(5) },
    -- { key = '6', mods = 'SUPER', action = act.ActivateTab(5) },
    -- { key = '7', mods = 'SHIFT|CTRL', action = act.ActivateTab(6) },
    -- { key = '7', mods = 'SUPER', action = act.ActivateTab(6) },
    -- { key = '8', mods = 'SHIFT|CTRL', action = act.ActivateTab(7) },
    -- { key = '8', mods = 'SUPER', action = act.ActivateTab(7) },
    -- { key = '9', mods = 'SHIFT|CTRL', action = act.ActivateTab(-1) },
    -- { key = '9', mods = 'SUPER', action = act.ActivateTab(-1) },
    -- { key = '=', mods = 'CTRL', action = act.IncreaseFontSize },
    -- { key = '=', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },
    -- { key = '=', mods = 'SUPER', action = act.IncreaseFontSize },
    -- { key = '@', mods = 'CTRL', action = act.ActivateTab(1) },
    -- { key = '@', mods = 'SHIFT|CTRL', action = act.ActivateTab(1) },

    -- MAIN FUNCTIONS
    { key = 'C', mods = 'ALT', action = act.CopyTo 'Clipboard' },
    -- { key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
    { key = 'F', mods = 'ALT', action = act.Search 'CurrentSelectionOrEmptyString' },
    -- { key = 'F', mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
    { key = 'K', mods = 'ALT', action = act.ClearScrollback 'ScrollbackOnly' },
    -- { key = 'K', mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
    -- NOTE: changed mapping
    -- { key = 'L', mods = 'ALT', action = act.ShowDebugOverlay },
    -- { key = 'L', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },
    { key = 'M', mods = 'ALT', action = act.Hide },
    -- { key = 'M', mods = 'SHIFT|CTRL', action = act.Hide },
    { key = 'N', mods = 'ALT', action = act.SpawnWindow },
    -- { key = 'N', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
    { key = 'P', mods = 'ALT', action = act.ActivateCommandPalette },
    -- { key = 'P', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },
    { key = 'R', mods = 'ALT', action = act.ReloadConfiguration },
    -- { key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
    { key = 'T', mods = 'ALT', action = act.SpawnTab 'CurrentPaneDomain' },
    -- { key = 'T', mods = 'SHIFT|CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 'U', mods = 'ALT', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
    -- { key = 'U', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
    { key = 'V', mods = 'ALT', action = act.PasteFrom 'Clipboard' },
    -- { key = 'V', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
    -- NOTE: replaced by CloseCurrentPane
    -- { key = 'W', mods = 'ALT', action = act.CloseCurrentTab{ confirm = true } },
    -- { key = 'W', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab{ confirm = true } },
    -- NOTE: replaced with another binding
    -- { key = 'X', mods = 'ALT', action = act.ActivateCopyMode },
    -- { key = 'X', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
    { key = 'Z', mods = 'ALT', action = act.TogglePaneZoomState },
    -- { key = 'Z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },


    
    -- NOTE: SUPER, SHIFT|SUPER, SHIFT|CTRL key-modifiers start here

    -- { key = '[', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(-1) },
    -- { key = ']', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(1) },

    -- why is this even here??
    -- { key = '^', mods = 'CTRL', action = act.ActivateTab(5) },
    -- { key = '^', mods = 'SHIFT|CTRL', action = act.ActivateTab(5) },

    { key = '_', mods = 'ALT', action = act.DecreaseFontSize },
    -- { key = '_', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },

    -- { key = 'c', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
    -- { key = 'c', mods = 'SUPER', action = act.CopyTo 'Clipboard' },
    -- { key = 'f', mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
    -- { key = 'f', mods = 'SUPER', action = act.Search 'CurrentSelectionOrEmptyString' },
    -- { key = 'k', mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
    -- { key = 'k', mods = 'SUPER', action = act.ClearScrollback 'ScrollbackOnly' },
    -- { key = 'l', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },
    -- { key = 'm', mods = 'SHIFT|CTRL', action = act.Hide },
    -- { key = 'm', mods = 'SUPER', action = act.Hide },
    -- { key = 'n', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
    -- { key = 'n', mods = 'SUPER', action = act.SpawnWindow },
    -- { key = 'p', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },
    -- { key = 'r', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
    -- { key = 'r', mods = 'SUPER', action = act.ReloadConfiguration },
    -- { key = 't', mods = 'SHIFT|CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
    -- { key = 't', mods = 'SUPER', action = act.SpawnTab 'CurrentPaneDomain' },
    -- { key = 'u', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
    -- { key = 'v', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
    -- { key = 'v', mods = 'SUPER', action = act.PasteFrom 'Clipboard' },
    -- { key = 'w', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab{ confirm = true } },
    -- { key = 'w', mods = 'SUPER', action = act.CloseCurrentTab{ confirm = true } },
    -- { key = 'x', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
    -- { key = 'z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },

    -- { key = '{', mods = 'SUPER', action = act.ActivateTabRelative(-1) },
    -- { key = '{', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(-1) },
    -- { key = '}', mods = 'SUPER', action = act.ActivateTabRelative(1) },
    -- { key = '}', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(1) },

    -- { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },

    -- special keys:
    -- i don't even think i have this on my laptop's keyboard..
    -- maybe can allow using non-alt mod keys here
    { key = 'PageUp', mods = 'SHIFT', action = act.ScrollByPage(-1) },
    -- { key = 'PageUp', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
    -- { key = 'PageUp', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(-1) },
    { key = 'PageDown', mods = 'SHIFT', action = act.ScrollByPage(1) },
    -- { key = 'PageDown', mods = 'CTRL', action = act.ActivateTabRelative(1) },
    -- { key = 'PageDown', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(1) },

    -- { key = 'LeftArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Left' },
    { key = 'LeftArrow', mods = 'ALT', action = act.AdjustPaneSize{ 'Left', 1 } },
    -- { key = 'RightArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Right' },
    { key = 'RightArrow', mods = 'ALT', action = act.AdjustPaneSize{ 'Right', 1 } },
    -- { key = 'UpArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Up' },
    { key = 'UpArrow', mods = 'ALT', action = act.AdjustPaneSize{ 'Up', 1 } },
    -- { key = 'DownArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Down' },
    { key = 'DownArrow', mods = 'ALT', action = act.AdjustPaneSize{ 'Down', 1 } },

    -- maybe an actually good case for using all the modifiers..
    -- TODO: my keyboard has delete/insert key..
    -- NOTE: PrimarySelection vs Clipboard
    { key = 'Insert', mods = 'SHIFT', action = act.PasteFrom 'PrimarySelection' },
    { key = 'Insert', mods = 'CTRL', action = act.CopyTo 'PrimarySelection' },

    -- copy/paste keys??
    { key = 'Copy', mods = 'NONE', action = act.CopyTo 'Clipboard' },
    { key = 'Paste', mods = 'NONE', action = act.PasteFrom 'Clipboard' },
  },

  -- table within 'keys' table?
  key_tables = {
    copy_mode = {
      { key = 'Tab', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
      { key = 'Tab', mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord' },
      { key = 'Enter', mods = 'NONE', action = act.CopyMode 'MoveToStartOfNextLine' },
      { key = 'Escape', mods = 'NONE', action = act.Multiple{ 'ScrollToBottom', { CopyMode =  'Close' } } },
      { key = 'Space', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
      { key = '$', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
      { key = '$', mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
      { key = ',', mods = 'NONE', action = act.CopyMode 'JumpReverse' },
      { key = '0', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
      { key = ';', mods = 'NONE', action = act.CopyMode 'JumpAgain' },
      { key = 'F', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
      { key = 'F', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
      { key = 'G', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackBottom' },
      { key = 'G', mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
      { key = 'H', mods = 'NONE', action = act.CopyMode 'MoveToViewportTop' },
      { key = 'H', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportTop' },
      { key = 'L', mods = 'NONE', action = act.CopyMode 'MoveToViewportBottom' },
      { key = 'L', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportBottom' },
      { key = 'M', mods = 'NONE', action = act.CopyMode 'MoveToViewportMiddle' },
      { key = 'M', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportMiddle' },
      { key = 'O', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
      { key = 'O', mods = 'SHIFT', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
      { key = 'T', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
      { key = 'T', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
      { key = 'V', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Line' } },
      { key = 'V', mods = 'SHIFT', action = act.CopyMode{ SetSelectionMode =  'Line' } },
      { key = '^', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLineContent' },
      { key = '^', mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },
      { key = 'b', mods = 'NONE', action = act.CopyMode 'MoveBackwardWord' },
      { key = 'b', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
      { key = 'b', mods = 'CTRL', action = act.CopyMode 'PageUp' },
      { key = 'c', mods = 'CTRL', action = act.Multiple{ 'ScrollToBottom', { CopyMode =  'Close' } } },
      { key = 'd', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (0.5) } },
      { key = 'e', mods = 'NONE', action = act.CopyMode 'MoveForwardWordEnd' },
      { key = 'f', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = false } } },
      { key = 'f', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
      { key = 'f', mods = 'CTRL', action = act.CopyMode 'PageDown' },
      { key = 'g', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackTop' },
      { key = 'g', mods = 'CTRL', action = act.Multiple{ 'ScrollToBottom', { CopyMode =  'Close' } } },
      { key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
      { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown' },
      { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveUp' },
      { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight' },
      { key = 'm', mods = 'ALT', action = act.CopyMode 'MoveToStartOfLineContent' },
      { key = 'o', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEnd' },
      { key = 'q', mods = 'NONE', action = act.Multiple{ 'ScrollToBottom', { CopyMode =  'Close' } } },
      { key = 't', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = true } } },
      { key = 'u', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (-0.5) } },
      { key = 'v', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
      { key = 'v', mods = 'CTRL', action = act.CopyMode{ SetSelectionMode =  'Block' } },
      { key = 'w', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
      { key = 'y', mods = 'NONE', action = act.Multiple{ { CopyTo =  'ClipboardAndPrimarySelection' }, { Multiple = { 'ScrollToBottom', { CopyMode =  'Close' } } } } },
      { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PageUp' },
      { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'PageDown' },
      { key = 'End', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
      { key = 'Home', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
      { key = 'LeftArrow', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
      { key = 'LeftArrow', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
      { key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'MoveRight' },
      { key = 'RightArrow', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
      { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'MoveUp' },
      { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'MoveDown' },
    },

    search_mode = {
      { key = 'Enter', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
      { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
      { key = 'n', mods = 'CTRL', action = act.CopyMode 'NextMatch' },
      { key = 'p', mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
      { key = 'r', mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
      { key = 'u', mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
      { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PriorMatchPage' },
      { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'NextMatchPage' },
      { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
      { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
    },
    -- END of generated default mappings

  } -- keys
  -- return keys
} -- return
end

return module
