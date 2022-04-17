
# path/to/submodule
path="$@"

# remove the submodule entry from .git/config
git submodule deinit -f $path

# Remove the submodule directory from the superproject's .git/modules directory
rm -rf ".git/modules/$path"

# Remove the entry in .gitmodules and remove the submodule directory located at path/to/submodule
git rm -f $path
