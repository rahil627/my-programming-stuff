# not status is-interactive || exit
if not status is-interactive
	return 1
end

# NOTE: set these vars!
set config_path ~/.config/fish/ # --local didn't work in function scope...

# NOTE: only need to build once during setup, then after alteration of aliases or functions
set rebuild no # fish doesn't have booleans :(
#source $config_path'aliases.fish'



# OLD ALIASES -------------------------
# TODO: clean this up
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



# fish commands
# TODO: what to do about commands that require input?
#alias -s unalias='functions --erase'






# TODO: not sure of order: add functions -> add aliases -> add abbrevations -> bind keys -> add env vars ?
# keep abbrs and aliases together for now, for easy editing

function add-functions
  # fish functions
  # save the longer functions first! in case you want to alias them
  #source functions.fish # pwd = home dir (~/ or /home/ra)
  source $config_path'functions.fish' # hella confusing string concatenation!!..
  # TODO: NOTE: at the moment, this creates the functions every-time the shell is started
end
if test $rebuild = yes
  add-functions
end



function add-aliases-and-abbrs # and by 'aliases' i mean fish abbrevations or fish aliases
  # abbreviations > aliases
  # abbr vs functions/aliases:
  # once you change to abbreviations, command history will differ, and so autosuggestions will be missing
  # i kinda prefer core replacements to be functions rather than abbrevations..
  # but abbreviations make the command history more readable to others
  # expanding text is ugly compared to keeping it short
  # so for things like 'mv -iv', i prefer aliases for neatness

  # basic shell signals
  # https://fishshell.com/docs/current/language.html#event
  #   - TODO: should make functions via 'function --on-signal'
  # https://fishshell.com/docs/current/cmds/trap.html
  # for now, just add commands and/or bindings
  # c binding is used by cd/cdi
  #abbr -a c 'clear -x' # clear by scrolling buffer up, c+l triggers clear by default (i think via terminal signal)
  abbr -a ca 'clear' # clear scrollback buffer
  abbr -a q 'exit' # control+q


  function add-fish-aliases
    alias -s unset 'set --erase'
    alias -s unalias 'functions --erase' # careful, deletes any function!
  end

  function add-file-aliases
    # basic file system commands
    # add --interactive, --verbose, and --parents flags
    alias -s mv 'mv -iv' # --interactive --verbose
    alias -s cp 'cp -iv'
    alias -s cpr 'cp -ivr' # --recursive
    #alias -s cpp 'cp -iv --parents' # cpp = c pre-processor
    alias -s cpa 'cp -iv --parents' # not the same as -p TODO: having problems...
    alias -s mkdir 'mkdir -pv'
    alias -s mkd 'mkdir -pv'
    # mkcd declared in functions.fish
    alias -s rm 'rm -iv'
    alias -s rmr 'rm -rfv' # TODO: add a single prompt; -i and -v asks for every file, use -f to skip that
    alias -s rmdir 'rmdir -v'
    alias -s rmd 'rmdir -v'

    # TODO: finish configing the ls commands
    # TODO: should use core unix commands? ls > exa?
    alias -s l 'eza --group-directories-first'
    alias -s la 'eza -a --group-directories-first' # --all
    alias -s ll 'eza -l --group-directories-first' # long (no --long flag), --header, --git
    alias -s lla 'eza -la --group-directories-first' # --header, --git
    alias -s ld 'eza -D' # WARNING: TODO: ld is a command-line tool!
    alias -s lda 'eza -D -a'

    alias -s ldt 'eza --tree -D --git-ignore' # -> ls -D
    alias -s ldat 'eza --tree -D --all --git-ignore' # ls -D -a

    # experimenting..
    function add-list-tree-aliases
      # TODO: experimenting with this...
      # note: DO NOT replace the original commands, bash scripts need to execute them!
      alias -s lt 'eza --tree --git-ignore --group-directories-first'
      alias -s lat 'eza --tree --all --git-ignore --group-directories-first' # vs lta
      alias -s lat1 'eza --tree --level 1 --all --git-ignore --group-directories-first'
      alias -s lat2 'eza --tree --level 2 --all --git-ignore --group-directories-first'
      alias -s lat3 'eza --tree --level 3 --all --git-ignore --group-directories-first'
      alias -s llt 'eza --tree --all --long --git-ignore --group-directories-first' # vs llat, llta; --header, --git
    end
    add-list-tree-aliases

  end

  if test $rebuild = yes # WTF is this syntax fish!?!? arghhhh
    add-fish-aliases
    add-file-aliases
  end


  # abbr functions
  abbr -a c 'cdi'


  # super useful fuzzy search functions
  # TODO: test these
  # TODO: should create my own simple aliases/functions and then bind them here
  abbr -a s 'fzf' # f is taken by file manager, so s for search; f for filter & find makes more sense though
  abbr -a fuzzy 'fzf'
  abbr -a vf 'nvim $(fzf)' # vs typing 'nvim' then pressing fzf-file-widget binding
  #abbr -a cdt 'cd $(find * -type d | fzf)' # vs fzf-cd-widget
  #abbr -a gct 'git checkout $(git branch -r | fzf)'






  # contemporary replacements

  # if debian (too difficult: https://unix.stackexchange.com/questions/6345/how-can-i-get-distribution-name-and-version-number-in-a-simple-shell-script)
  # don't do distro-only conditionals, just jump straight to nix :)
  # these packages are named differently on debian:
  #abbr -a bat 'batcat'
  #abbr -a fd 'fdfind'

  abbr -a h 'tldr' # -> man; vs t, m
  # note: ripgrep defaults might affect everything that uses it (fzf, nvim, etc.)
  # -i   --ignore-case
  abbr -a rg 'rg -i' # -> grep
  abbr -a rgh 'rg -i --hidden' # --no-ignore-dot ??, also the -i is duplicated to no ill effect
  abbr -a ripgrep 'rg -i' # rg is the actual command for the ripgrep package
  #abbr -a f 'fd' # -> find; currently f = file manager
  abbr -a d 'delta' # -> diff


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


  function add-git-abbrs
    # git, ordered by git work-flow
    abbr -a gs 'git status'
    abbr -a gf 'git fetch'
    #abbr -a gp 'git pull' # conflicts with push; which one do i use more?
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
  add-git-abbrs

