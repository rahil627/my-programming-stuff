set -l z true

if set -q z
  echo wtf
end

if test "$z" = 'true'
  echo hurray!
end

if test $z = 1
  echo hurray! for booleans!
end



