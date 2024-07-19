
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
seems to be case insensitive, which is great as .net uses caps heavily
doesn't like '-', or any special characters except '_'

# environment vars
$Env:PSModulePath -split (';')
$PROFILE # your powershell's settings go here

# learn x in y minutes
ls # can simply run a command like this!
#Invoke-Expression -Command "ls" # TODO: difference?
if (!(Test-Path $path)) { # or -not
    # note: requires () and {}
}
$array = @("stuff");
$hash = @{key = "value"}

"string substitution is easy as $string $array-value $hash-value"

winget list | select-string "some-app" # pipe 'n grep


# put this at the end of a "module" (.psm1)
Export-ModuleMember -Function * -Alias * -Variable *

# check output properties of an object
this-function-outputs-an-object | Get-Member
or-this-way | select

# then select the object's properties/columns you want to output
some-function | select name, definition, description

# properties and values? TODO
or-this | Format-List Property *

