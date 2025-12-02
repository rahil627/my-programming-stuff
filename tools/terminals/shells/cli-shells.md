

# UPDATE again:

tl;dr:
1. advanced text editors (emacs, helix, focus) >>>>> cli
  - for a unified file-manager, search, window splitting, git, etc.
    - though lf, fd, fzf, ripgrep, etc. are good on their own, it takes a gui program to bring it all together. helix is proof of that.

2. general prog langs + C libs + cli binaries (any lang) >>>>> shell scripting langs

thus, little is left for the use of shells
  - executing commands
    - that it..?

TODO: can try nu-shell.. at least that's cross-platform, without an agenda!



now with ai, you can ask for it to generate what you need in either: powershell _(meh)_, bash/linux cli tools _(ew)_, and ruby/C/linux cli tools _(much better!)_, and see which one's the simplest. It's also possible to just generate functions in emacs(!), as emacs has a all the shell functionality (file handling, process handling) and more!


but then again, with ai generating everything, it just won't be maintainable, which is how i feel about my emacs config _(and def my nvim vimscript config before that! lmao)_.. it's just a mess.. instead, **i think it's much better to just stick to a general programming language, scripting or even static/systems, because even if you do use ai to generate a function, it's _readable_, _maintainable_, and actually useful for improving programming skill. you can easily edit everything, make it your own way, neatly, simply, improving over time.** in contrast, **there is nothing to learn by stringing together existing cli programs with bash; and powershell feels a bit like ruby but with clunky "cmdlets", a whole extra set of commands _(emacs is already enough!)_, and an extremely inefficient interpreter--_far_ worse than ruby!**

**bash/linux cli/unix is a fucking mess. Microsoft just keeps insisting to make everything their way (.net, verbose), then _using_ the "open-source community" to make _their products_ cross-platform.** yeah.. **just stick to your fav prog langs.. and learn to use some solid C/C++ libs. this way, _you make exactly what you need, and nothing more_.**

**so: just get by with whatever os-provided shell as needed, but don't bother using it for much beyond executing cli programs. don't bother config'ing it either. it's a waste of time. any emacs-like text editor is much better than a shell at everything else, and can even run shell commands from it. and any general prog lang is better than a shell scripting lang!.** 

though, if there's one shell to try, it's nu-shell.. though, eshell is interesting too, lol.. combining emacs and lisp with the shell..!


# UPDATE:
powershell feels light-years ahead of unix / linux shell stuff
  - actually has ruby-like arrays 'n hashes focus and syntax
  - TODO: but it's probably far heavier than simply running dash..
