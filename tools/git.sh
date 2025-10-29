

# main use

# use these to see differences and discard them
git diff HEAD
git diff file-name

git restore file-name


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



# git submodules

# add a git submodule
git submodule add https://bitbucket.org/jaredw/awesomelibrary
# it should add .gitmodules and a folder for it

# remove a git submodule
# Remove the submodule entry from .git/config
git submodule deinit -f path/to/submodule

# Remove the submodule directory from the superproject's .git/modules directory
rm -rf .git/modules/path/to/submodule

# Remove the entry in .gitmodules and remove the submodule directory located at path/to/submodule
git rm -f path/to/submodule



# specific stuff

# undo git pull
git reset --keep HEAD@{1}

# diff works for two folders (if they are the same repo, but different version)
git diff repo-old repo-new

# save diff log
git diff --output output.txt










TODO: merge with above..

IMPORTANT: use git mv to move or rename files, otherwise it'll deleted the old file, with all it's git history, and create a new one

TIP: just use github desktop. it's fantastic. covers most cases. has an undo button.
  - PRO-TIP: leave github desktop open, change files, and it will automatically select the changes you've made since you opened it

how to create a new branch
  - (probably a much simpler way using the github website..)
  - git remote rename origin upstream
  - git remote add origin http
  - git push origin master

how to push a new repo?
  - first create a repo on github
  - then, it will provide instructions on how to init, commit, and push the new repo

how to search the commit history?
  - git log -S wren

how to get rid of files with sensitive data in the entire history of a git repo?
  - https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository
  - it uses a tool: git filter-repo
  - it's a bit complex, so, if the git repo isn't too important, it might just be easier to re-create the git repo

how to delete git from a local repo?
  - delete the .git folder
  - https://stackoverflow.com/questions/1514054/how-do-i-delete-a-local-repository-in-git

how to change the location of a submodule
  - git submodule set-url [path to submodule] [url]
  - https://stackoverflow.com/questions/60003502/git-how-to-change-url-path-of-a-submodule#60003644

how to fork/copy my own repo?
  - use the import web page
    - https://github.com/new/import
  - also useful when you need to actually import it from somewhere other than github
  
how to remove a submodule?
  - super complicated :/
  - https://stackoverflow.com/questions/1260748/how-do-i-remove-a-submodule#1260982
  - 0. mv a/submodule a/submodule_tmp
  - 1. git submodule deinit -f -- a/submodule    
  - 2. rm -rf .git/modules/a/submodule
  - 3. git rm -f a/submodule
  - # Note: a/submodule (no trailing slash)
  - # or, if you want to leave it in your working tree and have done step 0
  - 3.   git rm --cached a/submodule
  - 3bis mv a/submodule_tmp a/submodule


