# TODO: THIS IS NOT TO BE RUN AS A SCRIPT...yet?
# https://github.com/caarlos0/dotfiles.fish/blob/main/script/bootstrap.fish
# should def use a basic bash script instead: no functions, straight commands
# otherwise, just write it in ruby and transpile it to bash, lol
# TODO: copy dotfiles

# TODO: move to notes.txt

# TODO: make this code platform independent
# if arch, use 'pacman -S'


# how to install stuff
# sudo pacman -S ./package-name # for fedora
# sudo apt install package-name # for debian


# sync the OS package manager
# before installing anything
# sudo apt update

# update the OS
# sudo apt update
# sudo apt upgrade

# update everything for arch
pacman -Syu # TODO: read the arch-wiki maintenance article

# main stuff
source setup-shell.sh # not sure if this is the proper way to execute other scripts...

# core shell apps

# fzf
# holy shit, search entire OS with this!
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# note: i have this exact two lines included in the nvim plug-in manager too
# prompts:
# autocomplete? yes
# bindings? TODO
# shell integration? nah (adds to .bashrc and some fish config file

# file directory navigator
# hot damn, why oh why did i waste all that time using commands to go through directories!?!? holy fuck.
# better than gui, incredible
# TODO: try them all!
sudo pacman -S lf # might have to manually install
# lf # like ranger but written in go, less bloated too
# nnn
# midnight commander # old-school

# replacement basic commands
sudo pacman -S eza # ls TODO: try lsd
sudo pacman -S bat # cat

# replacement utilities
# https://news.ycombinator.com/item?id=26561211
# https://wiki.archlinux.org/title/core_utilities#Alternatives
  - great list
sudo pacman -S ripgrep # grep & ack
# TODO: try fzf+ripgrep
# https://github.com/junegunn/fzf#3-interactive-ripgrep-integration
sudo pacman -S fd # find & parallel, fd-find package in debian
# zoxide > cd
sudo pacman -S delta # diff
# xh > curl & httpie
sudo pacman -S sd # sed

# dust or ncdu > du
# procs > ps
# bottom > top



# essentials
# simple community-sourced help for most commands, super practical
sudo pacman -S tldr # man
# one time, it didn't update the dictionary upon install, so...
tldr -u

# pry
# see ruby.txt to install ruby


# some text editors
#sudo pacman -S nano
#sudo pacman -S vi # for a minimal nvim (nvim --noplugin threw errors for me)
#sudo pacman -S neovim
sudo pacman helix

sudo pacman -S wl-clipboard # make nvim clipboard work with wayland TODO: move to nvim config?

# if gui, add some terminals
sudo pacman -S alacritty # vs foot
sudo pacman -S kitty

# install some fonts
# font utility, only for arch?
# https://wiki.archlinux.org/title/font_configuration
# other than listing fonts (fc-list), i haven't used it..
# sudo pacman -S fontconfig

sudo pacman -S adobe-source-code-pro-fonts
yay -S otf-hasklig

# dropbox
# app vs cli?
#   - i'm guessing you can have both?
# get the binaries and read the instructions here:
# https://help.dropbox.com/installs-integrations/desktop/linux-commands
# https://wiki.archlinux.org/title/dropbox
# follow the archwiki!!
# syncs to ~/Dropbox

# for whatever reason this dependency isn't packed
# pacman or yay? python-gpgme
yay dropbox
yay dropbox-cli
# note: use dropbox-cli command not dropbox command??
#dropbox-cli exclude books
dropbox-cli start -i
dropbox-cli start
#dropbox-cli autostart
# keep running this to check how it's going, or when you have problems
#dropbox-cli status

# after excluding files you don't need, they will end up in the cache
# manually clear cache
#rm -R ~/Dropbox/.dropbox.cache/*


# dev-related stuff
sudo pacman -S git

sudo pacman -S gh
# create an auth token here: https://github.com/settings/tokens
# select most of the access check-marks when creating the token
# TODO: the https method is simpler, why use token?
gh auth login
# go through the cli prompts, paste in the auth token
# now git won't prompt you for a password anymore! :)



# copy dotfiles
gh repo clone my-programming-stuff
# might have to hand-copy dotfiles, ensuring you don't overwrite some distro-specific configs

# (re)create all aliases/functions
# in ~/.config/fish/config.fish
# set rebuild = yes
# restart shell
# set rebuild = no

# re-build font cache files
fc-cache -fv
# see running font
#fc-match monospace
# list fonts
#fc-list






# optional: install langs as you need them

# haxe
sudo pacman -S haxe
# can choose any directory to set the haxelib location
mkdir ~/haxelib && haxelib setup ~/haxelib

# ruby
# see ruby.txt
# needed for pry!



# possible garbage

# homebrew is garbage, try to avoid installing this
