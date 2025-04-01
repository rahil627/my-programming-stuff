

TODO:
move to /opt path, then update path var
try to save your software installation commands 'n scripts so you don't have to do that bullshit again!
  - https://github.com/chances/dotfiles/tree/master/scripts



a little short history:

when i got back to computering, after a decade without computering, i got into *making* stuff, including little scripts / programs to do stuff. Because when i got back i started with a Linux command terminal, i started with Bash commands to do everything.

Bash was/is a rather painful experience. Whereas some commands are great: grep, find, etc. (i'm still not at awk level..), in general, i felt the Bash terminal as a mess of non-standard cli application, each of which has their own strange flags, and each doing it's thing in it's own way, often unintuitive.

the idea is great: if you learn the commands, you can then use that same knowledge to write scripts! Yay. But as it turns out, you probably don't want to be writing scripts in Bash. **Running a sequence of commands is fine**, and with the slew of cli apps, that's really all you need to do. But actually writing Bash scripts as you would a program, i just don't feel this is a good idea...

anyway, i think it would be better to just write stuff in a pop "scripting language", such as Ruby, Python, or even Haxe/hscript--Haxe has the doubly usefulness in that it's also a system languagee, and i hope to use it for the Heaps game engine some more! :). Instead of learning all of these commands, command-line-apps, and building up yourself a set of "dotfiles", so that you can make your life more comfortable, i feel it's better to just use the "standard library" that is provided by those programming languages. That way, you learn the standard library, which is more or less the same for every language (file i/o, std i/o, serialization, network, etc.), so then, you're better suited for writing programs. Whereas with using the world of cli apps, terminals, shell scripts, etc., you'd merely be learning how to use other cli apps, combining them, using them as service: dev-ops sort of stuff. To some extent, they are needed, and they can be awesome; But, much of the time, i just feel that instead figuring out which cli app to use, which flags to use, xargs, etc., i could have simply wrote a simple program to do it! (UPDATE: and now with ai code generation, there's almost no reason not to anymore..!!)

and thus, this scripts folder. Likely, i will use Ruby, as i currently use Jekyll for my web-sites, and soon, a parser for my personal mark-up language (via Jekyll), and possibly some plugins for Jekyll too.., but Haxe/hscript are also just as fine. I'd just have to see if i hit the limits of hscript, whether or not it covers much of the std lib or not..
