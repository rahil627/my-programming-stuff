# TODO: move to notes
# how to install stuff
# google github cli
# download the correct release from the github repo
# sudo dnf install ./[package-name]


# sync the OS package manager
# before installing anything
sudo dnf update

# update the OS
sudo dnf update
sudo dnf upgrade


# main stuff

sudo dnf install tldr

sudo dnf install fish

# dropbox
# get the binaries and read the instructions here:
# https://help.dropbox.com/installs-integrations/desktop/linux-commands
dropbox start -i
dropbox start


# dev-related stuff
sudo dnf install git

sudo dnf install gh
# create an auth token here: https://github.com/settings/tokens
# select most of the access check-marks when creating the token
gh auth login
# go through the cli prompts, paste in the auth token
# now git won't prompt you for a password anymore! :)



# copy dotfiles
gh clone my-programming-stuff
# might have to hand-copy dotfiles, ensuring you don't overwrite some distro-specific configs


# haxe
sudo dnf install haxe
# can choose any directory to set the haxelib location
mkdir ~/haxelib && haxelib setup ~/haxelib

# ruby
sudo dnf install ruby ruby-devel rubygem-irb rubygem-pry
# this is for fedora only, to build ruby native extensions
sudo dnf group install "C Development Tools and Libraries"




# possible garbage

dkpg
  - why not just use 'dnf install ./package'?

# install homebrew
# homebrew is garbage, try to avoid installing this
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# it will then tell you to run some commands depending on your OS
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/ra/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# uninstall that garbage
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
