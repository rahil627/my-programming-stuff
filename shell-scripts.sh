#!/bin/sh

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
