#!/usr/bin/env sh

# just a script to install emacs and a few other things
# fuck the rest of the terminal crap, emacs is all i need

# just install github desktop for now..
# downlaoad/wget from github.com/shiftkey/desktop/releases
# - NOTE: CAUTION: 500mb!! maybe better to learn magit..
# download and then sudo apt install ./file-installer
# WARN: if there is an error about permissions on '/.git/index.lock', then might have to change permisisons
#  - for me, .git had root permissions, but github desktop doesn't run with sudo, i must run it as a user, so:
 #  - (from the directory with the git repo)
 #  - sudo chown -R ra .git
 #  - sudo chmod -R 755 .git
# WARN: there's some strange behavior with auth/key-ring not working, but it seems to work just fine: just press cancel on the keyring dialog box
#  - anyway, only need to use it until i setup 'n learn magit
