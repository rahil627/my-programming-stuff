-- edit in config repo, then copy to os
-- cp $my_configs\wezterm $home\.config\ -- TODO: test cp \ vs  \wezterm
-- cp $my_configs\wezterm $home\.config\ -Recurse -Force

-- quickly test configs via cli command:
-- wezterm --config config.color_scheme='Neon Night (Gogh)' -- TODO: not working...

-- debug lua scripts via the debug console!! control+shift+l TODO: -> alt+l

-- TODO:
-- sometimes, especially without internet, everything is slow, especially starting new processes: making splits, starting yazi, helix, etc.; yet, there's no debug errors..
-- set background, see examples in custom configs people posted

-- required
local wezterm = require 'wezterm'
local my_key_map = require 'my_key_map'

-- local config = {}
local config = wezterm.config_builder()

-- some base configs
-- https://alexplescan.com/posts/2024/08/10/wezterm/
  -- a nice little tutorial with the final result provided:
  -- https://gist.github.com/alexpls/83d7af23426c8928402d6d79e72f9401

-- people's custom configs
-- https://github.com/wez/wezterm/discussions/628
  -- "show your wezterm"
  -- https://github.com/wez/wezterm/discussions/628#discussioncomment-10677777
    -- my post
    
-- config goes here

-- keep most commonly altered settings on top



-- set key mappings

-- TODO: ISSUE: quite hidden in the docs
config.disable_default_key_bindings = true

config.leader = { key = 'x', mods = 'ALT', timeout_milliseconds = 1000 }
  -- 1000 is the default
  -- TODO: c+x vs alt+x
  -- alt-x is perfectly aligned on my keyboard!!
my_key_map.set_mod_key('ALT') -- LEADER, ALT is default

-- load my_key_map (from my_key_map.lua) into memory
-- ISSUE: docs 
-- https://github.com/wez/wezterm/issues/6130
config.keys = my_key_map.get_my_key_map().keys
config.key_tables = my_key_map.get_my_key_map().key_tables



config.launch_menu = {
  -- https://wezfurlong.org/wezterm/config/launch.html
  -- Each entry in launch_menu is an instance of a SpawnCommand object.   

  {
    args = { 'helix' },
  },
  {
    -- TODO: just an example
    -- Optional label to show in the launcher. If omitted, a label
    -- is derived from the `args`
    label = 'file manager',
    -- The argument array to spawn.  If omitted the default program
    -- will be used as described in the documentation above
    args = { 'yazi' }, --, '-l' },

    -- You can specify an alternative current working directory;
    -- if you don't specify one then a default based on the OSC 7
    -- escape sequence will be used (see the Shell Integration
    -- docs), falling back to the home directory.
    -- cwd = "/some/path"

    -- You can override environment variables just for this command
    -- by setting this here.  It has the same semantics as the main
    -- set_environment_variables configuration option described above
    -- set_environment_variables = { FOO = "bar" },
  },
}








config.default_prog = { 'pwsh.exe', '-NoLogo' }

-- ISSUE: change name
  -- https://github.com/wez/wezterm/discussions/6152
config.initial_rows = 48 -- 24, i prefer the default small size for floating windows, but longer for coding windows/panes
config.initial_cols = 80 -- 80, i like the small width limit, even when raeding e-books; it's a good constraint. it reminds me of the iPad mini. besides, with word wrapping, there's no problems

-- setting the window position is not simple, so forget it!
--  must get window object from event, then alter it
-- https://github.com/wez/wezterm/issues/256#issuecomment-1177647434
--  can just use windows powertoys to easily set a window to the size of the middle pane for now..
-- window:set_position(1000, 200) -- 2800 x 800 x2 (scale)
  
-- test the file manager tui
-- config.color_scheme = 'Aura (Gogh)'
config.color_scheme = 'Neon Night (Gogh)'
  -- light purple text is pleasant!
-- config.color_scheme = 'AdventureTime'
  -- the blue used for folder names in the file manager tui is hard to see
-- config.color_scheme = 'Sythwave (Gogh)'
-- https://wezfurlong.org/wezterm/config/appearance.html

-- font
-- wezterm ls-fonts
--   - use this command to see font info
-- wezterm ls-fonts --list-system
--   - generates copy-pastable configs based on the fonts the system has installed!
-- config.font = wezterm.font('Monofoki')
-- WezTerm bundles JetBrains Mono, Nerd Font Symbols and Noto Color Emoji
--   - this is why the file manager's icons show up!
-- NOTE: all font is handled by the terminal, not apps
-- stretch = "UltraCondensed" * "ExtraCondensed" * "Condensed" * "SemiCondensed" * "Normal" * "SemiExpanded" * "Expanded" * "ExtraExpanded" * "UltraExpanded".config.
    -- https://github.com/wez/wezterm/discussions/1644
