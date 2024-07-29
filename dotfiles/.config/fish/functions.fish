# longer functions are thrown in here
# this is executed via 'source $config_path'functions.fish' in config.fish

# sources:
# https://github.com/clo4/nix-dotfiles/blob/main/programs/fish.nix
#  - TODO: try gum for cli scripts, very unix-y!! :) no more language-based cli crap!! :D

# a simple prompt to be used internally
# https://fishshell.com/docs/current/language.html#user-input
# how to use:
# prompt-yes-or-no
# if test $status -eq 1
# 	return 1
# end
function prompt-yes-or-no

	# TODO: not sure what these do...
	#and isatty stdin
	#and isatty stdout

	while read --nchars 1 -l response --prompt-str="are you sure? (y/n) "
		or return 1 # if the read was aborted with ctrl-c/ctrl-d
		switch $response
				case n N
					# We return from the function without printing
					echo 'aborting!'
					return 1 # fail exit code
				case y Y
					echo 'okay!'
					# We break out of the while and go on with the function
					#break
					return 0 # success exit code
				case '*' # NOTE: make sure this is the last case! catch all
					# We go through the while loop and ask again
					echo 'not valid input, try again'
					continue
		end
	end
end
funcsave prompt-yes-or-no

function cdi --wraps="cd" --description "interactive cd that offers to create directories"
		# Some git trickery first. If the function is called with no arguments,
		# typically that means to cd to $HOME, but we can be smarter - if you're
		# in a git repo and not in its root, cd to the root.
		if test (count $argv) -eq 0
			# TODO: check if git exists
			set git_root (git rev-parse --git-dir 2>/dev/null | path dirname)
			if test $status -eq 0 -a "$git_root" != .
				cd $git_root
				return 0
			end
		end

		# TODO: move to mkcd
		# Now that's out of the way
		cd $argv
		set cd_status $status
		if test $cd_status -ne 0
			#and gum confirm "Create the directory? ($argv[-1])" # TODO: this is so much cleaner!
			prompt-yes-or-no
			if test $status -eq 1
				#echo "aborted"
				return 1
			end
			#echo "creating directory"
			command mkdir -p -- $argv[-1]
			builtin cd $argv[-1]
			return 0
		else
			return $cd_status
		end
end
funcsave cdi

# TODO: maybe obsoleted by the above function
function mkcd --description "create a directory and change to it"
  mkdir -pv $argv;
  cd $argv;
end
funcsave mkcd

# TODO: seems to create a dir in /tmp/ ...hmmmmm, kinda strange..
# cd to a temporary directory
# function tcd
# 	cd (mktemp -d)
# end

function mvcd --description "rename the current directory"
  set cwd $PWD
  set newcwd $argv[1]
  cd ..
  mv $cwd $newcwd
  cd $newcwd
  #pwd
end
funcsave mvcd

# Add a suffix to one or more files
function suffix
	if test (count $argv) -lt 2
		echo 'Requires 2 arguments.  Usage: suff <suffix> <files>...' >&2
		return 1
	end

	set suffix $argv[1]
	set paths $argv[2..]

	for path in $paths
		mv $path $path$suffix
	end
end
funcsave suffix

# from lfcd.fish, part of lf (terminal file manager)
# Change working dir in fish to last dir in lf on exit (adapted from ranger).
#
# You may put this file to a directory in $fish_function_path variable:
#
#     mkdir -p ~/.config/fish/functions
#     ln -s "/path/to/lfcd.fish" ~/.config/fish/functions
#
# You may also like to assign a key (Ctrl-O) to this command:
#
#     bind \co 'set old_tty (stty -g); stty sane; lfcd; stty $old_tty; commandline -f repaint'
#
# You may put this in a function called fish_user_key_bindings.
function lfcd
  set tmp (mktemp)
  # `command` is needed in case `lfcd` is aliased to `lf`
  command lf -last-dir-path=$tmp $argv
  if test -f "$tmp"
    set dir (cat $tmp)
    rm -f $tmp
    if test -d "$dir"
      if test "$dir" != (pwd)
        cd $dir
      end
    end
  end
end
funcsave lfcd


# https://github.com/kuncevic/execute-dir.fish/blob/master/functions/xd.fish
# execute a command in a different working directory
function xd
  if test (count $argv) -lt 2
		echo "Usage: xd <dir> <command>"
		return 1
  end

  set dir $argv[1]
  set cmd $argv[2..-1]

  if test -d $dir
		pushd $dir > /dev/null
		$cmd
		popd > /dev/null
  else
		echo "Directory '$dir' does not exist."
		return 1
  end
end
funcsave xd


