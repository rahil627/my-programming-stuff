function fish_user_key_bindings
  # note: config file is run before this function!
  
  # default fzf bindings (see .fzf/shell/key-bindings.fish)
  # i think upon install it copies it's contents to functions/fzf_key_bindings.fish
  # then it's called here:
  fzf_key_bindings
  
  # unbind default fzf bindings
  # TODO: maybe just not run the above function at all?
  bind -e \ct
  bind -e \cr
  bind -e \ec
  # for insert mode of vim mode
  if bind -M insert > /dev/null 2>&1
    bind -e -M insert \ct
    bind -e -M insert \cr
    bind -e -M insert \ec
  end

end
