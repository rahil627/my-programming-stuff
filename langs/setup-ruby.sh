# install

pacman -S ruby
# hopefully this is enough!



# if you need different versions of rubies detected by the project folder:
# use a version manager to install multiple versions of ruby
# rbenv > rvm

# otherwise:
# use chruby
# chruby also handles all the $PATH, $GEM_HOME, etc. stuff and more, so it's worth installing even if you don't need multiple versions

# https://github.com/postmodern/chruby
#   - check the readme to install
yay -S chruby
# follow instructions
#   - auto-loads for bash and zsh
  
# https://github.com/JeanMertz/chruby-fish
#  - if using fish, use this wrapper instead
# NOTE: don't install both
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

# set default version for chruby
# i think it's optional...
#echo "ruby-3.2.2" > ~/.ruby-version

# make sure everthing is ok
gem env

# add gem path to $path
# NOTE: this might clog up shell commands namespace...
# use user gem path over root?
fish_add_path /home/ra/.local/share/gem/ruby/3.0.0/bin



# add lsp
# the built-in lsp will use this gem's binaries (rct-complete, etc.)
gem install rcodetools

# a contemporary, more featureful ruby lsp
# it adds previews on hover, documentation of classes via side-bar
# it also seems to order class methods by inheritance, which is crucial in ruby's hella deep objects
gem install solargraph 
# documentation gem used by solargraph, super-set of original RDoc
gem install yard 
# generate docs for all installed gems (to ~/.yard)
yard gems



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






# i think because code must use the env vars for $path which contains the $gem_home (path to gems), you must start it from a terminal
# or does it being a container a factor?
#code


