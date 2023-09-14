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


# fish's default bindings
# '/' = fish's impl of search command history
# '[' and ']' go to previous/next command with the token currently under the cursor
# TODO: control+r ? overwritten by fzf's default bindings?

# fzf's default bindings
# control+r, control+t, alt+c


# note: config file is run before fish_user_key_bindings

# default fzf bindings (see .fzf/shell/key-bindings.fish)
# i think upon install it copies it's contents to functions/fzf_key_bindings.fish
# then normally it's called in fish_user_key_bindings:
fzf_key_bindings
# it contains both the functions and the bindings

# TODO: binding then unbinding is jank, but you must call fzf_key_bindings for it to create the widget functions inside
#bind --erase --mode --key
bind -e \ct
bind -e \cr # TODO: this is eating up fish's default binding for reverse command history
bind -e \ec
# for insert mode of vim mode
if bind -M insert > /dev/null 2>&1
    bind -e -M insert \ct
    bind -e -M insert \cr
    bind -e -M insert \ec
end


# create fzf bindings myself here, so it's easy to remember 'n change
# \e = alt
# alt+keys to help with terminal stuff
  bind \ef fzf-file-widget # a+f = fzf find file-path
  bind \ed fzf-file-widget # a+d = fzf find file-path aka directory
  bind \eh fzf-history-widget # a+h = fzf command history
  bind \er fzf-history-widget # a+r = fzf command history aka reverse command history
  bind \ec fzf-cd-widget # a+c = cd + fzf find file-path
  # same for vi-mode's insert mode
  if bind -M insert > /dev/null 2>&1
    bind -M insert \ef fzf-file-widget
    bind -M insert \ed fzf-file-widget
    bind -M insert \eh fzf-history-widget
    bind -M insert \er fzf-history-widget
    bind -M insert \ec fzf-cd-widget
  end

  # alt+r = vi-mode's replace mode from normal mode?

  # control+keys for jumping to apps
  bind \cf lf # c+f = file manager
  # TODO: foot terminal doesn't seem to differentiate modifier keys...??
  # bind \cv nvim # c+v = vim, also c+e = EDITOR env var by default on fish

  if bind -M insert > /dev/null 2>&1 # not sure... just copied
    bind -M insert \cf lfcd # function in aliases file
    # bind -M insert \cv nvim
  end


end


# TODO: the bindings might be out of order, put it all in the function!

# NOTE: use fish_key_reader to figure out the key sequence

# fish shell default functions binding remaps
bind \c\r history-pager # also '/'
bind \c\h history-pager

# bind fzf.fish widgets
# be explicit about all bindings here
# TODO: for now, just use alt+shift+char until i know for certain i'm not overwriting anything useful
# NOTE: \c\e doesn't work, must use \e\c
# TODO: try multiple bindings for the same function
fzf_configure_bindings --directory=\eF --history=\eR --processes=\eP --variables=\eV --git_status=\eS --git_log=\eL


bind-keys

# only necessary after updating aliases file
# source ~/.config/fish/aliases.fish

functions --erase bat # TODO: hotfix, not going away for some reason...

# set some vars
set -gx EDITOR nvim # used by fish for alt+e binding
set -gx VISUAL nvim

# TODO: use fd instead of find, and rg instead of grep
# show hidden files (currently using fzf.fish binding to show hidden files)
# https://github.com/junegunn/fzf/issues/337
# for nvim, use this:
# set -gx FZF_DEFAULT_COMMAND 'rg --hidden -l ""' # TODO: not working

# update the fzf.fish plugin to show hidden files
# --no-ignore # what are ignored files?
# does adding -i (case insensitive) do anything here?
set fzf_fd_opts --hidden --exclude=.git
# TODO: might need to create an extra binding for non-hidden files... for now, just use the standard fzf bindings

# update fzf.fish to be case insensitive, and alter the appearance a bit
# this is taken from the default one provided in _fzf_wrapper
# note: it will use whatever this value is if it is set, so you must re-add the default values here
set --export FZF_DEFAULT_OPTS '--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*"'

# these are my additional options
set -x --append FZF_DEFAULT_OPTS '-i --height=100%'
# -i = case insensitive TODO: the default fzf seems to already be case insensitive...
# i think --color=dark by default
# TODO: find a way to have top --margin/padding instead of --height, to fill in the space at the bottom
# there's a bug that when you maximize the screen, the leftover 10% of past commands display wonky, so i just keep it at --height=100%





# set appearance
# can use 'fish_config' command to set up the fish shell using a web-based gui

# use this to help you find a theme, displaying text within your terminal
# fish_config theme show
# fish_config theme choose [theme_name]

set -g fish_greeting "herro little fishy :)
don't forget to go toward nature
toward yourself
toward the life you used to live
toward the life you love
toward the life you so desire everyone to live
a life full of love
a love full of life
and a soul that keeps on giving"




# set up some specific env vars here

# flutter
#fish_add_path -g opt/flutter/bin
#set -gx CHROME_EXECUTABLE /usr/bin/chromium #--incognito"

# ruby
# chruby_fish should've added it to the autoload
# TODO: maybe need to add to bash for vs code?
#source /usr/share/chruby/chruby.sh

#set -gx GEM_HOME "$(gem env user_gemhome)"
set -gx GEM_HOME $(ruby -e 'puts Gem.user_dir')
# /home/ra/.gem/ruby/3.0.0
