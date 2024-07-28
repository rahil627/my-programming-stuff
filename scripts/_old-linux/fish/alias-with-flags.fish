# hmmmm, nvm, seems to work in fish shell by default now..??

# # generated via chatGPT3.5
# make a cli function for the fish shell that allows addings flags to an existing alias, and executing it

function alias-with-flags
    # Check if the alias exists
    if alias -q $argv[1]
        set -l alias_definition (alias $argv[1])
        set -l flags "$argv[2..-1]"

        # Add flags to the alias definition
        set -l new_definition (echo $alias_definition | sed "s|$argv[1]|$argv[1] $flags|")

        # Create a new alias with the updated definition
        #alias $argv[1] $new_definition

        # Execute the updated alias
        #eval $argv[1]

        eval $new_definition


    else
        echo "Alias '$argv[1]' does not exist"
    end
end

#To use this function, you can save it to a file named alias_with_flags.fish, for example. Then, load it into your Fish shell session using the source command:

#source alias_with_flags.fish

# After that, you can use the alias-with-flags function to add flags to an existing alias and execute it. Here's an example:

#alias my-alias 'ls'
#alias-with-flags my-alias -l -a

#In the above example, the alias-with-flags function appends the -l and -a flags to the existing my-alias alias and executes it as ls -l -a.
