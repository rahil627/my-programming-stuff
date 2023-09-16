# longer functions are thrown in here
# this is executed via 'source $config_path'functions.fish' in config.fish

function mkcd --description "create a directory and change to it"
    mkdir -pv $argv;
      cd $argv;
  end
  funcsave mkcd


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


