
# hmmmm, i gotta think this through some more...
# (this is for bookmarking directories)

# prompts:
# "make a fish function that uses fzf to filter a list of filepaths from a file, select one, and return the filepath to the shell's command line"
# make a fish function that uses fzf to filter a list of filepaths from a file, select one, and return the filepath to the shell's command line

# result:
# Certainly! Here's an example of a fish function that uses fzf to filter a list of
#  filepaths from a given file:

function fzf_select_filepath
    set selected_filepath (cat file.txt | fzf --ansi --preview "echo (bat --style=
numbers --color=always {})")
    echo $selected_filepath
    commandline -i $selected_filepath
end

# This function expects the file containing the list of filepaths to be named file.txt.
#  Modify the command within the cat statement as per your file naming convention.

# Explanation:
# - The fzf command is invoked with the --ansi flag to enable colored output.
# - The --preview option is used to show the content of the selected file using the
# bat command, which is a widely used alternative to cat. You may need to install the
#  bat command in your system (brew install bat for macOS, apt install bat for
#  Debian-based distros).
# - The selected filepath is stored in the variable selected_filepath.
# - The selected filepath is echoed for confirmation.
# - The commandline function is used to replace the current command line with the
#  selected filepath using the -i option.

# Save the above function in your fish config file (usually located at ~/.config/fish
# /config.fish). Then, you can invoke the fzf_select_filepath function by typing the
#  function name in your shell:
# ```fish
# fzf_select_filepath
# ```

# After running this command, a filtered list of filepaths will be displayed using fzf,
#  and once you select a filepath, it will be returned to the shell's command line for
#  further processing.
