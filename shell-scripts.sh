#!/bin/sh


# add a folder-path to the $PATH environment var
# so that programs ("binaries") in it can be invoked via command line
echo $PATH
export PATH=$PATH:/usr/local/bin



# update swap file

# check size and name of swap file
swapon -s

# create a new swapfile
dd if=/dev/zero of=/tempswap bs=1M count=1024 #1GB file
mkswap /tempswap
swapon /tempswap


# update size of swap file
# /swapfile is a file-path
swapoff /swapfile
fallocate -l 2G /swapfile
mkswap /swapfile
swapon /swapfile
swapon -s


# i will never understand linux's file structre, wtf!!
# NOTHING is standardized!!! ahhhhhh
cp init.vim ~/.config/nvim/init.vim


# remove files that are listed in the .gitignore but still on the repository
# https://stackoverflow.com/questions/13541615/how-to-remove-files-that-are-listed-in-the-gitignore-but-still-on-the-repositor 
git rm --cached `git ls-files -i -c --exclude-from=.gitignore`



# replace file extensions in folder
# https://unix.stackexchange.com/questions/78821/how-can-i-rename-all-files-with-one-extension-to-a-different-extension-recursive#78822
find some_folder -type f -name "*.bub" | 
    sed "s/\.bub$//" | 
    xargs -I% mv -iv %.bub %.aaa
    
# function version
# use: $ extmv some_folder/ bub aaa
$ extmv () {
    find "${1}" -type f -name "*.${2}" | 
    sed "s/\.${2}$//" | 
    xargs -I% mv -iv "%.${2}" "%.${3}"
}



# Remove the submodule entry from .git/config
git submodule deinit -f path/to/submodule

# Remove the submodule directory from the superproject's .git/modules directory
rm -rf .git/modules/path/to/submodule

# Remove the entry in .gitmodules and remove the submodule directory located at path/to/submodule
git rm -f path/to/submodule
