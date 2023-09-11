# install

pacman -S ruby
# hopefully this is enough!


# OPTION
# if you need different versions of rubies, use a version manager to install multiple versions of ruby:
# use chruby (> rbenv > rvm)
# chruby also handles all the $PATH, $GEM_HOME, etc. stuff and more, so it's worth installing even if you don't need multiple versions

# https://github.com/postmodern/chruby
#   - check the readme to install
yay -S chruby
# follow instructions
#   - auto-loads for bash and zsh
# mght have to add this to ~/.bashrc or ~/.zshrc
# source /usr/local/opt/chruby/share/chruby/chruby.sh

# https://github.com/JeanMertz/chruby-fish
#  - if using fish, use this wrapper instead
# NOTE: don't install both
yay -S chruby-fish


# OPTION
# if you want to just use the system package manager installed ruby
# (this is the quickest 'n simplest way)
chruby system
# NOTE: ~/.ruby.version overrides this
# even archlinux was using 3.0.6 when 3.2.2 was available...

# OPTION
# otherwise, can create a link to the package-installed ruby
# it even works if you don't append the version to it's name
ruby -v
mkdir -p ~/.rubies/ruby-3.0.0/bin
ln -s /usr/bin/ruby ~/.rubies/ruby-3.0.0/bin/ruby



# OPTION
# works together with chruby
# https://github.com/postmodern/ruby-install
#  - check readme to install, a little hidden:
#  - https://github.com/postmodern/ruby-install/tree/master#install
ruby-install --update
# install latest stable version of ruby
# NOTE: VERY SLOW, this downloads the source and compiles it!!
ruby-install ruby
# list versions to install more, including other quicker implementation
#ruby-install
# removes the source 'n build files
ruby-install --cleanup # rm ~/src -rf

# set default version for chruby
# a lsp might look for this
echo "ruby-3.2.2" > ~/.ruby-version
# i think this runs 'chruby ruby-3.2.2' for you






# make sure everthing is ok
gem env

gem update

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


# OPTION
# install gems to system dir
# NOTE: kinda strange...
# https://gist.github.com/jhass/8839655bb038e829fba1
# leave $GEM_HOME as it is
# if that doesn't work, add a .gemrc file:
#echo "gem: --no-user-install --env-shebang" > ~/.gemrc
# this overrides the system gemrc file: /etc/gemrc
# which has 'gem: --user-install' by default
# i'm guessing it would ask for permissions every-time...





# https://wiki.archlinux.org/title/Visual_Studio_Code
#   - need to download marketplace registry for arch's open-source version of code, in order to see most plugins
yay -S code-marketplace



# add a lsp

# OPTION 1
# ruby-lsp: shopify's lsp was released in 2021, after solargraph
# also have Shopify.ruby-extensions-pack, which adds user settings, sorbet extension, debugger extension(vscode-rdbg)
# meant to replace the "ruby" extension's lsp
# it doesn't require building yard docs
# no need to install the gem, it installs itself via bundle

# OPTION 2
# ruby: the built-in(?) lsp will use gem rcodetools (rct-complete, rct-doc, etc.)
gem install rcodetools
# although the completion worked, it didn't show doc previews, and the completion wasn't ordered by class inheritance, making it pretty useless
#gem install rcodetools

# OPTION extra
# solargraph
# it adds previews on hover, documentation of classes via side-bar
# it also seems to order class methods by inheritance, which is crucial in ruby's hella deep objects
gem install solargraph
# documentation gem used by solargraph, super-set of original RDoc
#gem install yard
# generate docs for all installed gems (to ~/.yard)
#yard gems
# for each project, have to add solargraph to Gemfile, and run 'yard docs' or:
# generate yard documentation automatically when you install new gems
yard config --gem-install-yri


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


