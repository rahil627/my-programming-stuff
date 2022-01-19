#!/bin/sh

# remove files that are listed in the .gitignore but still on the repository
# https://stackoverflow.com/questions/13541615/how-to-remove-files-that-are-listed-in-the-gitignore-but-still-on-the-repositor 
git rm --cached `git ls-files -i -c --exclude-from=.gitignore`

