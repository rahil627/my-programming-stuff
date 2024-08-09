
# see windows-cli.txt

# notes here are related to solely the language itself

# performance is extremely slow and requires optimization, scripts taking several hours before certain optimizations / understanding how it works, whereas ruby/python/etc. have optimizations built in the parser, thus, you'd have to be more careful writing anything cpu-intensive in this

# https://www.reddit.com/r/PowerShell/comments/owsk8b/comment/h7id09k/
# expensive things
#  - static method over function calls
#  - write-host
#  - pipelines
#  - etc.

# naming conventions
# seems to be case insensitive, which is great as .net uses CamelCase heavily
# doesn't like '-', or any special characters except '_'
# don't end folder paths with \
#  $home\my-stuff otherwise it would be $homemy-stuff
#  cp $profile "$configs\powershell\" throws an error

# run it / import it
. .\backup_configs.ps1
import-module .\install_apps.psm1

# environment vars
ls $env:
$env:psmodulepath -split (';')

$profile # path to powershell settings profile



# learn x in y minutes
ls # can simply run a command like this!
#Invoke-Expression -Command "ls" # TODO: difference?
if (!(Test-Path $path)) { # or -not
    # note: requires () and {}
}
$array = @("stuff");
$array[0]

$hash = @{key = "value"}
$hash['key']

"string substitution is as easy as $string"

"string interpolation: $($array[0]) $($hash['key'])"

winget list | select-string "some-app" # pipe 'n grep
$string -match "regex" # pattern match operater (when not piping)


# put this at the end of a "module" (.psm1)
export-modulemember -function * -alias * -variable *

# check output properties of an object
this-function-outputs-an-object | get-member
or-this-way | select
$profile | select-object * # even env vars are just objects

# then select the object's properties/columns you want to output
some-function | select name, definition, description

# properties and values? TODO
or-this | format-list property *


