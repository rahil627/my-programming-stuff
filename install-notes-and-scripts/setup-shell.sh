# shell
# install latest version here:
# https://fishshell.com/

# warning: popular linux package managers are hella out-dated, so
# go to https://fishshell.com/ and download the latest one

# fedora install
# replace bash with a more contemporary shell
#sudo dnf install fish

# fedora doesn't include common linux/unix utilities by default
# maybe needed for chsh
#sudo dnf install util-linux-user

# get file-path of shell
which fish

# change shell, will prompt you for entering the file-path
chsh

# now, from within the fish shell...
# create aliases / functions
fish ~/.aliases-fish

# install minimalist plug-in manager: fisher
sudo curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# plug-ins
# located in: .config/fish/fish_plugins
# then run
#fisher update
