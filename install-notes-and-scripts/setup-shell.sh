# shell install script

# warning: popular linux package distro's managers are hella out-dated, so
# go to https://fishshell.com/ and download the latest one

# replace bash with a more contemporary shell
sudo pacman -S fish

# fedora doesn't include common linux/unix utilities by default
# maybe needed for chsh
#sudo dnf install util-linux-user

# get file-path of shell
which fish
# use /usr/bin/fish over /bin/fish

# change shell, will prompt you for entering the file-path
chsh

# set vi mode
fish_vi_key_bindings

# install simple plug-in manager: fisher
sudo curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# plug-ins
# note: requires copying from my dotfiles to: ~/.config/fish/fish_plugins
# then run
fisher update

# create aliases / functions
# note: requires copying from my dotfiles first
# note: only need to run it this once, then after editing; it doesn't run on load (it generates function files)
# run this after update, in case i overwrote plugin functions
fish ~/.config/fish/aliases-fish


