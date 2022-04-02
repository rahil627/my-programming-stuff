

# fetch shared shell configs
# aliases, key-mappings, etc.
# TODO



# example from antigen gh repo readme

source /path-to-antigen/antigen.zsh

# to test
#antigen use oh-my-zsh

# main shell stuff
antigen bundle zsh-autosuggestions #- Adds fish-like autosuggestions to your ZSH sessions.
antigen bundle command-not-found

# zsh-users
antigen bundle zsh-users/zsh-completions #- Tab completions for many more applications than come standard with ZSH.
antigen bundle zsh-users/zsh-history-substring-search #- Better history search.
antigen bundle zsh-users/zsh-syntax-highlighting #- Syntax highlighting as you type.

# themes
# todo: find one
antigen theme robbyrussell


# app-specific
antigen bundle git
#antigen bundle heroku # maybe have one for digitalocean?

# other stuff


# Tell Antigen that you're done.
antigen apply
