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
  
-- just aim for a good color when using a file manager tui
-- config.color_scheme = 'AdventureTime'
config.color_scheme = 'Aura (Gogh)'
-- config.color_scheme = 'Sythwave (Gogh)'
-- config.color_scheme = 'Neon Night (Gogh)'
-- https://wezfurlong.org/wezterm/config/appearance.html

-- font
-- wezterm ls-fonts
--   - use this command to see font info
-- wezterm ls-fonts --list-system
--   - generates copy-pastable configs based on the fonts the system has installed!
-- config.font = wezterm.font('Monofoki')
-- WezTerm bundles JetBrains Mono, Nerd Font Symbols and Noto Color Emoji
--   - this is why the file manager's icons show up!

config.font = wezterm.font_with_fallback {
  'Monofoki',
  'Consolas', -- vs-code default
  -- 'DengXian',
  -- 'JetBrains Mono', -- wezterm fallsback to this automatically
}
-- The default fallback includes the popular Nerd Font Symbols font, which means that you don't need to use specially patched fonts to use the powerline or Nerd Fonts symbol glyphs.
-- WezTerm will still append its default fallback to whatever list you specify, so you needn't worry about replicating that list if you set your own fallback.

-- config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
-- font ligature options to play with..

config.font_size = 9

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





-- Slightly transparent and blurred background
config.window_background_opacity = 0.75
config.text_background_opacity = 0.10 -- HOLY SHIT, amazing!
config.macos_window_background_blur = 30

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
