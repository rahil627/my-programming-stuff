# pretty terrible code, lmao.
# thinking about creating a function that creates a function out of a short-hand text, particularly for batches of commands

# prompts:
# "make a fish function using fish language that takes the input 'function-name command 1; command2; command3' and creates a fish function out of it"
# make a fish function using fish language that takes the input 'function-name command 1; command2; command3' and creates a fish function out of it

# result:
# Here's an example of a fish function written in the fish language that takes a string
#  input in the format 'function-name command1; command2; command3' and creates a fish
#  function from it:

function create_fish_function
    set input (echo $argv[1])

    # Extract the function name
    set function_name (echo $input | awk '{print $1}')

    # Extract the commands
    set command_str (echo $input | awk '{$1=""; print substr($0,2)}')

    # Create the fish function
    eval (echo "function $function_name\n$command_str\nend")
end

# To use this function, save the above code to a file (e.g., create_function.fish), and
#  then load it in your fish shell by running source create_function.fish. After that,
#  you can call create_fish_function 'function-name command1; command2; command3' with
#  the desired function name and command sequence to create a new fish function.

# For example, if you run create_fish_function 'my_function echo "Hello"; echo "World"'
# , it will create a fish function named my_function with the commands echo "Hello"
#  and echo "World". You can then call my_function in your fish shell, and it will
#  execute those commands.
