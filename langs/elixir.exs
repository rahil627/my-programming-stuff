

# install
https://wiki.archlinux.org/title/Elixir

# windows
scoop install erlang
scoop install elixir

# linux
sudo pacman -S elixir
# depends on erlang, so it should install it too

#export PATH="$PATH:/path/to/elixir/bin"

fish_add_path (which elixir)


# post-install
# install elixir's hex package manager
mix local.hex

# list all cli tasks
mix help

# run a script (.exs)
# is it really that simple to run a script!?
# ...but i think you have to build it first..?
elixir seeds.exs

# build the app
# NOTE: must be in the project's directory
mix

# build and run?
# NOTE: must be in the project's directory
mix run priv/repo/seeds.exs



# setup language server (elixir-ls)
## vs code
simply install the extension: elixir-lsp.elixir-ls
NOTE: in order for it to work, by default, you must open the folder where the project was generated, which has a .elixir_ls folder in it

## helix
# TODO: uh-oh


# https://learnxinyminutes.com/docs/elixir/

# cli
iex
  - interactive elixir console

elixirc
  - compiler



# mix
# mix.exs

## dependencies

# defp deps do
# ...
{:igdb, "~> 1.0", only: [:test, :dev]} # 1.0 will fetch the latest 1.0.x version

mix deps
# - list deps

mix deps.get
# - fetch deps






# syntax

def do_something do
  do_something_else()
end
#  - function doesn't need (), but the call does

# for loops
# normally should never use it..?
for n <- 1..10 do
  Repo.insert!(GameMaker.gen_game())
end

# alt?
Enum.each(1..10, f(x) -> x.do_something()) # TODO: just a guess..

# normally use lamba style stuff on collections
# TODO:



# Atoms are constants whose values are their own name. They start with `:`.
:hello # atom
# this. is. great.

# Tuples that are stored contiguously in memory.
{1,2,3} # tuple
elem({1, 2, 3}, 0) #=> 1

# To concatenate lists use `++`, for binaries use `<>`
[1,2,3] ++ [4,5]     #=> [1,2,3,4,5]
'hello ' ++ 'world'  #=> 'hello world'

<<1,2,3>> <> <<4,5>> #=> <<1,2,3,4,5>>
"hello " <> "world"  #=> "hello world"


[1,2,3] # list
[head | tail] = [1,2,3]

# In Elixir, just like in Erlang, the `=` denotes pattern matching and
# not an assignment.
# {a, b, c} = {1, 2} #=> ** (MatchError) no match of right hand side value: {1,2}A

# Ranges are represented as `start..end` (both inclusive)
1..10 #=> 1..10

# Maps are key-value pairs
genders = %{"david" => "male", "gillian" => "female"}
genders["david"] #=> "male"

# Maps with atom keys can be used like this
# NOTE: this is used very very often in phoenix!
genders = %{david: "male", gillian: "female"}
genders.gillian #=> "female"

# TODO: stopped here


# looping
for n <- 1..10 do
  something()
end

data = 1..10
Enum.each(data, f(item) -> something(item))

data = ['a', 'list']
data.map(f(x) -> something(x))




# NOTE: can't define a function outside a module!
# ..but you can define a module in a script!

defmodule Tonberry do
  def attack do
    target(calc_dmg)
  end
  
  defp calc_dmg do
      length_of_knife
  end
end

Tonberry.attack
  


https://github.com/wojtekmach/mix_install_examples/tree/main
  - most minimalist uses of many libs 'n frameworks
  - scripting with elixir!