and i love ruby
these two are all i'd ever need
trash the rest (fish, bash, all of it)
  - though, if i ever have to use linux, fish (alongside bash 'n dash) is the way to go.. as it maintains the old unix way of streaming text via output/input



# conclusion:
use any cool contemporary shell for personal use (zsh, fish, ion, etc.) but write the simplest scripts (basically just executing multiple commands and maybe a few control structures) in bash for portability, and everything else in your favorite geneworth adding another language to your memory, when it could be much better used toward a remembering single general programming langauge.

CLI shells combine a programming language ("shell scripting language") with the shell/terminal (the ability to execute commands, including running command-line programs)... However, nowadays, many programming languages come with interpreters (in addition to compiler options) and the ability to execute commands (and process handling), so, the lines are blurry, and thus, given that fact, **i think it's better to invest time in a more powerful general programming langauge, especially if it can be run just as easily as a shell script can a la '!#/usr/bin/env lang' (general "scripting languages": ruby, python, etc., and even lua), or even a *slight* bit extra code from compiled languages might be okay in cases of larger scripts. Although, for very simple things, these are still nice to have, especially to simply and quickly save/run a "batch" of commands, without any bloat, *near-instantly* (no startup time with dash), and then run *those* scripts from another process (via another script, program, or even *service*)**, leading to automation. In the end, **Bash has the power of Linux CLI programs (tons, but most are ancient), and Powershell is just an infinitely more consistent language, data-oriented (as opposed to text-stream-oriented), in addition to being as powerful as a general programming language (can even use the .net lib..), and now with the recent addition of being cross-platform, where does that leave bash..? I guess bash is still there as a simple thing to run commands.. For people that are neither a fan of .NET/CLR, however, that choice doesn't make much sense, and it is best to choose a general programming languge: for me, that's Haxe (and hscript?) and Ruby.**

Linux is definitely about it's CLI tools, and scripts are a way to string them together. It's just normal, how Linux works.

Windows, i feel, isn't as CLI heavy, so you won't be using it as often--you'd be using GUI apps--, and when you do, it's probably more in a programming way/feel (writing a program) rather than a quick script way/feel (that just runs a chain of commands--linux cli programs).

For Windows, you'd likely get more familiar with the Microsoft way of doing things, Powershell and .NET standard library, which'll transfer into C#, and general programming. For Linux, you'd need to be savvy enough to be able to find useful CLI programs in package managers (https://archlinux.org/packages/) or github, be able to use them, and then execute them in a script. **As far as i know, Bash doesn't really have a standard library to do stuff(??). It wasn't really meant for general programming.** Whereas for Powershell, you can do everything that Bash does, but you'd be more inclined to leverage it's programming power and it's standard library more, rather than rely on other CLI programs. But at that point, **you might as well choose your favorite programming language**, thus making Powershell quite useless too.

Linux is a mess of CLI programs and scripts, written in *tons* of different languages. Windows is a lot more insular, with just powershell (although of course you can install any language and run any script too). That's just the feeling i get.

Nowadays, Windows has Windows Sub-system for Linux (WSL), so that you can retain all of your linux tools, memory, knowledge, 'n habits.





# todo:
use ai to gen commands:
https://github.com/TheR1D/shell_gpt
  - there's surely other ones.. but this does have a ton of features!

go through the docs
  - https://fishshell.com/docs/current/tutorial.html
  - they're really good

https://github.com/pry/pry
  - use ruby in the shell?? :o



# get file-path of shell
which [shell name]

# change shell, will send you a prompt
chsh


# a note on seperation
a shell's terminal can be used without ever using it's paired scripting language (save beyond running commands), and vice versa, so, **choose both (the terminal app and shell scripting language) seperately**. You can use fish with bash scripts, or zsh with fish scripts. It doesn't really matter. Only that you'd need to install a zsh or fish interpreter to run them (and for that reason, bash is still accumulating it's monolithic mess).




# shell scripting

see my conclusion in scripting-languages.txt

## read it, do it, experience it
https://learnxinyminutes.com/docs/powershell/
https://learnxinyminutes.com/docs/bash/

https://developerlife.com/2021/01/19/fish-scripting-manual/
  - very good overview of fish scripting lang, very practical

https://fishshell.com/docs/current/fish_for_bash_users.html
  - **a great overview of the differences and improvements over bash**


todo:
https://fishshell.com/docs/current/tutorial.html
  - read through this?
  - compare with zsh



## thoughts

bash (and i believe even zsh??) has janky syntax, with strange things for basic if statements (if [statement]; then, ...) and even that is different when it's on a new line, basic switch statements, strings (escape with "" or $"" or $"$v"??), math, and old syntax using `$` everywhere, including for special vars `$#`, making it feel something closer to Perl or PHP, both of which are old and cryptic to me (see the ~"fish for bash users" link for a good overview of the many problems of bash). A ton of things are confused due to syntax, especially sub-shells vs command substitutions (parenthesis vs back-ticks vs square brackets). **Yeah... fuck bash. Even zsh seems like garbage, changing only a little, and further confusing it's own syntax with bash syntax. It's either super basic bash/sh batch scripts (a list of commands), some better newly designed scripting language (fish, kitty?, elvish, etc.), or a proper scripting language, with my personal preference toward a proper scripting language, such as ruby**

**perhaps can even find some way to use ruby as the main shell language...**
  - irb
  - pry
  - ru
  - some ruby shells
  - etc.




## research
https://stackoverflow.com/questions/11369522/bash-utility-script-library#11369935
  - i think i was pondering on why there's no bash standard library
  - the answer points out bash's limitations really well, mainly:
  - "**Bash functions don't return anything; they only produce output streams. Every reasonable method of capturing that stream and either assigning it to a variable or passing it as an argument requires a SubShell, which breaks all assignments to outer scopes.** (See also BashFAQ/084 for tricks to retrieve results from a function.) **Thus, libraries of reusable functions are not feasible, as you can't ask a function to store its results in a variable whose name is passed as an argument** (except by performing eval backflips)."

https://askubuntu.com/questions/20414/find-and-replace-text-within-a-file-using-commands
  - recommneded to use sed (Stream EDitor)/awk/favorite scripting language instead
  - Bash isn't really meant for text processing, but simple substitutions can be done via parameter expansion , in particular here we can use simple structure ${parameter/old_string/new_string}:

#!/bin/bash
while IFS= read -r line
do
    case "$line" in
       *blue*) printf "%s\n" "${line/blue/azure}" ;;
       *) printf "%s\n" "$line" ;;
    esac
done < input.txt

https://stackoverflow.com/questions/4397412/read-edit-and-write-a-text-file-line-wise-using-ruby
  - In general, there's no way to make arbitrary edits in the middle of a file. It's not a deficiency of Ruby. It's a limitation of the file system: Most file systems make it easy and efficient to grow or shrink the file at the end, but not at the beginning or in the middle. So you won't be able to rewrite a line in place unless its size stays the same.

the simple way:
# just read it all into memory, modify it, and write it back out
path = '/tmp/foo'
lines = IO.readlines(path).map do |line|
  'Kilroy was here ' + line
