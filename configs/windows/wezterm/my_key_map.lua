-- wezterm show-keys --lua > show-keys.txt

-- TODO:
-- import my key-mappings for windows terminal:
  -- only missing these:
  -- d = duplicate pane mapping
  -- a = select all
  -- m = mark-mode feature
-- merge my configs from fish
  -- add alt+left/right arrow for cd -/cd -
  --   - this was an example in the docs somewhere..

local wezterm = require 'wezterm'

local module = {} -- the table to return/export to the main script (wezterm.lua)
local act = wezterm.action

-- just use one modifier key
-- NOTE: ctrl is used for inputting terminal signals (such as clear scrollback), but only when you're actually in the terminal cli
-- NOTE: config.leader key is already set in the main config file
local mod_key = 'ALT' -- default value NOTE: set value in main config using set_mod_key('LEADER')
  -- TODO: decide leader vs alt
    -- at the moment, i don't need alt, so no need to change yet..
    -- alt+j/k to change pane focus feels better than leader+j/k
  -- TODO: need to add a pop-up menu feature
local mod_shift_key = mod_key..'|SHIFT'

-- TODO: TEMP: until i decided if i want leader or not, needed for quicker pane navigation (jk)
-- local mfu_mod_key = 'ALT' -- vs ALT|SHIFT, for most frequently used mappings

-- public function, used to set leader or main mod key
-- function module.mod_key -- public var would be simpler..
function module.set_mod_key(v)
    mod_key = v
end

local function get_mod_key() -- local function, not public/module
  -- cross-platform solution
  -- https://github.com/KevinSilvester/wezterm-config/blob/master/config/bindings.lua

  -- local mod = {}

  -- if platform.is_mac then
  --    mod.SUPER = 'SUPER'
  --    mod.SUPER_REV = 'SUPER|CTRL'
  -- elseif platform.is_win or platform.is_linux then
     -- mod.SUPER = 'ALT' -- to not conflict with Windows key shortcuts
     -- mod.SUPER_REV = 'ALT|CTRL'
  -- end
