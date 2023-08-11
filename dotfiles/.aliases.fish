
# for bash you'd just execute this file from within the main config
#if [ -f ~/.aliases ]; then
#    . ~/.aliases
#fi

# for fish, just run this file after editing it:
# fish .alises-fish

# notes:
# add -s flag to all alias -s commands, then run this file as a fish script
# alias -s -s <alias -sname> "command(s)" # Or --save
# this will create functions (all commands are functions in fish)
# and they will automatically lazy-load
# otherwise, if you do it the bash/zsh way and throw it all in a file,
# it will load them all into the shell's memory
# https://stackoverflow.com/questions/2762994/define-an-alias -s-in-fish-shell

# for whatever reason, normal `alias command-name='command'` via script wasn't working, so
# then i did a simple search 'n replace to crate this file:
# 'sed 's/alias/alias -s/g' .aliases >> .aliases-fish

# otherwise, if it worked, i could have kept the original bash file without the -s and run this:
# for f in (alias | awk '{print $2}'); funcsave $f; end
# ah well!


# note: don't use the name of an actual command, it won't override, it'll just execute twice!

# note: if you remove an alias from here, i think the function still remains
# so then you'd have to use the unalias command or functions --erase command

# note: cover all options: verbose and short

# basic shell signals
alias -s c='clear'
#alias -s c='clear' -x
#alias -s ca='clear'
alias -s q='exit'

# basic file system commands
# TODO: config these, just the ls commands
alias -s l='ls -CF'
alias -s ll='ls -alF'
alias -s la='ls -A'

alias -s mv='mv -iv'
alias -s cp='cp -iv'
alias -s mkdir='mkdir -pv'
alias -s rmdir='rmdir -v'

# man supplement
alias -s h='tldr'

# fuzzy search
# TODO: test these
#alias -s vf='nvim $(fzf)'
#alias -s cdt='cd $(find * -type d | fzf)'
#alias -s gct='git checkout $(git branch -r | fzf)'

# (f)ile 'n' directory navigator / explorer
alias -s f='ranger'

# contemporary replacements
# note: DO NOT replace the original commands, bash scripts need to execute them!

# TODO: debian has a package named bat already, so it named it 'batcat'
alias -s bat='batcat'
alias -s cat='batcat'


# rg is the actual command for ripgrep by default, there is no 'ripgrep' command
alias -s ripgrep='rg'
alias -s fd='fdfind'
alias -s f='fdfind'

alias -s v='nvim'
alias -s vim='nvim'
alias -s neovim='nvim'


# git, ordered by git work-flow
alias -s gs='git status'
#alias -s gpl='git pull'
alias -s gpull='git pull'
alias -s gd='git diff'
alias -s gdh='git diff HEAD'
alias -s gaa='git add -A';
alias -s gca='git commit -a'
alias -s gcam='git commit -a -m "no message"'
#alias -s gp='git push'
alias -s gpush='git push'

# an interesting alternative to writing a batch script and to writing a fish function
# not quite as pretty as a batch shell script though
# not as portable/shareble neither...
alias -s gfuckit 'git add -A; git commit -m "(> \'.\')>"; git push;'

#alias -s g?='git clone'
#alias -s gb='git branch'
#alias -s gf='git fetch'
#alias -s gs='git stash'
#alias -s gr='git rebase'
#alias -s gt='git log --graph --oneline --all'


# dev
alias -s hx='haxe'
alias -s rb='ruby'
# bash
# fish



# experimental
# TODO: test these
#alias -s cl='cloc . --exclude-dir=node_modules,.nuxt,build,.vscode,dist --exclude-lang=JSON'
#alias -s r='ranger'



