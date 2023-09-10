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

# https://wiki.archlinux.org/title/ruby#Configuration
# By default in Arch Linux, when running gem, gems are installed per-user (into ~/.local/share/gem/ruby/), instead of system-wide (into /usr/lib/ruby/gems/)
# The recommended way to setup that is by manually specifying your $GEM_HOME, which then can be appended to your $PATH environment variable in order to allow RubyGems binaries to be executed:

# set everything to use a single gem dir, the user dir not the system/default dir 
# https://felipec.wordpress.com/2022/08/25/fixing-ruby-gems-installation/
# setting $GEM_HOME overrides gem.paths.home
# bundle doesn't know where to install gems otherwise
#set -gx GEM_HOME "$(gem env user_gemhome)" # this seems to work fine too...
#set -gx GEM_HOME $(ruby -e 'puts Gem.user_dir')
echo -e "\nset -gx GEM_HOME $(ruby -e 'puts Gem.user_dir')"
# /home/ra/.gem/ruby/3.0.0
# in archlinux, it uses ~/.local/share/gem/ruby/3.0.0
# if there's anything installed there, move gems to the ~/.gem/ruby/3.0.0 path and then delete it
# i think chruby uses ~/.gem dir

# add gem path to $path
# NOTE: this might clog up shell commands namespace...
# use user gem path over root?
fish_add_path $GEM_HOME/bin
# do i add the root gem dir too? (gem env gemhome or ruby -e Gem.default_dir)





# add lsp
# shopify's lsp was released in 2021, after solargraph
# it doesn't require building yard docs

# the built-in(?) lsp will use this gem's binaries (rct-complete, rct-doc, etc.)
# although the completion worked, it didn't show doc previews, and the completion wasn't ordered by class inheritance, making it pretty useless
#gem install rcodetools

# a contemporary, more featureful ruby lsp
# it adds previews on hover, documentation of classes via side-bar
# it also seems to order class methods by inheritance, which is crucial in ruby's hella deep objects
#gem install solargraph 
# documentation gem used by solargraph, super-set of original RDoc
#gem install yard 
# generate docs for all installed gems (to ~/.yard)
#yard gems
# (NOTE: for each project, have to add solargraph to Gemfile, and run 'yard docs')



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