end
File.open(path, 'w') do |file|
  file.puts lines
end




# shells
should choose one and stick to it

## cross-platform:
there may be some newer rust stuff that's just better than even the stuff the OS folks make!

see nu-shell
  - TODO: worth trying..
  - it honestly seems like powershell, but you know, without the microsoft crap!

## Windows:
you have no choice, it's just powershell

although, you can install Linux (via WSL), and i think there's a bash shell now too (though, without the linux tools, i'm not so sure how useful it would be...), though you'd be much better off just installing a desktop-less minimalistic linux distro, and get the best of both worlds)

**powershell**
  - overall has a very *consistent* feel too it
    - **GREAT help command with VERY consistent documentation**
    - consistent naming conventions for the std lib, which makes them pretty easy to remember, and very easy to search (no ancient cryptic linux cli programs!)
      - **consistent names used for cli flags!!!**
      - this is one time where Microsoft's strict naming conventions really is a blessing, beating out the sloppy open-source mess that is unix
    - just jumping to powershell is infinitely better than jumping into linux, which just feels like it's full of archaic crap
  - structured data kicks butt
    - structured data enables for the creation of a standard set of functions to alter data, which is done via pipeline operator, similar to sql and linq-to-sql
      - **makes it feel more functional, focus on data trasnformation as opposed to text streams**
      - **TODO: however, i'm not sure how backwards-compatible it is to the text stream ways that all linux cli apps use..**
      - https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-object?view=powershell-7.4
        - Get-Process | Select-Object -Property ProcessName, Id, WS
        - Get-Process Explorer | Select-Object -Property ProcessName -ExpandProperty Modules | Format-List
        - Get-Process | Foreach-Object ProcessName | Group-Object
        - Where-Object
  - the language is closer to a general programming language, like VB.NET
    - **very nice 'n simple syntax for lists 'n hash-maps: @() and @{} (.NET arraylist/hashtable) and can iterate with foreach loops, lua-esque**, reminds me of ruby..
    - has fish-like comparison operators: -eq -lt -gt
    - **LOVE the use of case-insensitive-snake-syntax!!**
    - making a "cmdlet" is wierdly verbose, like C# attributes.. but vs-code has great code-generation to make up for it
    - install-module (from a package repo)
    - modules / import-module
    - linux tools/commands required tldr to use
  - have access to the .NET library and a few other important libs (??), which makes it a nice side-kick for people of the C#/Microsoft world
    - this makes it powerful enough to do anything (it even has classes!), however, it suffers from being really slow in doing certain things, so cannot compete with even proper scripting languages (ruby, python)



## Linux:

conclusion:
i ended up using fish shell. It just worked. Functions were simple to create too. I didn't want to get too deep into shells compared to just using a big scripting language (ruby/python), so fish made a perfect replacement for bash. The scripting language, though wayyy better than bash, only felt like a step up and still felt old. Fish was great for it's out-of-box experience, not so much for it's advanced uses.

if i were to choose again, i'd look into nu-shell. As it's rust, it'd be cross-platform, so it'd work with windows too. Although, powershell is now cross-platform too.. Otherwise, fish is still fine, even being re-written in rust, and so maybe will become available for windows too!

https://www.howtogeek.com/68563/HTG-EXPLAINS-WHAT-ARE-THE-DIFFERENCES-BETWEEN-LINUX-SHELLS/
  - a good straight-foward tech post abuot the history of shells

https://hyperpolyglot.org/unix-shells
  - a great web-site, comparing many shell langs and providing some history too

basically:

the old bourne-like shells:
sh = bourne shell
  - the main precursor and origin to/of the most popular future shells
bash = bourne again shell
  - most prevalent, used on all desktop Linux-derived OSs, including Mac OS X (until recently)
  - have this by default, still necessary to run bash scripts
  - history: was created by open-source people GNU while they were creatin their free OS
ash = Almaquish shell
  - a light-wieght sub-set(?) of bash used in embeded systems
  - you can find it on the tiny Linux distros installed on mobile devices, sch as ArchLinux, which itself uses BusyBox
    - i personally have "iSH" app on my iOS device, and this thing is lightning fast!!!, this is actually where i played with and learned vi: because it was *so* much faster than using CLI with my server


the current bourne-like POSIX-compliant shells:
*dash* = d..? Almaquish shell
  - based on ash, and therefore also light-weight, quick
  - used internally by Debian to handle shell tasks/services/scripts as it's lighter 'n faster: ~100kb! (compared to 1mb)
    - *super-fast!*

