#!/bin/bash

# from github, after you create a new repo
# …or create a new repository on the command line
echo "# my-written-expressions" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/rahil627/my-written-expressions.git
git push -u origin main

# …or push an existing repository from the command line
 git remote add origin https://github.com/rahil627/my-written-expressions.git
git branch -M main
git push -u origin main


# discard changes and un-stage
# maybe as an unstage flag for just un-staging
git restore file-name

# remove files that are listed in the .gitignore but still on the repository
# https://stackoverflow.com/questions/13541615/how-to-remove-files-that-are-listed-in-the-gitignore-but-still-on-the-repositor 
git rm --cached `git ls-files -i -c --exclude-from=.gitignore`

# Remove the submodule entry from .git/config
git submodule deinit -f path/to/submodule

# Remove the submodule directory from the superproject's .git/modules directory
rm -rf .git/modules/path/to/submodule

# Remove the entry in .gitmodules and remove the submodule directory located at path/to/submodule
git rm -f path/to/submodule
