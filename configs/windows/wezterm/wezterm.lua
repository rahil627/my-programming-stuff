-- edit in config repo, then copy to os
-- cp $my_configs\wezterm $home\.config\

-- required
local wezterm = require 'wezterm'
local config = {}

-- some base configs
-- https://alexplescan.com/posts/2024/08/10/wezterm/
--   - https://gist.github.com/alexpls/83d7af23426c8928402d6d79e72f9401

-- config goes here

config.default_prog = { 'pwsh.exe', '-NoLogo' } -- TODO: what logo?

config.color_scheme = 'Batman'


config.font = wezterm.font('Monofoki')
config.font_size = 8

-- Slightly transparent and blurred background
config.window_background_opacity = 0.9
config.macos_window_background_blur = 30
-- Removes the title bar, leaving only the tab bar. Keeps
-- the ability to resize by dragging the window's edges.
-- On macOS, 'RESIZE|INTEGRATED_BUTTONS' also looks nice if
-- you want to keep the window controls visible and integrate
-- them into the tab bar.
config.window_decorations = 'RESIZE'
-- Sets the font for the window frame (tab bar)
config.window_frame = {
    -- Berkeley Mono for me again, though an idea could be to try a
      -- serif font here instead of monospace for a nicer look?
        font = wezterm.font({ family = 'Monofoki', weight = 'Bold' }),
          font_size = 6,
}

-- return the config table
return config
