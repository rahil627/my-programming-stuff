# THIS IS NOT TO BE RUN AS A SCRIPT...yet?
# TODO: move to notes.txt
# how to install stuff
# google github cli
#   - download the correct release from the github repo
# sudo dnf install ./[package-name]
# replace dnf with apt for Debian OS


# sync the OS package manager
# before installing anything
sudo dnf update

# update the OS
sudo dnf update
sudo dnf upgrade

# main stuff
source setup-shell.sh # not sure if this is the proper way to execute other scripts...

# core shell apps

# fzf
# holy shit, search entire OS with this!
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# note: i have this included in the nvim plug-in manager too

# file directory navigator
# hot damn, why oh why did i waste all that time using commands to go through directories!?!? holy fuck. 
# better than gui, incredible
# TODO: try them all!
sudo apt install lf # might have to manually install
# ranger # python, slow-startup on chromebook
# lf # ranger in go, less bloated too
# nnn
# midnight commander # old-school

# replacement basic commands
sudo apt install exa # ls TODO: try lsd
sudo apt install bat # cat

# replacement utilities
# https://news.ycombinator.com/item?id=26561211
sudo apt-get install ripgrep # grep & ack
# TODO: try fzf+ripgrep
# https://github.com/junegunn/fzf#3-interactive-ripgrep-integration
sudo apt-get install fd-find # find & parallel
# zoxide > cd
# delta > diff
# xh > curl & httpie
# sd > sed

# dust > du
# procs > ps
# bottom > top


# simple community-sourced help for most commands, super practical
sudo dnf install tldr
# one time, it didn't update the dictionary upon install, so...
tldr -u

# pry
# see ruby.txt to install ruby


# some text editors
sudo apt install nano
sudo apt install vi # for a minimal nvim
sudo apt-get install neovim

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

# (re)create all aliases/functions
fish .aliases.fish

# re-build font cache files 
fc-cache -fv
# see running font
#fc-match monospace
# list fonts
#fc-list






# optional: install langs as you need them

# haxe
sudo dnf install haxe
# can choose any directory to set the haxelib location
mkdir ~/haxelib && haxelib setup ~/haxelib

# ruby
# see ruby.txt
# needed for pry!



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
