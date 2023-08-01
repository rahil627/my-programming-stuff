# TODO: move to notes
# how to install stuff
# google github cli
# download the correct release from the github repo
# sudo dnf install ./[package-name]
# replace dnf with apt for Debian OS



# sync the OS package manager
# before installing anything
sudo dnf update

# update the OS
sudo dnf update
sudo dnf upgrade



# main stuff

# replace bash with a more contemporary shell
sudo dnf install fish

# fedora doesn't include common linux/unix utilities by default
sudo dnf install util-linux-user

# get file-path of shell
which fish

# change shell, will prompt you for entering the file-path
chsh

# now, from within the fish shell...
# create aliases / functions
fish .aliases-fish



# simple community-sourced help for most commands, super practical
sudo dnf install tldr

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
gh repo clone my-programming-stuff
# might have to hand-copy dotfiles, ensuring you don't overwrite some distro-specific configs


# haxe
sudo dnf install haxe
# can choose any directory to set the haxelib location
mkdir ~/haxelib && haxelib setup ~/haxelib

# ruby
# https://developer.fedoraproject.org/tech/languages/ruby/gems-installation.html
sudo dnf install ruby ruby-devel rubygem-irb rubygem-pry
# need fo make sure you have a C compiler to build ruby native extensions
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
