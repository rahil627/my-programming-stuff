# not status is-interactive || exit
if not status is-interactive
	return 1
end

# NOTE: set these vars!
set --local config_path ~/.config/fish/



# OLD ALIASES -------------------------
#! /usr/bin/fish

# NOTE: this is not necessarily a dotfile, as you don't need it, just run it upon updating it

# fish .aliases-fish

# NOTE: if you remove an alias from here, the function still remains
# TODO: this doesn't work... :/ i ended up deleting the function file manually from the ~/.config/fish/functions file
# create our own delete function (including alias)?? :/
# https://stackoverflow.com/questions/36699092/how-to-remove-functions-from-fishshell-without-deleting-the-function-file-direct
# functions --erase command # or -e

# notes:
# add -s flag to all alias -s commands, then run this file as a fish script
# alias -s -s <alias -sname> "command(s)" # or --save
# this will create functions (all commands are functions in fish)
# and they will automatically lazy-load
# otherwise, if you do it the bash/zsh way and throw it all in a file,
# it will load them all into the shell's memory (maybe that's the functionality without the -s flag)
# https://stackoverflow.com/questions/2762994/define-an-alias -s-in-fish-shell
# END OLD



# NOTE: don't use the name of an actual command, it won't override, it'll just execute twice!

# try cover all options: verbose and short

# fish functions
# save the longer functions first! in case you want to alias them
#source functions.fish # pwd = home dir (~/ or /home/ra)
source $config_path'functions.fish' # hella confusing string concatenation!!..
# TODO: NOTE: at the moment, this creates the functions every-time the shell is started

# fish commands
# TODO: what to do about commands that require input?
#alias -s unalias='functions --erase'




# abbreviations > aliases

# basic shell signals
# https://fishshell.com/docs/current/language.html#event
#   - TODO: should make functions via 'function --on-signal'
# https://fishshell.com/docs/current/cmds/trap.html
# for now, just add commands and/or bindings
abbr -a c 'clear -x' # scroll buffer up, c+l triggers clear by default
abbr -a ca 'clear' # clear scrollback buffer
abbr -a q 'exit' # control+q

# basic file system commands
# add --interactive, --verbose, and --parents flags
abbr -a mv 'mv -iv' # --interactive --verbose
abbr -a cp 'cp -iv'
abbr -a cpr 'cp -ivr' # --recursive
abbr -a cpa 'cp -iv --parents' # not the same as -p TODO: having problems...
abbr -a mkdir 'mkdir -pv'
abbr -a mkd 'mkdir -pv'
# mkcd declared in functions.fish
abbr -a rm 'rm -iv'
abbr -a rmr 'rm -rfv' # -i and -v asks for every file, use -f to skip that
abbr -a rmdir 'rmdir -v'
abbr -a rmd 'rmdir -v'

# TODO: finish configing the ls commands
# TODO: should use core unix commands? ls > exa?
abbr -a l 'eza'
abbr -a la 'eza -a' # --all
abbr -a ll 'eza -l' # long (no --long flag)
abbr -a lla 'eza -la'
abbr -a ld 'eza -D' # WARNING: TODO: ld is a command-line tool!
abbr -a lda 'eza -D -a'





# super useful fuzzy search functions
# TODO: test these
# TODO: should create my own simple aliases/functions and then bind them here
abbr -a vf 'nvim $(fzf)' # vs typing 'nvim' then pressing fzf-file-widget binding
#abbr -a cdt 'cd $(find * -type d | fzf)' # vs fzf-cd-widget
#abbr -a gct 'git checkout $(git branch -r | fzf)'






# contemporary replacements

# if debian (too difficult: https://unix.stackexchange.com/questions/6345/how-can-i-get-distribution-name-and-version-number-in-a-simple-shell-script)
# don't do distro-only conditionals, just jump straight to nix :)
#abbr -a bat 'batcat' # debian has a package named bat already, so they named it batcat, wtf

abbr -a h 'tldr' # vs t, m
abbr -a fuzzy 'fzf'
# note: ripgrep defaults might affect everything that uses it (fzf, nvim, etc.)
# -i   --ignore-case
abbr -a rg 'rg -i'
abbr -a rgh 'rg -i --hidden' # --no-ignore-dot ??, also the -i is duplicated to no ill effect
abbr -a ripgrep 'rg -i' # rg is the actual command for the ripgrep package
#abbr -a fd 'fdfind' # package uses fd command on arch, fdfind on debian
#abbr -a f 'fdfind'
abbr -a d 'delta'


# apps
abbr -a v 'nvim' # control+v binding? alt+e for $EDITOR by default in fish
abbr -a vi 'nvim --noplugin'
abbr -a vim 'nvim --noplugin'
abbr -a neovim 'nvim'
abbr -a e 'doom run' # emacs
#abbr -a emacs 'doom run' # works without this

# (f)ile 'n' directory navigator / explorer
#abbr -a f 'lf'
abbr -a f 'lfcd' # also c+f binding; NOTE: requires lfcd function
# WARNING: lfcd doesn't show autocomplete/autosuggest of lf flags

abbr -a ai 'tgpt' # openai's chatGPT
abbr -a chatgpt 'tgpt'


# dev
abbr -a hx 'haxe'
abbr -a rb 'ruby'
abbr -a cr 'crystal'
abbr -a ex 'elixir'
# bash
# fish


# experimental
function alias-tree-list
  # TODO: experimenting with this...
  # note: DO NOT replace the original commands, bash scripts need to execute them!
  abbr -a lt 'eza --tree --git-ignore'
  abbr -a lat 'eza --tree --all --git-ignore' # vs lta
  abbr -a lat1 'eza --tree --all --git-ignore --level 1'
  abbr -a lat2 'eza --tree --all --git-ignore --level 2'
  abbr -a lat3 'eza --tree --all --git-ignore --level 3'
  abbr -a llt 'eza --tree --all --long --git-ignore' # vs llat, llta

  # these two are great
  abbr -a ldt 'eza --tree -D --git-ignore'
  abbr -a ldat 'eza --tree -D --all --git-ignore'
end
alias-tree-list


function alias-git
  # git, ordered by git work-flow
  abbr -a gs 'git status'
  #abbr -a gp 'git pull' # conflicts with push, although you fetch 'n pull more
  abbr -a gpull 'git pull'
  abbr -a gd 'git diff' # delta?
  abbr -a gdh 'git diff HEAD' # delta?
  abbr -a ga 'git add'
  abbr -a gaa 'git add -A'
  abbr -a gc 'git commit'
  abbr -a gca 'git commit -a'
  abbr -a gcam 'git commit -a -m "no message"'
  abbr -a gpush 'git push'

  # can just write small shell scripts this way, avoiding writing a function file (which mostly consists of crap generated by these aliases)
  abbr -a gfuckit 'git add -A; git commit -m "(> \'.\')>"; git push;'

  #abbr -a g? 'git clone'
  #abbr -a gb 'git branch'
  #abbr -a gf 'git fetch'
  #abbr -a gs 'git stash'
  #abbr -a gr 'git rebase'
  #abbr -a gt 'git log --graph --oneline --all'
end
alias-git

















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