-- weight = ..Light, DemiLight, Book, Regular, Medium, DemiBold, Bold..
-- config.freetype_load_flags = 'NO_HINTING'  -- just trying stuff: turn off anti-aliasing for bitmap fonts
-- WARN: had troubles setting size per-font :/
config.font = wezterm.font_with_fallback {
  -- 'Maple Mono', -- 8-9 -- also really nice!
  -- { family = 'CozetteVector' }, -- CozetteVectorBold
  -- { family = 'Cascadia Code', weight = 'Light' }, -- regular weight is wayyyy too thick!
  -- 'Office Code Pro',
  -- { family = 'Office Code Pro', stretch = 'Condensed', size = 8 }, -- 7 is small but still very readable!, best font ever!! TODO: however, font is much much wider in wezterm compared to vs-code (no matter the size) NOTE: tried font_stretch, but that's not dynamic: you need a specific font set with a different font width
  { family = 'Monofoki', weight = 'Regular' }, -- 9, bold looks great too, though it a bit much like Cascadia Code's default weight
  -- 'Consolas', -- 7-8, vs-code default, lacking line-spacing
  -- 'DengXian',
  -- 'JetBrains Mono', 7 -- wezterm fallsback to this automatically
}
-- The default fallback includes the popular Nerd Font Symbols font, which means that you don't need to use specially patched fonts to use the powerline or Nerd Fonts symbol glyphs.
-- WezTerm will still append its default fallback to whatever list you specify, so you needn't worry about replicating that list if you set your own fallback.

-- config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
-- font ligature options to play with..
config.font_size = 9
-- config.line_height = 1.05 -- TODO: should test with fonts
adjust_window_size_when_changing_font_size = false -- TODO: doesn't work

-- TODO: no seperate colors table to set all this in?
config.command_palette_font_size = 10
-- config.command_palette_fg_color = config.colors.foreground -- colors is a nil value :/

config.command_palette_fg_color = 'purple' -- silver, fuchsia is too bright!
config.command_palette_bg_color = 'rgba(0.5, 0.5, 0.5, .75)' -- default: #333333
  -- just makes it transparent
  -- not the best, but a simple solution for now!.. otherwise just use the defaults by commenting these out, which is white on solid grey

-- bold_brightens_ansi_colors = BrightAndBold/BrightOnly/No
-- https://wezfurlong.org/wezterm/config/lua/config/bold_brightens_ansi_colors.html
-- this is the feature that made text *pop* on mac os! :D





-- slightly transparent background
-- NOTE: unfocused panes have some dimness to them, text and background
-- TODO: play with these values some more
config.window_background_opacity = .75 -- .85, was .7 on windows terminal
config.text_background_opacity = .5 -- if = 1, would need to set background to be transparent in helix theme, 0 is completely transparent for helix for all backgrounds
-- if mac os
-- config.macos_window_background_blur = 30
-- if windows
-- config.win32_system_backdrop = 'Acrylic' -- Auto (Disable by default), Acrylic, Mica, Tabbed, Disable -- TODO: play with some more, seems opaque for all values, even when opacity is set to 0?.. maybe affected by battery saver mode..

-- title bar stuff
-- Removes the title bar, leaving only the tab bar. Keeps
-- the ability to resize by dragging the window's edges.
-- On macOS, 'RESIZE|INTEGRATED_BUTTONS' also looks nice if
-- you want to keep the window controls visible and integrate
-- them into the tab bar.
config.window_decorations = 'RESIZE'


-- tab bar stuff
-- config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

-- Sets the font for the window frame (tab bar)
config.window_frame = {
    -- Berkeley Mono for me again, though an idea could be to try a
      -- serif font here instead of monospace for a nicer look?
        font = wezterm.font({ family = 'Monofoki', weight = 'Bold' }),
          font_size = 7,
}

-- config.window_background_image = '/path/to/wallpaper.jpg'

-- config.window_background_image_hsb = {
--     -- Darken the background image by reducing it to 1/3rd
--     brightness = 0.3,

--     -- You can adjust the hue by scaling its value.
--     -- a multiplier of 1.0 leaves the value unchanged.
--     hue = 1.0,

--     -- You can adjust the saturation also.
--     saturation = 1.0,
-- }










-- return the config table
return config
