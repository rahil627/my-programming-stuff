-- edit in config repo, then copy to os
-- cp $my_configs\wezterm $home\.config\ -- TODO: test cp \ vs  \wezterm
-- cp $my_configs\wezterm $home\.config\ -Recurse -Force

-- test configs via cli command:
-- wezterm --config config.color_scheme='Neon Night (Gogh)' -- TODO: not working...

-- required
local wezterm = require 'wezterm'
local config = {}

-- some base configs
-- https://alexplescan.com/posts/2024/08/10/wezterm/
--   - https://gist.github.com/alexpls/83d7af23426c8928402d6d79e72f9401

-- config goes here

config.default_prog = { 'pwsh.exe', '-NoLogo' }

-- just aim for a good color when using a file manager tui
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
  'Consolas',
  -- 'DengXian',
}
-- The default fallback includes the popular Nerd Font Symbols font, which means that you don't need to use specially patched fonts to use the powerline or Nerd Fonts symbol glyphs.
-- WezTerm will still append its default fallback to whatever list you specify, so you needn't worry about replicating that list if you set your own fallback.

-- config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
-- font ligature options to play with..

config.font_size = 9

-- bold_brightens_ansi_colors = BrightAndBold/BrightOnly/No
-- https://wezfurlong.org/wezterm/config/lua/config/bold_brightens_ansi_colors.html



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
-- use_fancy_tab_bar = false
hide_tab_bar_if_only_one_tab = true -- TODO: not working
tab_bar_at_bottom = true -- TODO: trying, not working

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



-- https://wezfurlong.org/wezterm/config/launch.html
config.launch_menu = {
  -- Each entry in launch_menu is an instance of a SpawnCommand object.   
  {
    args = { 'helix' },
  },
  {
    -- Optional label to show in the launcher. If omitted, a label
    -- is derived from the `args`
    label = 'Bash',
    -- The argument array to spawn.  If omitted the default program
    -- will be used as described in the documentation above
    args = { 'bash', '-l' },

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




-- return the config table
return config
