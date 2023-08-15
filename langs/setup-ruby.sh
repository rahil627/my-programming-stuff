# install

# ruby 2.6 is installed by Debian's package manager, so you must use a version manager to install multiple versions of ruby and for it to select the correct one
# chruby > rbenv > rvm
#  - rvm is a pain
# use chruby if you don't need multiple versions, it's the simplest!

# https://github.com/postmodern/chruby
#   - check the readme to install
#   - auto-loads for bash and zsh
  
# https://github.com/JeanMertz/chruby-fish
#  - if using fish, use this wrapper instead
  
# https://github.com/postmodern/ruby-install
#  - check readme to install, a little hidden:
#  - https://github.com/postmodern/ruby-install/tree/master#install
ruby-install --update
# install latest version of ruby
ruby-install ruby
# list versions to install more
#ruby-install
# set default version for auto-switcher
#echo "ruby-3.2.2" > ~/.ruby-version


# not sure if necessary...
gem update --system --no-document
  # - nevermind!, may have broke my gems up
gem update

# ruby lsp for vs code
gem install solargraph # community lsp, not sure why it isn't the default one...
gem install yard # documentation gem, super-set of original ruby docs

# create a Gemfile in the working directory with the following lines:
source "https://rubygems.org"
gem "solargraph"

# TODO: perhaps because i'm using fish shell, there's an error
# start the program from the fish terminal to force vs code to use current terminal
code
# fix this!


# for all sorts of cool hackery
gem install pry