end
add-aliases-and-abbrs





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

  # NOTE: use fish_key_reader to figure out the key sequence

  # fish shell default functions binding remaps
  bind \c\r history-pager # also '/'
  bind \c\h history-pager



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


  # bind fzf.fish widgets
  # be explicit about all bindings here
  # TODO: for now, just use alt+shift+char until i know for certain i'm not overwriting anything useful
  # NOTE: \c\e doesn't work, must use \e\c
  # TODO: try multiple bindings for the same function
  fzf_configure_bindings --directory=\eF --history=\eR --processes=\eP --variables=\eV --git_status=\eS --git_log=\eL



  # alt+r = vi-mode's replace mode from normal mode?

  # app bindings
  # alt+keys for jumping to apps (control+keys used for signals by most terminals)
  bind \cf lfcd # c+f = file manager; NOTE: lfcd function in aliases file
  # TODO: foot terminal doesn't seem to differentiate modifier keys...??
  # control+v is likely used for paste by many terminals
  # bind \cv nvim # c+v = vim, also c+e = EDITOR env var by default on fish

  if bind -M insert > /dev/null 2>&1
    bind -M insert \cf lfcd
    # bind -M insert \cv nvim
  end

end
bind-keys






function add-env-vars
  # set some vars
  set -gx EDITOR nvim # used by fish for alt+e binding
  set -gx VISUAL code

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
end
add-env-vars






# set appearance
# can use 'fish_config' command to set up the fish shell using a web-based gui

# use this to help you find a theme, displaying text within your terminal
# fish_config theme show
# fish_config theme choose [theme_name]

# NOTE: requires fisher plugin: catppuccin/fish
#fish_config theme choose "Catpuccin Mocha" # vs Macchiato
# otherwise, the default one ("fish default") is good enough!

set -g fish_greeting "herro little fishy :)
don't forget to go toward nature
toward yourself
toward the life you used to live
toward the life you love
toward the life you so desire everyone to live
a life full of love
a love full of life
and a soul that keeps on giving"

