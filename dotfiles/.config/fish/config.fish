if status is-interactive
    # Commands to run in interactive sessions can go here

	# don't need this for fedora, just let it use the default path
    # Install Ruby Gems to ~/gems
    #set -gx PATH $PATH ~/bin
    #set -gx GEM_HOME $HOME/gems
	#set -gx PATH $PATH $HOME/gems/bin
	
	# not sure.. maybe for reverse search?
	#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# remove default fzf bindings
  bind -e \ct fzf-file-widget
  bind -e \cr fzf-history-widget
  bind -e \ec fzf-cd-widget
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


