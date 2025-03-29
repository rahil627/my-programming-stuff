#!/usr/bin/env ruby

# TODO: test using emacs with offline docs, to dev without the internet

# spc-k-
# TODO: ..maybe requires a local copy of ruby?..
#   - definitely would be better than using the docs!!
# TODO: research into a good setup for offline dev with ruby.. maybe there's already some useful tools out there..

# spc-c[ode]-d[ocs]
#   - module/method
#   - seems to use ri as it's source..

# spc-c-s
#   - inf-ruby
#     - irb in a buffer?
#     - kinda works like lisp, in which you can throw in pieces of code to the dynamic runtime, to test bits
#       - it's a really cool workflow, especially for testing regions of code..
#       - can just send a region of var declarations, some functions/modules/classes, then run 'em interactively

# ri --no-gems (shell command)
#   - interactive ruby docs
#   - for core + std-lib stuff: still 208 gems!
#     - 250 with it, might include rails though..
#     - important gems such as nokogiri aren't considered ruby/std
#   - module[tab, tab] to see classes
#   - module::class[tab, tab] to see methods
#     - class methods aren't organized by super classes :/
#  - CONCLUSION: AI + IDE (with jump to definition, class hierarchy panel, etc.) really is needed..
#    - TODO: OR: maybe can just make a local copy of the ruby repo.. then try the emacs spc-k commands
# type keyword, then press tab (in select mode)
#   - not so good with modal text editing..

