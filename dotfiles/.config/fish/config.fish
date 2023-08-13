# not status is-interactive || exit
if not status is-interactive
	return 1
end

# Commands to run in the startup of interactive sessions can go here
function bind-keys
  # use vi key bindings instead of the default emacs key bindings
  # note: this ERASES ALL PREVIOUS BINDINGS by default!
  fish_vi_key_bindings

  # optional: can combine the default/emacs bindings
  # Execute this once per mode that emacs bindings should be used in
  #fish_default_key_bindings -M insert

  # Then execute the vi-bindings so they take precedence when there's a conflict.
  # Without --no-erase fish_vi_key_bindings will default to
  # resetting all bindings.
  # The argument specifies the initial mode (insert, "default" or visual).
  #fish_vi_key_bindings --no-erase insert


  # remove default fzf bindings (see .fzf/shell/key-bindings.fish)
  # not sure where it's getting called... .fzf.fish plugin?
  bind -e \ct fzf-file-widget
  bind -e \cr fzf-history-widget
  bind -e \ec fzf-cd-widget
  # for insert mode of vim mode
  if bind -M insert > /dev/null 2>&1
    bind -e -M insert \ct fzf-file-widget
    bind -e -M insert \cr fzf-history-widget
    bind -e -M insert \ec fzf-cd-widget
  end

# add new fzf bindings
  bind \ef fzf-file-widget
  bind \eh fzf-history-widget
  bind \ec fzf-cd-widget
  if bind -M insert > /dev/null 2>&1
    bind -M insert \ef fzf-file-widget
    bind -M insert \eh fzf-history-widget
    bind -M insert \ec fzf-cd-widget
  end
end


bind-keys

# not sure.. maybe for reverse search?
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash




