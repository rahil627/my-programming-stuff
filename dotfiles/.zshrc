
# some sources to grab bits from
# https://github.com/Innei/zshrc
# https://github.com/unixorn/zsh-quickstart-kit


# fetch shared shell configs
# aliases, key-mappings, etc.
# TODO



# example from antigen gh repo readme

source /path-to-antigen/antigen.zsh

# to test
#antigen use oh-my-zsh

# main shell stuff
antigen bundle command-not-found

# zsh-users
antigen bundle zsh-users/zsh-completions #- Tab completions for many more applications than come standard with ZSH.
antigen bundle zsh-users/zsh-history-substring-search #- Better history search.
antigen bundle zsh-users/zsh-syntax-highlighting #- Syntax highlighting as you type.
antigen bundle zsh-users/zsh-autosuggestions #- Adds fish-like autosuggestions to your ZSH sessions.

# pretty
antigen bundle colorize

# themes
# todo: find one
antigen theme robbyrussell


# app-specific
antigen bundle git
antigen bundle github
#antigen bundle heroku # maybe have one for digitalocean?

antigen bundle ruby # not sure if this actually exists...

# other stuff

# experimental
antigen bundle chruby
antigen bundle sudo


# Tell Antigen that you're done.
antigen apply
