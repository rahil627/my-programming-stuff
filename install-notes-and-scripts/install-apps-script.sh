
# sync the OS package manager
# before installing anything
sudo apt update

# update the OS
sudo apt update
sudo apt upgrade

sudo apt install tldr
tldr -u


# main stuff
# dropbox
# get the binaries and read the instructions here:
# https://help.dropbox.com/installs-integrations/desktop/linux-commands
dropbox start -i
dropbox start

# dev-related stuff

sudo apt install git

# google github cli
# download the correct release from the github repo
# sudo apt install ./[package-name]
# create an auth token here: https://github.com/settings/tokens
gh auth login
# go through the cli prompts, paste in the auth token
# now git won't prompt you for a password anymore! :)







# possible garbage

dkpg
  - why not just use 'apt install ./package'?

# install homebrew
# homebrew is garbage, try to avoid installing this
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# it will then tell you to run some commands depending on your OS
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/ra/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# uninstall that garbage
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
