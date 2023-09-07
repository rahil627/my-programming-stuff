# install

pacman -S ruby
# hopefully this is enough!



# in case you need different versions of rubies, or different implementations of the compiler (truffle, etc.)
# use a version manager to install multiple versions of ruby
# chruby > rbenv > rvm
# use chruby if you don't need to automatically detect the version by the project folder; it's the simplest!
# chruby also handles all the $PATH, $GEM_HOME, etc. stuff and more, so it's worth installing even if you don't need multiple versions

# https://github.com/postmodern/chruby
#   - check the readme to install
yay -S chruby
# follow instructions
#   - auto-loads for bash and zsh
  
# https://github.com/JeanMertz/chruby-fish
#  - if using fish, use this wrapper instead (not both!)
yay -S chruby-fish

# goes together with chruby
# TODO: not sure if you can use chruby without it (with ruby installed by the os's package manager)
# https://github.com/postmodern/ruby-install
#  - check readme to install, a little hidden:
#  - https://github.com/postmodern/ruby-install/tree/master#install
ruby-install --update
# install latest version of ruby
# NOTE: VERY SLOW, this downloads the source and compiles it!!
ruby-install ruby
# list versions to install more
#ruby-install
# set default version for auto-switcher
#echo "ruby-3.2.2" > ~/.ruby-version




# for all sorts of cool hackery
sudo pacman -S pry
sudo pacman -S pry-byebug



# not sure if necessary...
gem update --system --no-document
  # - nevermind!, may have broke my gems up
#gem update
#TODO: maybe some way to update only documentation?
# this installs the documentation
# for some reason it fetches AND builds ALL of the gems... :(

# ruby lsp for vs code
# community lsp, not sure why it isn't the default one...
gem install solargraph 

# documentation gem, super-set of original ruby docs
gem install yard 

# start a new project
# create a Gemfile in the working directory with the following lines:
source "https://rubygems.org"
gem "solargraph"


# start a new 


# TODO: perhaps because i'm using fish shell, there's an error
# start the program from the fish terminal to force vs code to use current terminal
code
# fix this!


