#! /usr/bin/fish

# NOTE: this is not necessarily a dotfile, as you don't need it, just run it upon updating it

# fish .aliases-fish

# NOTE: if you remove an alias from here, the function still remains
# TODO: this doesn't work... :/ i ended up deleting the function file manually from the ~/.config/fish/functions file
# create our own delete function (including alias)?? :/
# https://stackoverflow.com/questions/36699092/how-to-remove-functions-from-fishshell-without-deleting-the-function-file-direct
# functions --erase command # or -e

# notes:
# add -s flag to all alias -s commands, then run this file as a fish script
# alias -s -s <alias -sname> "command(s)" # or --save
# this will create functions (all commands are functions in fish)
# and they will automatically lazy-load
# otherwise, if you do it the bash/zsh way and throw it all in a file,
# it will load them all into the shell's memory (maybe that's the functionality without the -s flag)
# https://stackoverflow.com/questions/2762994/define-an-alias -s-in-fish-shell

# NOTE: don't use the name of an actual command, it won't override, it'll just execute twice!

# try cover all options: verbose and short

# fish functions
# save the longer functions first! in case you want to alias them
source functions.fish
# WARNING: NOTE: TODO: must run this script in the same working directory as functions.fish

# fish commands
# TODO: what to do about commands that require input?
#alias -s unalias='functions --erase'

# basic shell signals
alias -s c='clear'
#alias -s c='clear' -x
#alias -s ca='clear'
alias -s q='exit'

# basic file system commands
# TODO: finish configing the ls commands
# TODO: should use core unix commands? ls > exa?
alias -s l='eza'
alias -s la='eza -a' # --all
alias -s ll='eza -l' # long (no --long flag)
alias -s lla='eza -la'
alias -s ld='eza -D' # WARNING: TODO: ld is a command-line tool!
alias -s lda='eza -D -a'

alias -s mv='mv -iv' # --interactive --verbose
alias -s cp='cp -iv'
alias -s cpr='cp -ivr' # --recursive
alias -s cpa='cp -iv --parents' # not the same as -p TODO: having problems...
alias -s mkdir='mkdir -pv'
alias -s mkd='mkdir -pv'
alias -s rm='rm -iv'
alias -s rmr='rm -rfv' # -i and -v asks for every file, use -f to skip that
alias -s rmdir='rmdir -v'
alias -s rmd='rmdir -v'


function mkcd --description "create a directory and change to it"
  mkdir -pv $argv;
	cd $argv;
end
funcsave mkcd



# super useful fuzzy search functions
# TODO: test these
# TODO: should create my own simple aliases/functions and then bind them here
alias -s vf='nvim $(fzf)' # vs typing 'nvim' then pressing fzf-file-widget binding
#alias -s cdt='cd $(find * -type d | fzf)' # vs fzf-cd-widget
#alias -s gct='git checkout $(git branch -r | fzf)'



# (f)ile 'n' directory navigator / explorer
#alias -s f='lf'
alias -s f='lfcd' # also c+f binding, NOTE: requires lfcd function
# NOTE: lfcd doesn't show autocomplete/autosuggest of lf flags


# contemporary replacements

# if debian (too difficult: https://unix.stackexchange.com/questions/6345/how-can-i-get-distribution-name-and-version-number-in-a-simple-shell-script)
# don't do distro-only conditionals, just jump straight to nix :)
#alias -s bat='batcat' # debian has a package named bat already, so they named it batcat, wtf

alias -s h='tldr'
alias -s fuzzy='fzf'
# note: ripgrep defaults might affect everything that uses it (fzf, nvim, etc.)
# -i = --ignore-case
alias -s rg='rg -i'
alias -s rgh='rg -i --hidden' # --no-ignore-dot ??, also the -i is duplicated to no ill effect
alias -s ripgrep='rg -i' # rg is the actual command for the ripgrep package
#alias -s fd='fdfind' # package uses fd command on arch, fdfind on debian
#alias -s f='fdfind'
alias -s d='delta'


# apps
alias -s v='nvim' # control+v binding? alt+e for $EDITOR by default in fish
alias -s vi='nvim --noplugin'
alias -s vim='nvim --noplugin'
alias -s neovim='nvim'
alias -s e='doom run' # emacs
#alias -s emacs='doom run' # works without this

alias -s ai='tgpt' # openai's chatGPT
alias -s chatgpt='tgpt'


# dev
alias -s hx='haxe'
alias -s rb='ruby'
alias -s cr='crystal'
alias -s ex='elixir'
# bash
# fish

# experimental



function bind-tree-list
  # TODO: experimenting with this...
  # note: DO NOT replace the original commands, bash scripts need to execute them!
  alias -s lt='eza --tree --git-ignore'
  alias -s lat='eza --tree --all --git-ignore' # vs lta
  alias -s lat1='eza --tree --all --git-ignore --level 1'
  alias -s lat2='eza --tree --all --git-ignore --level 2'
  alias -s lat3='eza --tree --all --git-ignore --level 3'
  alias -s llt='eza --tree --all --long --git-ignore' # vs llat, llta

  # these two are great
  alias -s ldt='eza --tree -D --git-ignore'
  alias -s ldat='eza --tree -D --all --git-ignore'
end
bind-tree-list


function bind-git
  # git, ordered by git work-flow
  alias -s gs='git status'
  #alias -s gpl='git pull'
  alias -s gpull='git pull'
  alias -s gd='git diff' # delta?
  alias -s gdh='git diff HEAD' # delta?
  alias -s ga='git add'
  alias -s gaa='git add -A'
  alias -s gc='git commit'
  alias -s gca='git commit -a'
  alias -s gcam='git commit -a -m "no message"'
  #alias -s gp='git push' # conflicts with pull
  alias -s gpush='git push'

  # can just write small shell scripts this way, avoiding writing a function file (which mostly consists of crap generated by these aliases)
  alias -s gfuckit 'git add -A; git commit -m "(> \'.\')>"; git push;'

  #alias -s g?='git clone'
  #alias -s gb='git branch'
  #alias -s gf='git fetch'
  #alias -s gs='git stash'
  #alias -s gr='git rebase'
  #alias -s gt='git log --graph --oneline --all'
end
bind-git




