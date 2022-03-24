todo:
move to /opt path, then update path var
try to save your software installation commands 'n scripts so you don't have to do that bullshit again!
  - https://github.com/chances/dotfiles/tree/master/scripts

a little short history:

when i got back to computering, after a decade without computering, i got into *making* stuff, including little scripts / programs to do stuff. Because when i got back i started with a Linux command terminal, i started with Bash commands to do everything.

Bash was/is a rather painful experience. Whereas some commands are great: grep, find, etc. (i'm still not at awk level..), in general, i felt the Bash terminal as a mess of non-standard cli application, each of which has their own strange flags, and each doing it's thing in it's own way, often unintuitive.

the idea is great: if you learn the commands, you can then use that same knowledge to write scripts! Yay. But as it turns out, you probably don't want to be writing sripts in Bash. **Running a set of commands is fine**, and with the slew of cli apps, that's really all you need to do. But actually writing Bash scripts as you would a program, i just don't feel this is good... todo: but, maybe first i'll try giving bash a proper try...

anyway, i think it would be better to just write stuff in a pop "scripting language", such as Ruby, Python, or Haxe--Haxe has the doubly usefulness in that it's also a system language, that can be compiled to be very fast (And anyway, i like Haxe, and hope to use it for the Heaps game engine some more! :) ). Instead of learning all of these commands, command-line-apps, and building up yourself a set of "dotfiles", so that you can make your life more comfortable, i feel it's better to just use the "standard library" that is provided by those programming languages. That way, you learn the standard library, which is more or less the same for every language (file i/o, std i/o, serialization, network, etc.), so then, you're better suited for writing programs. Whereas with using the world of cli apps, terminals, shell scripts, etc., you'd merely be learning how to use other cli apps, combining them, using them as service, dev-ops sort of stuff. To some extent, they are needed, and they can be awesome. but, many times now, i just feel that instead figuring which cli app to use, xargs, etc., i could have simply wrote a simple program to do it!

and so, this scripts folder. Likely, i will use Haxe, but since i currently use Jekyll for my web-sites (maybe will move to a simpler Haxe SSG), there will be some Ruby too (mods/hacks, a parser for my personal mark-up language, plugins), and who knows, maybe i'll give python another try too, as it seems so loved. But really, i'd prefer to just stick to two languages: Haxe and C#. Haxe for the quick scripts and games (Heaps) and C# for the big cross-platform games (Unity, MonoGame) 'n apps (Avalonia). Python and Ruby cannot server those needs (a game engine would be too slow).