end

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


    
    -- functions to map
    -- see https://wezfurlong.org/wezterm/config/lua/keyassignment/index.html
    -- TODO: go through the list
      -- maybe ActivateKeyTable is a pop-up key-mapping menu?
      -- RotatePanes looks cool too
      -- action = act.Multiple {...} for multiple actions to a single key-mapping


      
    -- BEGIN my additional mappings

    -- newly added mappings (not mapped by default):
    
    -- i/o similar to vi/helix mappings for jump-list
    { key = 'i', mods = mod_key, action = wezterm.action.ActivateLastTab },
    { key = 'o', mods = mod_key, action = wezterm.action.ActivateLastTab },
    -- '[]' are set for prev/next tab

  
    -- changes to default mappings:

    -- to match my older custom hjkl mappings
    -- split panes and moving between them:
    -- { key = 'h', mods = mod_key, action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
    -- { key = 'l', mods = mod_key, action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
      -- currently matches my helix mappings: next/prev buffer -> next/prev tab
    -- { key = 'h', mods = mfu_mod_key, action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
      -- NOTE: TODO: PR: split vertical and horizontal are flipped
    -- { key = 'l', mods = mfu_mod_key, action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
      -- TODO: need refactor another set of shortcuts for non-leader key


    -- to match my newer custom helix mappings
    { key = 'j', mods = mod_key, action = act.ActivatePaneDirection 'Next' },
    { key = 'k', mods = mod_key, action = act.ActivatePaneDirection 'Prev' },
    -- { key = 'j', mods = mfu_mod_key, action = act.ActivatePaneDirection 'Next' },
    -- { key = 'k', mods = mfu_mod_key, action = act.ActivatePaneDirection 'Prev' },
      -- TODO: need refactor another set of shortcuts for non-leader key
      -- find the function for next/previous pane for j/k instead of directions
      -- https://wezfurlong.org/wezterm/config/lua/keyassignment/ActivatePaneDirection.html?h=activate+pane+next
        -- NOTE: hidden within the same function!
        -- NOTE: 'Prev' not 'Previous'

    { key = 'h', mods = mod_key, action = act.ActivateTabRelative(-1) },
    { key = 'l', mods = mod_key, action = act.ActivateTabRelative(1) },

    -- to match default helix mappings
    { key = 's', mods = mod_key, action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
      -- used for quick select
    { key = 'v', mods = mod_key, action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
      -- TODO: TEST: s/v vs h/l, can then use h/l for next/prev buffer vs mod+shift+h/l

    -- directional pane movement
    -- { key = 'h', mods = mod_key, action = act.ActivatePaneDirection 'Left' },
    -- { key = 'j', mods = mod_key, action = act.ActivatePaneDirection 'Up' },
    -- { key = 'k', mods = mod_key, action = act.ActivatePaneDirection 'Down' },
    -- { key = 'l', mods = mod_key, action = act.ActivatePaneDirection 'Right' },
    -- END my additional mappings





    -- MAJOR FEATURES

    -- using default bindings:
    { key = 'f', mods = mod_key, action = act.Search 'CurrentSelectionOrEmptyString' },
    { key = 'z', mods = mod_key, action = act.TogglePaneZoomState },
      -- toggle to hide other window panes! very useful!!
      -- h for hide is used, m is used by minimize, f for focus is used by find/search, alt-mnemonic z for zen


    
    -- changed bindings:
    { key = 'phys:Space', mods = mod_shift_key, action = act.ActivateCommandPalette },
      -- space -> space in helix, c+s+p in vs-code, mod+p by default
      -- TODO: check how to represent space
      -- TODO: alt+space used by windows for showing the basic menu to alter windows, including move window, and anyway, this seems more like an experimental feature.. also, s matches select-mode in helix
        -- TEMP: FIX: using mod+shift

    { key = 'c', mods = mod_key, action = act.ActivateCopyMode },
      -- still have to press v to go to select-mode, then y to yank, which will automatically kick you back to normal terminal cli mode
      -- x is default and used by leader key, c is used by copy, v (for vi-mode) used by vertical split and paste after that, z is used by zoom state
      -- z matches view-mode in helix
      -- NOTE: currently using x to TEST: leader key

    -- { key = 's', mods = mod_key, action = act.QuickSelect },
      -- space was default, s used by horizontal split
      -- only works for links..??
      -- WARN: quick-select-mode is currently unmapped

    { key = 'd', mods = mod_key, action = act.ShowDebugOverlay },
      -- l was default, l is used by split vertical, same as the browser shortcut for javascript debug console


    -- additional mappings
    { key = 'p', mods = mod_shift_key, action = act.ActivateCommandPalette },
      -- extra mapping to match vs-code

    { key = '/', mods = mod_key, action = act.Search 'CurrentSelectionOrEmptyString' },
      -- extra mapping to match vi/helix

    
    -- MAIN FUNCTIONS
    -- mostly uses default keys, just changed modifier to use alt instead of ctrl
    -- https://wezfurlong.org/wezterm/config/default-keys.html
    { key = 'y', mods = mod_key, action = act.CopyTo 'Clipboard' },
      -- c was default? now used for copy-mode
    -- NOTE: k was the default, using k for something else NOTE: c+l is the default for most terminals, c+[lettered-signal], so don't need this
    -- { key = ';', mods = mod_key, action = act.ClearScrollback 'ScrollbackOnly' },
    -- { key = 'l', mods = mod_key, action = act.ShowDebugOverlay },
      -- changed to d and mapped above
    { key = 'm', mods = mod_key, action = act.Hide },
    { key = 'n', mods = mod_key, action = act.SpawnWindow },
      -- matches helix by default
      -- TODO: new window vs tab?
    { key = 'r', mods = mod_key, action = act.ReloadConfiguration },
      -- seems to reload automatically..
    { key = 't', mods = mod_key, action = act.SpawnTab 'CurrentPaneDomain' },
      -- also a good default
    { key = 'u', mods = mod_key, action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
      -- NOTE: select smiley??
    { key = 'p', mods = mod_key, action = act.PasteFrom 'Clipboard' },
      -- changed from v, used by vertical split
    { key = 'q', mods = mod_key, action = wezterm.action.CloseCurrentPane { confirm = true }, },
      -- extra mapping
    { key = 'w', mods = mod_key, action = wezterm.action.CloseCurrentPane { confirm = true }, },
      -- the most sane defaults ever!! go wez wez wehhhhzz
      -- i started a poll to decide using this as the default over close current tab
      -- https://github.com/wez/wezterm/discussions/6151
    -- { key = 'w', mods = mod_key, action = act.CloseCurrentTab{ confirm = true } },
      -- NOTE: replaced with above, better, saner function

        -- vi-like, might need tho..
    { key = '[', mods = mod_key, action = act.ActivateTabRelative(-1) },
    { key = ']', mods = mod_key, action = act.ActivateTabRelative(1) },










    
    -- BEGIN edited generated default mappings
    -- NOTE: moved out main letter-bindings above

    -- okay, alt+tab used by os
    { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
    { key = 'Tab', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
    { key = 'Enter', mods = mod_key, action = act.ToggleFullScreen },

    -- tab crap
    -- { key = '!', mods = 'CTRL', action = act.ActivateTab(0) },
    -- { key = '!', mods = 'SHIFT|CTRL', action = act.ActivateTab(0) },

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
    -- { key = '^', mods = 'CTRL', action = act.ActivateTab(5) },
    -- { key = '^', mods = 'SHIFT|CTRL', action = act.ActivateTab(5) },

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

    { key = '+', mods = mod_key, action = act.IncreaseFontSize },
    { key = '=', mods = mod_key, action = act.IncreaseFontSize },
    { key = '-', mods = mod_key, action = act.DecreaseFontSize },
    { key = '0', mods = mod_key, action = act.ResetFontSize },

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

    -- deleted CTRL, SHIFT|CTRL bindings here
    -- TODO: file issue: defaults used capital letters, though, not sure why the SHIFT mod is needed then..

    -- deleted SUPER, SHIFT|SUPER, SHIFT|CTRL bindings here

    -- extra
    -- { key = '{', mods = 'SUPER', action = act.ActivateTabRelative(-1) },
    -- { key = '{', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(-1) },
    -- { key = '}', mods = 'SUPER', action = act.ActivateTabRelative(1) },
    -- { key = '}', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(1) },

    -- { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },

    -- special keys:
    -- i don't even think i have this on my laptop's keyboard..
    -- maybe can allow using non-alt mod keys here..
    { key = 'PageUp', mods = mod_key, action = act.ActivateTabRelative(-1) },
    { key = 'PageDown', mods = mod_key, action = act.ActivateTabRelative(1) },

    -- probably won't have more than a single horizontal split. rather just use temporary windows 'n tabs instead of further splitting.. so i doubt i'll need to use this much.. next/prev pane via j/k should be enough most of the time, and so these use mod+shift instead of just mod
    { key = 'LeftArrow', mods = mod_shift_key, action = act.ActivatePaneDirection 'Left' },
    { key = 'RightArrow', mods = mod_shift_key, action = act.ActivatePaneDirection 'Right' },
    { key = 'UpArrow', mods = mod_shift_key, action = act.ActivatePaneDirection 'Up' },
    { key = 'DownArrow', mods = mod_shift_key, action = act.ActivatePaneDirection 'Down' },

    { key = 'LeftArrow', mods = mod_key, action = act.AdjustPaneSize{ 'Left', 1 } },
    { key = 'RightArrow', mods = mod_key, action = act.AdjustPaneSize{ 'Right', 1 } },
    { key = 'UpArrow', mods = mod_key, action = act.AdjustPaneSize{ 'Up', 1 } },
    { key = 'DownArrow', mods = mod_key, action = act.AdjustPaneSize{ 'Down', 1 } },

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
      { key = 'b', mods = mod_key, action = act.CopyMode 'MoveBackwardWord' },
      { key = 'b', mods = 'CTRL', action = act.CopyMode 'PageUp' },
      { key = 'c', mods = 'CTRL', action = act.Multiple{ 'ScrollToBottom', { CopyMode =  'Close' } } },
      { key = 'd', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (0.5) } },
      { key = 'e', mods = 'NONE', action = act.CopyMode 'MoveForwardWordEnd' },
      { key = 'f', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = false } } },
      { key = 'f', mods = mod_key, action = act.CopyMode 'MoveForwardWord' },
      { key = 'f', mods = 'CTRL', action = act.CopyMode 'PageDown' },
      { key = 'g', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackTop' },
      { key = 'g', mods = 'CTRL', action = act.Multiple{ 'ScrollToBottom', { CopyMode =  'Close' } } },
      { key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
      { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown' },
      { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveUp' },
      { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight' },
      { key = 'm', mods = mod_key, action = act.CopyMode 'MoveToStartOfLineContent' },
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
      { key = 'LeftArrow', mods = mod_key, action = act.CopyMode 'MoveBackwardWord' },
      { key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'MoveRight' },
      { key = 'RightArrow', mods = mod_key, action = act.CopyMode 'MoveForwardWord' },
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
