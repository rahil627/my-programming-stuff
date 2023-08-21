# not status is-interactive || exit
if not status is-interactive
	return 1
end

# Commands to run in the startup of interactive sessions can go here
function bind-keys
  # use vi key bindings instead of the default emacs key bindings
  # note: this ERASES ALL PREVIOUS BINDINGS by default!
  fish_vi_key_bindings

  # '/' = grep history, not as good as fzf though
  # '[' and ']' go to previous/next command with the token currently under the cursor

  # optional: can combine the default/emacs bindings
  # Execute this once per mode that emacs bindings should be used in
  #fish_default_key_bindings -M insert

  # Then execute the vi-bindings so they take precedence when there's a conflict.
  # Without --no-erase fish_vi_key_bindings will default to
  # resetting all bindings.
  # The argument specifies the initial mode (insert, "default" or visual).
  #fish_vi_key_bindings --no-erase insert


# keep bindings here, so it's easy to remember n change
# add new fzf bindings
# \e = alt
  bind \ef fzf-file-widget # a+f = fzf find file-path
  bind \eh fzf-history-widget # a+h = fzf command history
  bind \ec fzf-cd-widget # a+c = cd + fzf find file-path
  # same for vi-mode's insert mode
  if bind -M insert > /dev/null 2>&1
    bind -M insert \ef fzf-file-widget
    bind -M insert \eh fzf-history-widget
    bind -M insert \ec fzf-cd-widget
  end

  # alt+r = vi-mode's replace mode

  bind \cf lf # c+f = file manager

  if bind -M insert > /dev/null 2>&1 # not sure... just copied
    bind -M insert \cf lf
  end
  

end




bind-keys

# only necessary after updating aliases file
# source ~/.config/fish/aliases.fish


# set appearance
# can use 'fish_config' command to set up the fish shell using a web-based gui

# use this to help you find a theme, displaying text within your terminal
# fish_config theme show
# fish_config theme choose [theme_name]

set -g fish_greeting "herro little fishy :)
don't forget to go toward nature,
toward yourself,
toward the life you used to live"