zsh = z? shell
  - a super-set of bash, used on contemporary desktop systems
  - **Mac OS X recently replaced bash with this**, thus making it the current standard
  - more features, more configurability, etc. **it's basically the neovim of shells. There's plug-in managers, infinite plugins, everything you could dream of.**
  - by default the shell is quite bare, especially compared to fish which ships with auto-completion/auto-suggestion, syntax highlighting, spell-checking, ignoring input mistakes, etc. However, there are plugins for all of these (to directly compete), and more.
  - for the most part, works well with bash, though still not POSIX compliant
  - **comes without any functionality and will require manually tinkering add-ons over time to get it set-up right**
    - so will need to get some package with clean defaults, similar to doomemacs 'n nvchad
      - i heard 'oh my zsh' is bloated, so just find a minimalist one that replicates fish's core funcionality, 'n go from there


the newer stuff, post-bourne:
nu-shell
  - structured data as opposed to streamed text data, similar to powershell
  - TODO: read pros 'n cons here: https://www.reddit.com/r/rust/comments/19ev6u3/what_do_you_think_about_nushell/
  - "data oriented approach, more modern, vastly more powerful, less cryptic, more consistent so way easier to use for complicated stuff."
  
ion
  - a component of the larger RedoxOS project, a complete OS written in rust
    - they also created the 'termion' library for rust, which handles terminal i/o
  - Rust

elvish
  - https://elv.sh
  - seems fishy
  - **actually very lispy**
    - **a very powerful language, including lambdas 'n all**
  - **directory history *and* command history search seperated** (programs and shortcut)
  - **built-in file-manager** (program and shortcut)
  - simple syntax, like fish
  - a little std lib?
  - more pipeline power?
  - extremely clean web-site, very simple, seems like a growing language (released in 2017, and still updating every few months)
  - overall looks very cool! can try it out :)

**fish**
  - UPDATE: re-written in rust (in 2025)
    - https://news.ycombinator.com/item?id=42535217
  - UPDATE:
    - https://www.reddit.com/r/ProgrammingLanguages/comments/165co33/comment/jydbex4/
      - "...This con doesn't actually say anything specific. Fish is honestly great for the 2020s and beyond. Excellent autocomplete and syntax highlighting out of the box, proper XDG base path specification support, excellent configurability via a GUI, the ability to easily modify environment variables and have them immediately reflected across all shells with no rc file fiddling needed, and the ability to source bash scripts using bass.

      Fish is still updating itself to stay relevant in the modern age as well, with the current rewrite from C++ to Rust and the planned future upgrades for migrating from wchar_t to UTF-8 and incorporating more concurrency."

  - "a beginner-friendly shell" that ships with contemporary functionality / sane defaults: auto-suggestion & auto-completion, highlighting for errors, spell-checking, colors, etc.
  - "If you want to make your command line more productive, more useful, and more fun, without learning a bunch of arcane syntax and configuration options, then fish might be just what you’re looking for!"
  - "a shell for the 90s" lol
  - not POSIX compliant, so bash script may fail
    - https://stackoverflow.com/questions/48732986/why-how-fish-does-not-support-posix
      - cannot run a script with `#!/bin/sh`, you'd need `#!/usr/bin/fish`, and the user would need a fish interpreter installed
      - you cannot simply copy-paste snippets of scripts from the net and expect them to work
      - **basically, it's just a different language, so treat it like so**
      - **this is a problem of standards, because really, none of the shells are POSIX-compliant!**
        - (see link in comments section of the SO question)
  - although the syntax and semantics are indeed better, it doesn't change much from the normal POSIX stuff (bash, etc.), which is strange--why not just create a completely new lang(?), closer to python/ruby! The trade-off is tough: lose the ability to share the scripts that you write (will people install a fish interpreter?), and although you can simply still use bash-like scripts, it's just confusing to add yet another language with such little differences: because *it is precisely those little differences that will become bugs!*
   - having said all that, it's still a great shell to install, use, out-of-the-box, sane defaults, etc. etc. There's no need to actually use the fish scripting language. You can just continue to use bash scripts.
   - it's a great stepping stone to the more bare zsh, where you'd need to configure quite a bit to get it to fish-level. Consider fish as **zsh with a solid starter config kit**
   - it's also awesome for "dev ops", so they can just enter workstations/servers, quickly install fish, and continue with life
   - it's also a much better idea to allow the makers of fish to choose and update the shell rather than configuring yet another linux thing--neovim config is arduous enough!!
   - update: as it turns out, fish is just a much newer design, all around: aliases are simple functions (with lazy-loading!), strings are arrays (thus saving you from parsing and accessing words 'n args), strings are escaped properly (don't need to worry about "v" vs $"v", or whatever), and theres prolly a ton more stuff like this. So, even without the language, it just seems overall better to ditch old "posix standardized" bash, zsh, and ofher variants
   - **also has vi *and* emacs mode!**



others:
csh, tcsh, one other one = c shell, improved c shell, ane one other one
  - C-like shell with more scripting ability than the bourne shell? A bit dated now..?





