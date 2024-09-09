# the opinions of more experienced programmers



## Jon Blow's opinion
https://www.youtube.com/watch?v=4t1K66dMhWk&t=3635s
  - Jon Blow's rant on rust
  - **the main problem of programming languages, especially for games**:
    - most langauges that aim for being memory safe use a garbage collector that doesn't allow you to manually alter memory.. (and you want memory safety for when a reference/pointer is pointing to a memory that was de-allocated or re-used, or worse: the page of memory was removed by the OS causing a page fault and thus crashing the app)
        - crashes are actually better than not-crashing and being silent about having the wrong data in memory
      - smart pointer (reference counting? ew.) doesn't solve it, as you wouldn't want to authorize the class holding the reference to keep that referenced thing alive
      - weak pointer doesn't solve it either, as the systems to nullify it would get complex and add cost, and adding checking for null adds more chances for errors, until you add some sort of pointer system, which ends up costing the same as looking up an ID
      - example: object a is following object b, thus needs a reference to it
      - one common solution: a container of entities is stored, then looked up (hashmap or array). this guarantees memory safety at the cost of an object a looking for object b (within the container) every frame(!!)
      - a more complicated solution: in an ECS, dynamic arrays ("vec") of components are stored, this guarantees memory safety at the cost of an object looking for a component of object b every frame (in some generated index of a dynamic array)
      - the main point of the video: rust's borrow checker didn't save the programmer from memory problems, rather, the programmer simply refactored the code in a way that the borrow checker won't check (pointers were changed to indicies of a dynamic array): the borrow checker is confused and doesn't know that the programmer is allocated memory theirself (via dynamic arrays). (or does the programmer simply turn off the borrow checker?? lmao!)
      - **in the Witness, it's literally just an array of indexes (or array index?)**
      - **in the sokobon game, the id uses 32-bits, the top bits for user id and the bottom bits for the entity id, and use a hashmap for it, because that would be a really big array, because the high-bits are set**

https://www.youtube.com/watch?v=y2Wmz15aXk0
  - **the idea of using a scripting language in a game was a failed experiment**
  - scripting languages are "slow, bug-proned, impossibile to debug"

# other junk
https://www.youtube.com/watch?v=klE9bzWJbHc
  - video of some millenial streamer that tries jai, but it works
=======
check SO yearly surveys
  - https://insights.stackoverflow.com/survey/2021#technology
  - but beware, this only covers most popular stuff, and is extremely web-oriented and C#/.NET-oriented; little to nothing for specialities like game programming or quality indie apps
  


# todo:
jai
  - try to get beta
red
  - seems like a dream lang!!
  - https://www.red-lang.org/p/about.html
lisp
  - try sbcl
  - use scheme in helix (maybe there's a git branch..??)

# conclusion:
languages sorted by their use cases

## general langs
**lisp (common lisp, sbcl)**
  - **true zen programming**
    - god-like macros, "interactive" dev experience including debugging, 'n more!
  - used wherever one would use C, Go, custom scripting (game, app), and more!
  - wish i knew about this earlier ;(
  - beyond syntax, there's really no reason not to use this for everything, except that other languages have better maintained libraries

**ruby**
  - **great for quick, simple, everyday small scripting to pretty large size projects** thanks to it's **great battle-tested modular libs** (that's the main benefit old, popular languages)
    - runs as simply as a shell script, no main class or anything needed, and looks beautiful too!
  - possibly **the most expressive** language
  - has **my favorite syntax**
    - attracts a *clean*-design-oriented cult commmunity with meta-programming abound (DSLs, etc.) 
  - meta-programming built-in and object-oriented makes it a good step toward both lisp and smalltalk
  - recent Ruby 3.0+ interpreter speeds are among the quickest, and with the recent JIT, even quicker, so, along with writing some portions C code, there's really no performance argument. It really could be used for games, just as lua is.
  - **great simple-and-quick-to-get-started/prototype frameworks 'n libs: web-app (back-end), cli? (not portable), (not gui-apps?), automation, devops, hacking**
    - community pioneered frameworks and products for hacking (metasploit), sysadmin/automation (chef config management, jenkins ci, etc.), rake
    - **jekyll (github pages) for static web site**
    - roda for simple dynamic web site
    - ruby on rails for quickly making a large or rich ui web app
      - both replaced by elixir's phoenix framework
    - tty-toolkit atop ncurses(?) for cli/tui apps
      - doesn't make sense due to lack of portabile executable
  - **open-source language not run by a corporate giant**, yet used by and supported by giants (github) and japan!
  - (still need python for ai/ml/stats/math/etc. data sciences)
    - could probably just port what you need, adding to ruby's libraries??
  - **with mRuby 'n Crystal, can keep favorite syntax and use for nearly everything**
    - "mruby bytecode can be embedded in C code, and thus, can be compiled into a standalone executable." via normal c compilers (gcc/clang)
    - has a virtual machine too, for quicker debugging/execution
  - restrictions: real-time interaction (just write C), no simple cross-platform compiled binary executable (no current packaging tool either?), concurrent and parallel programming both slapped on, dynamically-typed and meta-programming (and therefore tough debugging and auto-completion problems)
  
(**jai** >) **haxe** ?= julia == crystal == nim >? C# > java/kotlin
  - general all-round use, powerful, can cover every use-case (use C for manual-memory management), statically-typed (except julia?)
  - **haxe** for general all-round use, **cross-platform in mind**, garbage collected, powerful (**lisp-level macros**, **ADTs**, metadata, etc.), small Flash-game-oriented community, simple actionscript syntax
  - haxe always had cross-platform in mind
    - c# took a long long time to reach c# core (previously mono)
  - haxe and julia are the ultimate garbage-collected "kitchen-sink" languages
  - most use llvm compiler and are comparable in speed (magnitudes faster than scripting langs)
    - c# didnt have a native compiler until 2024!! (.NET 8)
  - all use a garbage collector, so C code will be written seperately and then called
  - **resulting programs more portable/cross-platform due to compiled executable binary**
  - all are powerful in features: macros (in C#: "source generator"), ADTs, etc. metaprogramming, generics
  - many come with multiple compile options for quick testing/running: interpreter, bytecode/vm (haxe/hl), in addition to standard compilation
  - able to contribute to a tiny game-oriented community (haxe, jai)

  
## specialized langs:
don't have much of a choice for these..

**powershell (v7+)** > fish > bash/zsh
  - batch commands, extremely simple scripts (in bash/powershell) for portability
  - personal basic shell functions/"modules"/"cmdlets" (powershell > fish; *fish script is now completely useless!*)
  - automation, especially for windows
  - bigger scripts
    - powershell is powerful enough to do just about anything, and thanks to it's access to the .net framework, it actually can do anything
  - powershell is now cross-platform (since v7?)
  - quite specialized for shell cases
  
javascript (and typescript?)
  - not really special, just happens to be the standard browser language
    - can't seem to run from it, though i can keep trying!
  - i'm told it's much much better than it used to be

various custom scripting laguages (**wren**, gdscript, verse, etc.)
  - wren seems the ideal, open-source, beautiful and simple embeded scripting lang
  - games, big apps, embedded devices
  - https://dev.epicgames.com/documentation/en-us/uefn/verse-language-reference
    - a good view of desires in a game scripting lang

## special use-cases:
smalltalk
  - has potiential to provide the best programming experience, especially for games!
    - "Smalltalk, most readable language, you can alter *any* part of it while it's running making a killer dev experience"
  - **glamorous tool-kit**

julia
  - **a FFI for nearly every popular language**
    - the ultimate glue-code language!??
      - i doubt it.. there must be so many memory-related problems specific to each FFI..
      - i think it just compiles into a shared library, which then can used by other languages (python, ruby)
    - standard FFI for C and Fortran only
    - "community" maintained FFI for:
      - https://github.com/JuliaInterop
      - R, MATLAB, C-like langs, Java
        - **basically a glue-lang for all the old languages used in scientific academia**
go
  - TODO: maybe replaced by lisp (common lisp, sbcl)!
  - **zen systems programming**
    - **a great way to get back into programming, and getting shit done, without being overwhelmed by features (haxe, ruby, 'n especially rust all suffer from this in their own way)**
      - though, i still prefer haxe.. and haxe's little community <3
  - very very limited in use-cases: small, portable programs ("micro-services") often in web back-end and cli-apps
    - no games, no ui apps?, etc.
  - "Go is easy, it doesn't teach you a lot. It doesn't try to. It wants to make you productive quickly for a narrow, focused set of use cases."
  - concurrency
  - quick building binaries
**elixir**
  - **has the current best scalable and easily-maintainable web framework: phoenix**
    - suitable for both small web apps (roda) and massive web apps (rails)
    - makes good use of the VM's concurrency and provides an elegant way to handle it
    - better written / more manageable once it's big due to functional programming design patterns
  - functional
  - particularly useful for any kind of **concurrent/parallel computing**, since it runs on *awesome* Erlang VM (BEAM). Used for distributed/fault tolerant/highly available systems (such as Discord and WhatsApp)
  - can also be used to write beautiful programs with it! (merges the beauty of ruby syntax with functional paradigm
    - pretty terrible for cli-apps though, as it requires installing the VM to run it (compiled to bytecode), has some start-up time (200ms), so best used in situations where the VM is constantly running (servers)
haxe
  - transpile to js/wasm or many other langs (don't write js!, and stay in the compiled world)
    - https://haxe.org/documentation/introduction/compiler-targets.html
      - tier 1: **js**, hashlink (bytecode/**c**), eval (interpreter), jvm (bytecode), php7
      - tier 2: **c++**, lua
  - suffers from lack of community/libraries, though it is amongst the longest living contemporary languages and constantly updated and improving, with a very solid std lib like go
**jai** > **rust** > C++
  - low-level, manual memory management, but with features
  - rust guarantees memory safety at the cost of following their "borrower" convention, and is just much newer (by decades!). But, it's not an end-all solution to memory-management, especially in the case for games
    - **skip rust, and wait for jai**
  - "Rust is a kitchen-sink language that can do anything well if you're willing to put in the time to learn how to control it."
  - "modern" C++ (>11) is actually legit
**zig** > odin > **C**
  - low-level, even low-low level!, manual memory management, but with less features
  - best to stick to C as it is *the language* of nearly everything, especially consoles, mobile devices, and embedded devices, and has libs for all of those devices. one cannot keep running away from it ;) anyway, it's nowhere near as bad as the older C++!
  - zig is very very good here, but i hope i never have to go down to this level
Ocaml
  - often used for parsing/compilers (haxe, rust), and other problem/solutions that requires heavy pattern-matching, and benefit from warnings for cases not handled, warnings for mutable data too
  - resulting programs are quite pretty thanks to it's functional paradigm side and concise syntax
  - ..i just personally really liked the feeling of it, seeing it in haxe's compiler



## special mentions
**crystal**, although it has all of the things i want--Ruby syntax, good C api, *real* concurrency, macros--*including nice macro syntax too!* (much simpler than haxe, closer to lisp), performance (static-typing and compiled via llvm), etc.--Haxe is *far* more developed and has been in production use for a long time now, including a top-tier JS/web target, a fast-compiling and performant VM target, and tons more stuff, in addition to solid cross-platform app and game frameworks

pharo or squeak or cuis, the main three Smalltalk dialects, for god-like productivity, can alter anything *any time* (while the program is running) making it really ideal for a game programming environment


## no
x/older shell languages (bash, zsh, fish, etc.) for shell scripting, more like gluing, these languages *suck*, feel old--no, *are* old, full of '$'s, so, only use them if you need a basic batch file (run a bunch of commands), or for shell piping (but it might just be easier to use Ruby in most cases, even for simple batch scripts, as it's more popular than all of the shell scripting langauges)


## notes
although having Ruby for scripting, Crystal for native, Elixir for server-side sounds like kick-ass dream combo as they all share similar syntax across--all Ruby influenced--, unfortunately, they would'nt share a single library :(. There is seemimgly zero interoprability between them (Elixir can work with Erlang, Crystal has good C api and can thus be called by Ruby (via Anyolite lib) but cannot use Ruby libs. Thus, its better to just stick with Ruby 'n Haxe for most cases. Elixir, however, does have a good case for parallel-computing web servers.

it seems like Ruby is still better for general scripting, mostly thanks to it's vast industry-tested libs. As for Elixir, once you include another file, you basically have to create a project for it. For Crystal, you must either compile it every time in order to run it (just adds a second) or save the compiled binary (i'm not sure if the eval interpreter is enough...). For Haxe you have all of those choices plus more: interpreter, VM bytecode, LLVM-optimized C binary; you just need to make sure you have a Main class ;).




# what langauge is best for my needs?
## my needs (or wants?)

it should be "high-level" (specifically, not forced to handle pointers, references, and const), preferrably wiith many cool contemporary features
it should be relatively fast (at least faster than ruby and python interpreters)

for simple fun OS shell and web server hackery: :D
  - it should have an interpreter, so that you can just run it via cli （for example： user/bin/[language] for bash）
  - it should be able to run on both server-side and client-side (both: interpreter or compiled, for simple scripts and complex games/apps)
  
for games (and other "creative" applications that use various input/output hardwares): :D
  - it should have the option of memory management, for fine-tuning intense memory changes--textures going in 'n out--yet i should'nt be forced to handle memory, thus
    - it should have automatic garbage collection (pass by reference), yet 
    - it should allow the option to write "unmanaged code" *and/or* make it very easy to interop with C/C++ so that you can just write C/C++ modules when needed *(note: nearly all langauges allow this..)*
  - it should be designed to be cross-platform, or at least have that in mind
    - compile to C (for most platforms: desktop OSs, iOS (+ iPadOS), consoles, embedded devices, etc.)
    - maintain a set of libraries for target platforms: iOS > desktop OSs > consoles > the rest, in that order
    x/- compile to Java for Andriod (i personally don't care about this platform... non-iOS mobile devices are a mess)
  
  
## answers and some thoughts
### the cross-platform problem
as far as i know, only Haxe (indie), Rust (Mozilla, an open-source company), C# (Microsoft), Dart (Google) fit all of the above requirements above. The need for cross-platform "target" compilers (at the least, to C, if not native binaries) and cross-platform standard libs really narrow down the choices, as most newer languages just won't have neither the library nor compilers, *yet*--they have the potential tho. It's really up to the people, including big corporations, to build them up, along with building various frameworks using them, and then to maintain them... Only time will tell. Beyond those languages though, i haven't really seen many good cross-platform libraries... *note:* Rust is included, but a bit special, in that it had a newer way of handling memory that's supposively not too bad. (*todo: I'd have to look into the C# and Haxe FFI like, is it easy to just call a C# function that calls the native (C/C++/obj-C) iOS function for "share"? If so, then *that's major*, for me, a game-breaker, really. Otherwise, you'd have to maintain an entire set of iOS bindings, and bindings for every platform!*)

see ["app frameworks.txt"]

see ["game frameworks.txt"]

as far as using C# as a scripting language, well, there's the Rosyln compiler (part of open-source .NET foundation) and "cs script", but i'd have to look into it some more.. it'd def be chunky, maybe Powershell would suffice tho.

**nearly all high-level languages interop with C, so, i see no reason to write an *entire* program in C or C++ --or even Rust!_**, leave that to the game-engine makers, and **anyway, you can always write C (and maybe simple C++) for the intensive sections when needed** (i doubt i'll ever need to). *I don't want to even think about pointers or references, and definitely not smart pointers! :barf:* 
  - **writing the core in C/C++ is perhaps the best option, as you get the best of both worlds: manual memory management for the core, and a light-weight scripting langauge on top (Lua, Wren, mRuby?), or, people can create high-level bindings in their favorite langauge of choice**

as long as the language can compile to C/C++, then it should, in theory, work with just about any device (desktop, mobile, embedded, whatever). The problem is that it'll have to link to the libraries that each platform uses, which is likely C/C++/obj-C (exception: Android uses Java). If the application doesnt need to use the platform's libraries at all, however, i guess a binary is enough (apps/games for web assembly, desktop).


## libraries matter
libraries, including frameworks, engines, matter. Altough you could use just about any language to solve just about any solution, certain languages are better suited for certain... *areas* in programming. This occurs naturally: someone wants to make something, solve something, they *hopefully* try to choose the right tool for the right job: the right language. Thus, the **language is just a tool** to do a job.

Over time, people who use the language will create libraries, *hopefully* many of which are open-source, thus buidling up a huge collection libraries specific to that language. **That resulting library, the contents of the library, is really an effect of the language itself, along with the community behind it, it's pop frameworks, etc.** If the language was created for intense math, then intense math libraries will likely be the result. (todo: If the language has particular traits to it, or a style, such as focusing on being neat, tidy, and *clean*, as in Ruby or Python, then it might have a community following...)

Languages often have their own package managers: haxelib for Haxe, RubyGems for Ruby, NuGet for C#. Just by looking at the package manger, you can get a pretty good idea of what that language is mostly used for, and the power of the big frameworks in it. So, in RubyGems, the Rails web framework is a huge force, and much of Ruby is indeed used for web dev, along with general scripting / cli. In Haxelib, game 'n app frameworks such as OpenFL and NME are by far the biggest forces, with game frameworks and game-related libraries following after Htodo: check out NuGet). **I think checking what's in the package manager, in the library, is a good way to compare languages, instead of comparing the features of the language itself**, as it's the people that make the languages, not vice versa.


# important changes in dev tech
## WebGL is dead. Long live native dev.
with WebAssembly now, can just skip the whole HTML5/WebGL crap and basically run native apps (machine code?) in the web-browser :o :O luckily, i've never cared about web-targets, but now it's finally really dead! :) No Flash. No HTML5/WebGl. *Long live native dev.* Maybe.

## Microsoft <3 games *and* now open-source too?
.NET *Core* is like a whole new revamped open-source cross-platform beast. In the past, Microsoft/.NET was tied to Windows, and so *the people* created Mono as an open-source cross-platform version of .NET, but now, the new .NET Core can truly be used to make *everything*! (I guess Mono is dead..? Or maybe it was used as a base for .NET Core??) *The C#/.NET stock is rising...* Thus, app frameworks like **Avalonia** and **Uno** can compete with Google's Flutter, and the game frameworks like **Unity** and **MonoGame** (based on Microsoft's own XNA framework used in the original Xbox) are still respectively the *the kings of indie game engines*. Microsoft is doing well. All of that, alongside open-source-made VS Code, and the fact that Windows always had a monopolty on games. Microsoft has always been closer to games than both Google and Apple have ever have been, and now it's really showing.

## move from dynamically-typed to static-typed
"imo, not having static typing is a real pain for anything bigger than a small script, as it introduces a lot of potential bugs" - CRobes, from the haxe discord

**i don't know the reason why this exists, save a very minor convenience of not physically typing the type keyword, which is mostly avoided by *type inference* anyway...**

i'm just guessing in the special case of server-side: where perhaps it makes more sense for a server to run scripts as opposed to a single executable, which must be compiled every-time you want to update it

AS2 -> AS3/haxe (a whole new language and compiler)
js -> ts (transpiles to js)
php -> hack (type checker bundle?)
python -> mypy and others (type checker)
ruby /w sorbet (type checker)


# compare languages' sytnax by reading them
but do note: it's the language's capabilites that matter, not it's snytactical beauty

https://learnxinyminutes.com/

https://hyperpolyglot.org
  - compare syntax between families of languages

good examples:
aim for 2d space shooter classes

todo:
crystal
scala
haxe

C
  - pacman, single-header-style
    - https://github.com/floooh/pacman.c/blob/main/pacman.c
      - uses sokol
      
zig
  - same pacman implementation as above (but in zig)
    - https://github.com/floooh/pacman.zig/blob/main/src/pacman.zig
  - https://github.com/ratfactor/zigish/blob/main/src/main.zig
  - https://github.com/tomhoule/zig-diff/tree/main/src
  - https://github.com/Kiakra/Alka/blob/master/examples/example_shooter_game/src/game.zig

ruby
  - https://github.com/benbalter/jekyll-optional-front-matter/blob/main/lib/jekyll-optional-front-matter/generator.rb
  
elixer
  - https://github.com/elixirkoans/elixir-koans
    - based off ruby koans

rust
  - https://github.com/rsaihe/zenith/tree/main/src/game
  - https://github.com/naodroid/bevy_game_tutorial
  - https://github.com/grzi/scion/tree/main/examples
  
OCaml
  - https://github.com/HaxeFoundation/haxe/blob/development/src/core/tOther.ml
    - brain-exploding example of Haxe's compiler


# a little info
see meta-programming.txt

https://en.m.wikipedia.org/wiki/Dynamic_programming_language :
In computer science, a dynamic programming language is a class of high-level programming languages, which at runtime execute many common programming behaviours that static programming languages perform during compilation. These behaviors could include an extension of the program, by adding new code, by extending objects and definitions, or by modifying the type system. Although similar behaviors can be emulated in nearly any language, with varying degrees of difficulty, complexity and performance costs, dynamic languages provide direct tools to make use of them. Many of these features were first implemented as native features in the Lisp programming language.

Most dynamic languages are also dynamically typed, but not all are. Dynamic languages are frequently (but not always) referred to as scripting languages, although that term in its narrowest sense refers to languages specific to a given run-time environment.










# the main list
## a few contemporary languages, old and new

order of notes:
simple summary
frameworks
the rest
owner

## god-like, but not popular
Lisp
  - second-oldest language, after fortran
  - **at the same the the simplest syntax yet the most powerful language, still!**
    - **a history of programming languages reveal that they are only *just* now catching up to Lisp, and still, they've only caught up to it's features, but not it's implementation which allow the real wild stuff (see below), in addition to creating a lot more complex syntax**
    - macro heaven
      - "Thus, **Lisp functions can be manipulated, altered or even created within a Lisp program without lower-level manipulations.** This is generally considered one of the main advantages of the language with regard to its expressive power, and makes the language suitable for syntactic macros and metacircular evaluation."
  - **the simplest sytax**: '(function arg)', that's it!
    - thus **easy to parse / interpret / compile**
    
### dialects
- **Common Lisp**
  - **the true way**
    - **true lisp macros**
  - "Yes, while macros have been cited as the cool feature of lisps, there are several other good things about Common Lisp (SBCL in particular): stability; image-based development; dynamically scoped global variables (local variables are lexically scoped by default, yes!); conditions, restarts, and the ability to introspect the stack while it is still unwinded; CLOS, MOP, and multiple-dispatch; compile-time notes and warnings emitted by SBCL, performance provided by SBCL."
  - a spec from 84 (finished in 94?) of which there are a ton of implementations
  - the web-site shows the extremely simple and bare syntax/features
  - impractical for web
  - old, robust, industry-tested libraries
    - used in Deep Space and Mars Rover
  - https://awesome-cl.com/
    - awesome common lisp repo site
  - implementations:
    - **SBCL**
      - the standard
      - **native compilation, extremely fast (compares to C!!)**
      - it sounds like you can program in any way you want (paradigm) and that **the language itself is modular via extensions** such as CLOS (object-system) and meta-object protocol, kind of like lua
        - CLOS is apparently wayyy more powerful than any object-oriented language, as you can change the structure of objects on-the-fly
      - "what you get with SBCL is a 'full-stack' Lisp with a sophisticated AOT native-code compiler, **supporting a very interactive development style** and providing a blend of imperative, procedural, functional, object-oriented and meta programming."
      - "Mature native code compilation (**including runtime assembler**), **type declarations that lead to optimizations in generated code**, SBCL compiler can use declared types for compile-time type checks, **read/compiler macros**, **extremely easy interface to C** (JNI is a pain in the ass), multi-paradigm and doesn't prematurely optimize like Clojure (I have no need for STM or immutable data structures in 99% of the things I do), **very powerful and flexible debugger**, **CLOS**, more sophisticated interactive development."
    - CCL/clozure
      - <= 20% use this
      - better C/obj-C interface
      - faster compiler
    - CLASP
      - newer, llvm, c/c++ interop
- **Scheme**
  - a minimal dialect
    - the core seems to be rigorously thought out and is now a standard used as a base for newer dialects
    - beyond the core, there are similarly rigoriously thought out extensions to the lang
  - this sounds more in tune with the spirit of Lisp, whereas other newer dialects just add more syntax/keywords, when the point is to be simple
  - less practical / battle-tested than CL, perhaps better for personal use
  - small-size makes it fit as an embedded language for C/C++
  - "Scheme is simpler in a lot of ways: functions are just another value, which means there's a lot less overhead when using higher-order functions (compare CL's (funcall (make-function)) with the scheme equivalent ((make-function)), the language is literally quite a bit smaller (fewer rules, fewer functions, fewer special forms), and it's idiomatic to iterate with recursion instead of something like the (in)famously featureful loop macro.
  
    Do you like the functional programming style? Scheme. Do you want a large library ecosystem that Just Works? Common Lisp. Do you want a small language you can embed in a C program? Scheme. Do you want battle-tested industry tooling with decades of work behind it? Common Lisp. Do you want a language that is designed from first principles and exhibits a simple, mathematical elegance? Scheme. Do you want to just get shit done and don't mind a few messy but pragmatic compromises? Common Lisp.
  
    There's no wrong answer, though, both are lovely languages in their own way.)"
    - implementations:
      - bigloo
        - can generate C, JVM, .NET bytecode
        - "devoted to one goal: enabling Scheme based programming style where C(++) is usually required"
      - gambit
        - generates C, **js**
        - https://try.gambitscheme.org/
      - chicken
        - generates C
  - x/Clojure
    - Rob said it "adds syntax" and that *"it should be burned with fire!"*
    - uses JVM, and thus allows using java libs (ew) and **transpiling to javascript (via clojurescript)**, making it a bit more practical
      - used by a ton of corporations
      - 2nd most used language amongst jvm langs
    - https://clojurescript.org/community/libraries
      - web libs for DOM, react, etc.
        - possibly providing a better react experience than using js itself!
    - "Clojure advocates immutability and immutable data structures and encourages programmers to be explicit about managing identity and its states. This focus on programming with immutable values and explicit progression-of-time constructs is intended to facilitate developing more robust, especially concurrent, programs that are simple and fast. While its type system is entirely dynamic, recent efforts have also sought the implementation of a dependent type system."
    - **babashka**
    - a scripting langauge with a native run-time (via graalvm) and interpreter
      - nbb: node.js babashka
        - scripting on the web!
    - also includes a lot of scripting tools: task runner, jvm threads, cli libs, in addition to clojure's libs
    - "It’s a glue language for assembling components, most of which are written in Java."
    - emacs dev env plugin CIDER or intellij idea plugin Curisve
    
  - x/Racket
    - a contemporary one based off of one of the Scheme standards, full of contemporary features
    - more like a whole tool-set, used to create your own langauge! Now this is the spirit!
      - "The language platform provides a self-hosted IDE named DrRacket, a continuation-based web server, a graphical user interface, and other tools. As a viable scripting tool with libraries like common scripting languages, it can be used for scripting the Unix shell. It can parse command line arguments and execute external tools."
    - used in more recent Naughty Dog games!
    - seems to be targeted at newer programmers..
  
"9. The whole language always available. There is no real distinction between read-time, compile-time, and runtime. You can compile or run code while reading, read or run code while compiling, and read or compile code at runtime.

Running code at read-time lets users reprogram Lisp's syntax; running code at compile-time is the basis of macros; compiling at runtime is the basis of Lisp's use as an extension language in programs like Emacs; and reading at runtime enables programs to communicate using s-expressions, an idea recently reinvented as XML."

a lesson by Naughty Dog game studio's lead dev:
https://all-things-andy-gavin.com/2011/10/25/lispings-ala-john-mccarthy/
  - "...from Crash Bandicoot a much more elaborate language for coding all the gameplay objects called GOOL. In Jak & Daxter I went full on crazy and wrote a native compiler for an object oriented full featured Scheme language called GOAL. We wrote 98% of four Jak & Daxter games in it, including the vector unit assembly."
  - "One of the interesting things about LISP is that it’s actually a pretty easy language to parse, interpret, and compile. This isn’t actually an accident as the S-expression syntax was initially chosen for it’s machine regularity (in those early days of underpowered mainframes). Newer languages are syntactically much more complicated. Ironically most normal programmers, being human, seem to find the more complicated syntax easier and the “simple” S-expression syntax confusing (being backward much of the time to normal human convention). I always found it unambiguous, but go figure. It’s also precisely this regularity that makes the awesome macrology of LISP possible and has allowed the language to remain relevant despite its advanced age."
  - But by the mid 2000s I started doing the kind of programming I used to do in LISP in Ruby. It’s not that Ruby is a better language (although it is a good one), but mostly it was the momentum factor and the availability of modern libraries for interfacing with the vast array of services out there. Using the crappy unreliable or outdated LISP libraries — if they worked at all — was tedious. Plus the LISP implementations were so outmoded. It was very hard to get other programers (except a couple enthusiasts) to work that way. And ugh, those old CMCL and ACL Garbage Collection code/algo’s were (at least when I last used them in 2006) so awful. In ACL I’d get these LispMachine-like multi-hour GCs.
  - Ruby had a great book (Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide) (I put big stock in that) and struck a decent compromise. It’s type system and object model are better (or at least more modern) than Common LISP anyway. The syntax is more inconsistent, and the macro model nowhere near as good. In Ruby you can manually build up strings and feed them into the interpreter, which is equivalent to simple backquote. But you can’t easily do the kind of cool nested constructions that are trivial in LISP.
  - But it turns out. Libraries and implementation matter a lot. Momentum too. Ruby has momentum, people supporting it who aren’t older than me (and I’m not a young programmer anymore, started in 1980!) Still, you can feel lots and lots of LISP influence in all the new runtime typed languages (Ruby, Python, etc). And 30 years later, listeners still rule! Using a language without a listener is like walking without legs. I pity the C, C++, Java only type programmer.

  
Smalltalk
  - **can edit *any* part of the program while it's running**
  - the IDE is basically like an OS, written in smalltalk itself
    - **browse any object** (not class, but the underlying data
  - when you save a project, you just save an "image" of all the code, there are no files
  - however, because there are no files, and that you are forced to use it's only IDE, often which looks like it's stuck in the 80s or 90s, it detracts most people
  - https://squeak-dev.squeakfoundation.narkive.com/wuWIwY6M/game-programming-in-squeak
    - discussion why it isn't good for games
  - made in a MIT lab in 1980, huge influence in all programming langs: VM -> Java VM, objective-c, all "object-oriented" paradigms, etc.
  - dialects:
    - "Pharo has the lion’s share of Smalltalk attention in open source. I’d guess Glamourous Toolkit has much of the rest. Squeak is nearly moribund and Cuis is basically a one-man show."
      - https://www.reddit.com/r/programming/comments/tws825/pharo_10_the_pure_objectoriented_language_and/
    - "Hardly you will find very large infrastructure "industry-bent" projects as Pharo's in Squeak or Cuis because the focus is different. Said in poor words, and at the best of my understanding, the aim of Squeak and Cuis is the dynabook, a creativity tool, the aim of Pharo is more like to make a Smalltalk competitive with Python / Java."
    - https://www.reddit.com/r/smalltalk/comments/1did2s0/what_are_the_main_differences_between_squeak_and/
      - pharo's philosophy is heresy, also: forked the opensmalltalkvm (used by squeak), depends on third party libs not written in smalltalk, also gets rid of morphic (gui)
    - **Squeak**
      - created some resurgence as it was made by the main makers of the lang (Alan Kays), but also dying out just as suddenly due to lack of community, perhaps most being of his age and similarly academic or scientific; it's web-site is composed of a messy wiki that is often out-dated by 15 years, and it's package manager is just as old and out-dated; it's UI looks like Windows 95
      - https://squeak.org/documentation/
        - squeak docs site contains free books for squeak, such as 'squeak by example', but also the original four smalltalk books from the 80s
      - http://wiki.squeak.org/squeak/2983
        - main wiki page is a list of links, including some intersting historical ones
      - the FFI page was updated pretty recently, 2019?, and it's one of the main libs of the Squeak core repo
        - <https://wiki.squeak.org/squeak/1414>
      - croquet is an example of FFI use for OpenGL
        - <https://github.com/NikolaySuslov/croquet-squeak/blob/master/OpenGL-Core.package/OpenGL.class/class/example.st>
      - the Morphic interface is basically what Scratch, the educational game'ish programming app, is
    - **Pharo**
      - forked from Squeak in 2008, it is far more contemporary, with a great site, docs, etc., leveraging the power of github, newer ui, an uprising of creating new libs including low-level gpu api and low-level ui framework, pretty awesome!
      - https://pharo.org/documentation
      - https://www.pharo.org/features
        - smalltalk is *insane*
      - seaside
        - web framework
    - Cuis
    - more specialized dialects:
      - **Glamourous Toolkit**
        - kind of **the emacs of smalltalk**
          - "It seems an editor/database query engine/ browser with a object oriented language Pharo as control/scripting language, while emacs is an editor with emcas-Lisp as the scripting language."
        - uses the features of smalltalk for specific applications like code-base exploration/documentation, build an editor, etc.
        - built on Pharo, though it's a project of it's own
      - Amber
        - smalltalk live-coding environment for the web!
        - implementation of smalltalk on the javascript runtime
          - therefore can use javascript libs
          - compiles to javascript
        - https://lolg.it/amber/amber





## scripting langs
see scripting-languages.txt

https://www.reddit.com/r/AskProgramming/comments/16njl3f/are_people_still_scripting_in_2023_decision/
  - i asked in /r/AskProgramming

 
**Ruby**
  - a scripting language that people seem to really *love*
  - the frameworks 'n libraries seem to be more web-dev-oriented, mostly thanks to Rails, the language's premier web framework.., but also Jekyll (used by GitHub Pages), Roda (*this one looks amazing...*), Hinami, Middlemen (*this looks like a good step up from Jekyll*), and more..
    - there are two particular newer frameworks that compile to machine language, DragonRuby and RubyMotion, for cross-platform game and apps, deploying to just about any device! :o It sounds like haxe's frameworks! Unfortunately, they are closed-source, giving it a more closed-off, isolated feeling, and they cost quite a chunk of money to try...
  - "Matsumoto describes the design of Ruby as being like a simple Lisp language at its core, with an object system like that of Smalltalk, blocks inspired by higher-order functions, and practical utility like that of Perl."
  - aims to be natural, like English;
    - **also_uses_snake_case_convention** :o *finally*, someone gets it! although, maybe-i-like-this-better
    - uses function-name? for functions that return true/false *neat!*
  - *very clean* syntax
    - uses the last statement's expression in a function as the return value, thus saving a line; and oh you can easily write one-liner functions with Ruby! :o
    - can omit the '()' in function()
    - no need for 'var'
  - "Blocks are awesome. They're basically just closures, but the inline syntax is really powerful"
  - "This sort of block gives you that "I did something pretty cool in one line" feeling."
  - seems to have a *quirky*, more diverse, rad community vibe, similar to Haxe :), but perhaps more accessible and diverse, whereas Haxe attracts just game-makers
  - *very* object-oriented, even in the language itself! (maybe C# got that idea from here..), allowing you to even hack away at the language itself! you can even add methods to the main parent Object that everything inherits!! :o *everything is an object*
    - Ruby even lets you add a method to a single specific instance of a class
  - Metaprogramming "so you can dynamically create / change / etc behaviors using anonymous methods, closures, etc." and also writing a DSL
    - "Ruby makes hard things easy (think meta-programming, functional programming, etc). Bad programmers overuse it all the time (just because you can use the tool, you do not always have to), and other programmers suffer."
    - "Ruby's "metaprogramming" is something Java, C# and JS don't do well -- dynamically redefining things during runtime. **Everything in Ruby, including literals and operators, can be redefined during runtime, because everything is an object, and every message passed to any object can be redirected, filtered, transformed ad hoc. It's not just classes can be modified. Specific objects can be modified. Well-crafted Ruby code breaks things up into mixins that can be composed together. The closest comparison is one of Ruby's inspiration -- Smalltalk."**
  - bad: "GIL (global interpreter lock) - disable normal usage of multithreading. Can be solved..." usnig other interpreters?
    - Ruby 3 adds fibers (non-parallel) and ractors (parallel)
  - Ruby 3 adds TypeProf, "a type analysis tool, which are the “first steps” towards a “future with static type checking, without type declaration, using abstract interpretation”"
  - Ruby 3, is 3x faster (was released just before 2021)
    - most performant libs have hand-written C in them, just as python does, so performance often isn't an issue anyway
  - "monkey patching - "If you need a Class to work slightly differently, you can monkey-patch it (this can get dangerous, but sometimes it’s super useful) — you just re-define the Class, which “opens” it, define the methods you want to add, and they are implicitly added."
  - memory hungry
  - **too slow for games, even with the compiled version (CRuby?) :(**
    - maybe even too slow for big apps :/ (compare: Jekyll vs Go)
    - "it's clearly up to the task for small shell script sizes up to medium sized applications."
    - GraalVM
      - a VM for Java, and possible implementation for other languages: Ruby, Pythong, and Javascript, for example, are all official
        - TruffleRuby is ~9x faster than CRuby, *so far*
          - https://github.com/oracle/truffleruby
          - https://eregon.me/blog/2022/01/06/benchmarking-cruby-mjit-yjit-jruby-truffleruby.html
        - allows one to use several languages and libraries together! :o
      - https://en.m.wikipedia.org/wiki/GraalVM
      - https://github.com/graalvm
      - by Oracle, used by Facebook and Twitter
  - adds a ton of features: object.map => { anonymous function / lambda / closure / "block" (i dunno difference) }, container.select/find/filter {|item| item == item_i_want}, getter/setters, modules (this is interesting and have not seen before: basically can include group of methods to an object! :o), etc.
  - has incredible syntax: no var necessary?
  - see this for major differences: https://www.ruby-lang.org/en/documentation/ruby-from-other-languages/
  - game engines, such as Gosu, are written in C/C++ and then wrapped/binded by Ruby, because it would be too slow otherwise
  - opal, a ruby implementation that transpiles to javascript..??
    - https://www.reddit.com/r/ruby/comments/10b1ici/opal_v17_released_with_ruby_32_support/
  - although i missed this generation, i think i would have enjoyed this little world :)
  - like Haxe, seems to have a nice cult community of hackers :)
    - this alone makes it much more appealing to me than the other pop general languages
  - **my fav scripting language**, and possibly my favorite language overall :o
  - GitHub and Shopify might be the biggest companies behind it :D
  - made by one Japanese guy

https://www.reddit.com/r/ruby/comments/hp3yar/i_am_tired_of_hearing_that_ruby_is_dead/

https://www.quora.com/What-are-the-main-weaknesses-of-Ruby-as-a-programming-language?share=1
  - It has many features to process text files and to do system management tasks (as in Perl). It is simple, straight-forward, extensible, and portable
  - Concurrency, distributed computing and domains which depend on those tools (e.g. machine learning) have become the big story of 21st century computing. Ruby is not in that space, while rivals Python and JavaScript have found a way in.
  - "It's terse without losing readability. Less typing, less time spent with IDEs and boilerplating classes, mucking around with function prototypes, etc. Ruby borrows enough from perl to have some of that "hack it out in a day" flavor without being quite as unreadable and esoteric as perl."
  - "The language is beautiful and at times more readable than python. Sadly it lacks a larger community that isn’t focused on web development, which holds it back. As a language it can be used for many things being that it is a general purpose language, and you’ll likely enjoy using it.

    Oh yeah, it is being used more frequently in system administration as well.

    Edit: I forgot to memtion, everything is an object and its form of object orientation is far more elegant than Javascript or Java, which is a big plus imo."
  - In Java 8:
List<Long> longArray = ImmutableList.of(1L,2L,3L,4L,5L)
longArray.stream().map(num -> Math.pow(num, 2)).collect(Collectors.toList());

Stream? Why? Couldn’t they have done away with the extra syntax?
Math.pow? What is this? 1946? Surely exponentiation is common enough to have a simple operator for it.
.collect? Why not just assume this type of collection by default unless specified otherwise. It did start out as a list, after all. Why stream just to collect?
Collectors.toList? Okay? Still takes a dozen characters too long, but at least I know that it’s going to be a list instead of the HashMap<Object,Object> that I generally expect after running a simple map on a list.

Now in Ruby:
nums = [1,2,3,4,5]
nums.map{|num| num**2}


1) The lack of hyperspecific typing as a general practice limits the 200 character+ lines (usually split, but still) that permeate a lot of java code.
2) The naming conventions in ruby are generally shorter, leading to shorter lines as well.
3) 2 space indentation also helps with this.

  - Speed, stability, and footprint are problems today. Maybe not tomorrow.

The real troubles are singular. For fear of borrowing from ideology-driven prose, in Ruby it's simply too easy to make a mess. You can write bad code in any language, but, in Ruby, you can do it at ten times the productivity. Monkey patching, opening classes, metaprogramming, and even the vileness of eval all have their uses, but they can lure you into some sweaty situations just as rapidly.

Just remember: peace, commerce and honest friendship with all classes--entangling alliances with none!

  - Much of the language consists of special cases rather than general features that combine in orthogonal ways. (about python)
  
https://www.quora.com/Is-the-programming-language-Ruby-dead-It-seems-too-simple-and-limited-compared-to-other-languages?share=1
  - I've seen ruby being used for webapp (the most common usage these days), as an automation language (Chef), for high volume data processing tools (FluentD), for desktop apps (ruby + Glade), as a tool to build videogames, for network middleware, as scripting tool (as in system admin kind of a thing).
  - Now, over the last few years ruby in the form of rails, has seen some of its userbase move to other things like node, like go and others (I know people who ditched ruby to go do php). That's mostly because other technologies finally got on par with some of the amazing concepts on ruby/rails. That's also because there is this misconception that states “Ruby is slow” - ruby isn't slow, your code is slow, your solution is slow. Maybe Ruby and the rails community haven't exactly excelled at teaching people to build fast code - they actually have always been focusing on doing the “opposite”, not do fast code but do code fast.
    - Ruby is a complex language to master and it’s a challenge to write an interpreter for it...In general terms, the simplest a language is to implement the harder it is to write code using that language :)
    - I certainly dislike the existence of symbols and I feel writing threaded applications should be made simpler in Ruby and the MRI implementation has certainly some limitations regarding parallelism
    - Regarding productivity it’s mostly about familiarity and personal taste I guess. 
    - Ruby is dead. Long live Ruby...What’s happened to Ruby is that it’s matured. It doesn’t have a bunch of folks jumping up and down saying “do everything in Ruby!” … what it does have is lots of people quietly getting lots of shit done in Ruby … just like a ton of other languages that nobody’s super-excited about anymore.
    - Ruby is anything but simple. Simple would imply a single way of doing something. Ruby gives you five ways of doing everything. I legit think it's one of the most complex languages that's in common use.





Python
  - perhaps the most popular and most loved scripting language, even as of 2022(!!), competitive to ruby
  - frameworks and libraries seems to be more scientific-oriented, with machine learning, ai, math, 'n so on
  - can't go wrong with using this as a scripting langauge, however, it's rather slow for intense things like games, with only a rather recent C implementation helping it; around as slow as ruby, and without the rad features and rad community
  - the syntax is among the most readable, and it shows by it's popularity and love from first-time programmers
    - although, it's just a preference... **i def prefer delimiters over whitespace delimiter**, and **i also prefer having my control statements with an ending delimiter**
      - there's also no real reason to limit to whitespace delimiting, as Haskell proves that it's possible to support both ways
  - **pypy**, is an especially fast implmentation putting it at Lua speeds
  - Google, although, even they probably rewrote a lot of stuff in Go
    - also in Google fashion, they broke the language-compatibility for the v3 update
    - Google just sucks at long-term vision, design, and maintenance.

https://www.quora.com/What-are-the-main-weaknesses-of-Python-as-a-programming-language
  - The traces of this “hacky” origin seen everywhere. I will list just some: 
__something__
self
whitespace-as-syntax
len()
getters vs setters syntax
“”.join()
string instance methods returning value (“aaa”.capitalize()) (much stranger when compared with the fact that len() is function not method)
No static typing, which is in itself great thing, but not on the scale of big projects python now is used for
… and more
  - "Lack of anonymous multi-line functions, combined with unintuitive scoping, has sent me scurrying to Node.js or Ruby time after time. Python syntax is great for a a pipeline of heavy computation, but becomes unwieldy when weaving together asynchronous calls."
  - I'd really prefer an easier way to figure out which exceptions a given class or function can raise. The only way I know of doing this now is to hunt through the source code or look in the documentation and hope that it's comprehensive in this regard.
  - Circular import errors. Imports are statements too, and they can fail if the objects they target have not been created yet. Compare this with languages that support separate compilation (C family and ML family languages), and can link at runtime without having to worry about the order in which things are defined.
  - No helpful IDEs. It's hard to reason about dynamic code before you run it, so it's very hard to write tools to help you reason about it.




javascript
  - an old dynamic front-end rather mundane language that has over time become used for everything, especially after node.js enabled writing web backend code with it
  - through Node.js, Express.js (sinatra-inspired micro-framework), etc. 'middle-ware" frameworks, it can then be used server-side
  - dynamic typing, retarded manual type checking (===, NaN, etc.)
  - **Google's v8 engine compiles javascript into machine code**, instead of using the normal interpreter method, thus single-handedly causing this entire mess



## systems langs

### garbage-collected
there's too many in this area
  - "I think the issue with Nim and Crystal is that if you want a language with garbage collection, you already have so many options out there. If you want a language without garbage collection, you’ve basically got C, C++, Rust, and Zig. If you think that C++ and Rust are too complicated, then you’ve really just got C and Zig."
    -  https://www.reddit.com/r/ProgrammingLanguages/comments/10hu5md/why_is_zig_so_much_more_successful_than_crystal/
      - many great comments on the state of languages
      - basically, as languages came out, users flocked toward them, in particular: go, rust, elixir. Any language after them would have much catching up to do.

#### compiles to a "native binary" executable
**Haxe**
  - my favorite general-use systems language: simple 'n clean, *light-feeling*--feels like a scripting language!, **more powerful than C#**, but without all the *heaviness* of it, **feeling more like a cross between actionscript and ruby: expressive**, just *siiiick*, **garbage collector depends on the target**, low-key best language of all-time
  - **made for games!**
  - frameworks include: NME, Heaps, OpenFL (now feels like it's stuck with too much Flash baggage..), HaxeFlixel, HaxePunk, Kha; all of them are basically an i/o base **to create basically *anything*, cross-platform**. In addition, there's HaxeUI, coconut, and bindings for React and React Native for cross-platform UI, along with bindings for other stuff, like RayLib and Unreal.
  - like C#, it has many contemporary features: anonymous functions, local functions, ADTs, properties, etc. and even a macro system (not sure if C# has this...), but it's not nearly as exhaustive as C#, making it more tolerable for a mortal, and a little less flexible, which can actually be good, as you can focus more on writing as opposed to thinking which C# feature to use here, and making code easier to read too (try reading the code of a pro C# user!)
    - also has **macros** that are much more powerful than anything C# has
    - also like Ruby, it feels very *Linux-y*, where **everything is a simple text file**, including the build file (this is a major difference in feeling to C#, as it can feel like you must edit stuff in VS's gui, or even Unity's gui. In Haxe, **everything can be done by simple text editing**, no gui software necessary)
  - maybe the first major language with **cross-platform** in mind? (2005 vs 2011 Dart)
  - has all of the features of ruby (container filters, anonymous functions, etc.) plus more, but comes with a *much much* faster compiler, making Ruby feel rather obsolete, and just surviving off of it's libraries and community
  - **_incredible_ compilation options: compile to nearly any other language (including C, which can then be compiled again by optmized-compiler LLVM to reach near-C speeds, or to use C libraries, or to build in C for iOS/consoles/embedded devices, and javascript, to be run in a browser or to use pop javascript libraries or to compile to Node.js, and Java, to build for Android, and to bytecode which is then run by a VM (Neko [old VM?], HashLink [current VM]), itself with two options: HL/JIT and HL/C**, one for faster compilation speed and one for optimized run-time speed *whoa...*
  - auto-generate bindings for libs in many languages
  - has **a standard cross-platform library** that all newer languages try to copy
  - don't feel overwhelmed by decades of C/C++ libraries to piece together, nor have to think about pointers/references/smart-pointers and header files
  - don't feel like one has to conform to the ways of Microsoft and the .NET framework: you can write your code in any way you want to, and use any tools you want to too! :)
  - small community feeling, will run into the makers on the forums, discord, or github (including the maker of Haxe/Heaps himself!!), can make a big difference :) but **the con of this is that there's simply not enough community power, so resources are scarce, web-site (including tutorial, book) and package manager are rather out-dated, etc.**
    - although there's a little community around frameworks in it, the dev team is rather closed off
  - frameworks like OpenFL, NME, Heaps ensures it's shared cross-platform code is in good condition, though not .NET level
  - haxelib package manager
  - made by one French guy
  - **my fav :)**


  **julia**
  - "Julia is a high performance scripting language used by academics, big data research, and some niche data science fields that require the performance (eg linear programming). As people said, it feels really well put together and has some nice syntactic sugar that’s missing in Python."
    - also macroeconomics/banks
  - **maybe the best syntax, combining the best of all**
  - llvm fast?
  - **Julia has foreign function interfaces for C, Fortran, C++, Python?, R, Java (and therefore JVM langs), Mathematica, Matlab, and many other languages**
    - this is wild... but perfect for academic-use!
    - this makes it far more practical than haxe, which simply transpiles to other languages. This can actually talk to multiple other languages!
  - **portable binary?**
  - **portable run-time? for deploying scripts**
  - **lisp-level macros**
    - also feels lispy in general, making it very appealing to me :)
  - extensible, as everything is an object
  - **designed for parallel computing**
  - https://www.reddit.com/r/Julia/comments/10p33sf/is_julia_suitable_today_as_a_scripting_language/
    - doesn't compile to binary? must compile every-time it's run, which takes 1-2 seconds because JIT compiler?? like elixir?
    - https://github.com/brenhinkeller/StaticTools.jl
    - https://julialang.github.io/PackageCompiler.jl/stable/apps.html
    - interpreter less important than compiler (just-in-time compiler based on LLVM ORCJITv2 is used to generate native machine code)
  - due to it's very specific domain use of science, it's just no good for everything i'm interested in: scripting, small cli apps, web, games, etc.
  - an indian was one of the four to make it! :)
  - Jeremy Kepner at MIT Lincoln Laboratory was the founding sponsor of the Julia project in its early days. In addition, funds from the Gordon and Betty Moore Foundation, the Alfred P. Sloan Foundation, Intel, and agencies such as NSF, DARPA, NIH, NASA, and FAA have been essential to the development of Julia. Mozilla grant...


Crystal
  - currently suffers from runtime struggles (memory usage, compile time (no incremental compilation)) and windows os support
  - **community seems to go against ruby's community as opposed to supporting it by enabling access to it's libraries**
    - i just don't see much hope for it.. and i don't see much reason to use it over haxe
  - like a compiled and static-typed ruby, along with being *much* faster, in fact, **at C++ speeds!?!?** :o :O
  - syntax and style *very very* similar to ruby, like 75% similar just as scripty-feeling as ruby too!!: no main function needed
  - deeply **object-oriented**, just as ruby was too
  - macros and ASTs like Haxe
  - **concurrency like Go**
  - uses ruby's (or jekyll's?) simple yaml config (build?) file to fetch dependencies, making it very simple get dependencies from git/github
  - **makes writing C-bindings easy, easier than Go!** and perhaps generatable? :)
  - compiles to C (like Haxe), allowing it to use C compilers, and therefore making it really fast
  - i *think* they are building some way to be able to interop with ruby, so as to re-use existing ruby libraries...
  - this language is the one that **appeals to me the most**, as i've missed the whole ruby generation, but maybe can join it late with this :) ...but it seems to offer very little over Haxe, which already has most of these features, and many more years behind it
    - like Haxe, i *think* it uses the Boehm garbage collector (mentioned in a post from 2013), so, i don't think it'll offer any better performance than Haxe... thus, it would just be syntax, which imo isn't enough of a reason
      - the garbage collector: https://github.com/ivmai/bdwgc
  - ayolite lib for ruby to call crystal
    - **unfortunately, no lib to call ruby code :(**
  - kemal lib <- sinatra/roda (ruby simple web app framework)
    - with ai to generate boiler-plate for libs, it should be easy to catch-up..?
  - https://crystal-lang.org/reference/1.3/getting_started/cli.html
    - a cli example in the main tutorial


Go (golang)
  - specialized for procedural programming
    - simple, straight-forward, procedural style (like C), but pretty spartan and feature-less (also like C), making it far less appealing for hobbyists (that like *natural* languages) and game-makers (that like lots of features and object-oriented paradigm)
- compiled python, or a high-level C, intended to replace python in high-performance areas
  - simple, zen-focused programming
    - no advanced features (generics, macros, etc.) nor abstractions (**no object-oriented features**)
      - **it's simple language feature-set makes it rather useless for my needs: frameworks to make games, web-apps, gui apps**
- seems to be like a contemporary C, but with a garbage collector, yet you can still use pointers 'n references, it's just "safer"
  - **at the speed of C too! :o**
  - seems to be targeted for web back-end "micro-services"
  - perfect for performant, easy-to-read/maintain small programs, especially cli
- compiles/builds to a 2MB+ executable binary which contains the runtime (including the garbage collector), which can be configured to be cut down further
- possibly the best C FFI: just import the C psuedo-package
- feels very scripty (in syntax)! no static/explicit declarations?
- noted for bringing it's concurrency features to the mainstream
- Google, but open-source
- used by a ton of huge web companies, thanks to it's built-in concurrency (goroutines), making it very good for web APIs
  - https://github.com/rromulos/command-vault/blob/master/cmdvault/cmd/main.go
    - a good example of a simple cli app
  - https://www.reddit.com/r/golang/comments/14vvwon/when_would_you_not_recommend_go_over_rust/
    - "The tooling ecosystem for Go is really good. Debugging in Delve is way simpler than debugging in Rust. The compiler is so insanely fast that it might as well be an interpreter."
    - "number one killer feature is goroutines. They're incredibly simple to use and the runtime does an excellent job multiplexes work across coroutines and threads. It allows easily scaling concurrent workloads."
    - "Simplicity as a feature. Go is so simple that I find it really easy to elevate my thinking from the language or small-scale problem up to architectural concerns. Because I spend more time with my head in this place, I often find I end up with better overarching solutions. The unique niche of simple, high-level, but not obscuring the implementation details often makes my architectures even better than Python or Javascript."
    - "On Rust's side, the number one killer feature is correctness. Go has nil panics, goroutines stomping on shared memory, etc. In Go, you still have to program defensively, similar (but not nearly as bad) as writing good Python code. With error return values and being such a simple language this quickly becomes second nature, but it's still unnecessary cognitive load."
    - "As as making the right choice for yourself, unless GC matters, personally, I'd start with Go, just because it's going to be incredibly easy to pick up for a Python dev, and immediately brings a lot to the table. Once you write some Go and start bumping up against the dark corners (every language has these), you'll develop an appreciation for why you might want Rust and have a better sense of if and when the learning investment is worth it for you."



Dart
  - Google's Haxe
  - created and therefore mainly used for the cross-platform (including web) Flutter framework
  - considered pretty dull, but it works; open-source, **designed to be cross-platform**
    - very similar to Haxe, but was developed much later
    - Dart can compile to native machine code for macOS, Windows, and Linux as command line tools. Dart can compile apps with user interfaces to the web, iOS, Android, macOS, Windows, and Linux using the Flutter framework.
      - **compile to machine code, webassembly, javascript**
  - feels less scripty, more boring, lots of 'final' keywords (for 'var')
  - Flutter, and this is really all it's got behind it
  - supports mixins!!
  - "Dart has a fully modern toolset with no proprietary bullshit 
  (microsoft) nor legacy bullshit (java). It comes with language server, formatter, package management."
  - Google
    - Google cannot but trusted for their products, but their programming languages seem to do alright! Perhaps the best poison of the four giants.


    
Nim
  - "C for Python developers"
    - brings the disgusting whitespace-delimited syntax of python to systems langs
  - performance-oriented, allowing for many kinds of optimizations and implementations (compiled, static-typed), but still **garbage collected** (this is the biggest difference between this and Rust), though, you can do some manual memory management to change the way it is collected, in the end, it's still garbage collected
  - nimpy
    - seems pretty easy to call python libs..??
    - https://scinim.github.io/getting-started/external_language_integration/nim_with_py.html 
  - feels like scripting in a compiled language, making it much more joyful to use
  - composition > inheritance  
  - python-like tab-delimited style
  - **basically supports all programming paradigms**
  - interface with C/C++/Objective-C (therefore easier access to iOS?) and compiles to javascript
  - made for embedded systems?
  - pop contemporary features: generics, closure, functional features, type inference, macro, statement as expression, etc.
  - easy C binding
  - garbage collector options: reference-counting, rust-like borrow-checker in-the-works
  - another major new-comer, closest contender to Crystal, but the python-like style still throws me off :( i personally prefer object-oriented, slightly faster, ruby-style Crystal, as i don't even know any of the other programming paradigms
  - https://forum.nim-lang.org/t/1880
    - ?







### C++ and its replacements / semi-manual memory-management
**Jai**
  - the only solution

**Rust**
  - **like C++ but safe--no run-time errors(!?!?)**, **no garbage collector**, instead, using a specific memory management system, wherein you still have fine control of memory but it's easier(?) and guaranteed to be safe. you *must* learn and use this system to handle the memory yourself (just as you must learn Obj-C's reference counting, or C++'s pointers and smart pointers), thus if ever there's a problem with a garbage collector you'll either write that portion of code in C/C++ or just end up re-writing the whole thing with Rust
    - all of that of course comes with the cost of a slower development time (or at least having to be way more careful)
    - mutability: https://doc.rust-lang.org/std/keyword.mut.html, https://web.mit.edu/rust-lang_v1.25/arch/amd64_ubuntu1404/share/doc/rust/html/book/first-edition/mutability.html
    - https://doc.rust-lang.org/book/ch04-01-what-is-ownership.html
  - performance-oriented, allowing for many kinds of optimizations and implementations
  - **incredible documentation design**: a web book, docs, crates (it's package manager), all look *stunning*. Languages with smaller communities will have a tough time matching that!
    - see: https://doc.rust-lang.org/std/index.html, 
    - the book: https://doc.rust-lang.org/book/
  - a great and excited community
  - composition > inheritance
  - Go's concurrency/threading features
  - "Where Go shines in simplicity, Rust shines in expressiveness. Rust's type system is far ahead of Go's, which allows for a workflow where you model your data almost before the implementation details. Code is often more concise. The dark side of this is that if you're not disciplined, concise can end up obfuscated. Even Python and JS are like this; consider list comprehensions embedded in more list comprehensions vs iterative loops. Sometimes I find myself doing things the Go way in Rust, because it's more readable. This is an option in Rust, but not the other way around."
  - brace-delimited style
  - pop contemporary features: generics, closure, functional features, type inference, macro, statement as expression…  
  - **people seem to really quite like this one**, many new game-frameworks are made with this, and it makes sense, as it has the right features for it
  - people have went crazy making Rust bindings for nearly every C/C++ library out there.., maybe writing C bindings have become easier? ...Or area they completely re-writing all these libraries!?
  - Bevy game engine, also see "awesome gamdev rust" on github
  - https://discord.com/blog/why-discord-is-switching-from-go-to-rust
    - this article tells of a single example of many where Discord replaced Rust because they were hitting the limit of Go's garbage collector, and to their surprise, beyond that problem, it outperformed go in every way anyway
  - explicit about memory references (&), otherwise the same!
  - terrible class::function syntax
  - Mozilla, and as always, open-source (making it wayyy better than Swift)


TODO: merge with above
**Rust**
  - Jon Blow's take
    - https://www.youtube.com/watch?v=4t1K66dMhWk&t=3635s
      - on the ownership model: "compile-time enforced permissions model that determine what you can and can't do with various pieces of memory", and thus by nature is overly restrictive. There are somethings that you could do that are correct that it won't let you do, because it can't prove they're correct... you have to fight the borrow checker, and it's very frustrating, but it's good because it pushes you into patterns that are better anyway
  - **like C/C++ but safe--no run-time errors(!?!?)**, **no garbage collector**, instead, using a specific memory management system, wherein you still have fine control of memory but it's easier(?) and guaranteed to be safe. you *must* learn and use this system to handle the memory yourself (just as you must learn Obj-C's reference counting, or C++'s pointers and smart pointers), thus if ever there's a problem with a garbage collector you'll either write that portion of code in C/C++ or just end up re-writing the whole thing with Rust
    - all of that of course comes with the cost of a slower development time (or at least having to be way more careful)
    - mutability: https://doc.rust-lang.org/std/keyword.mut.html, https://web.mit.edu/rust-lang_v1.25/arch/amd64_ubuntu1404/share/doc/rust/html/book/first-edition/mutability.html
    - https://doc.rust-lang.org/book/ch04-01-what-is-ownership.html
  - performance-oriented, allowing for many kinds of optimizations and implementations
  - **incredible documentation design**: a web book, docs, crates (it's package manager), all look *stunning*. Languages with smaller communities will have a tough time matching that!
    - see: https://doc.rust-lang.org/std/index.html, 
    - the book: https://doc.rust-lang.org/book/
  - a great and excited community
  - composition > inheritance
  - Go's concurrency/threading features
  - brace-delimited style
  - pop contemporary features: generics, closure, functional features, type inference, macro, statement as expression…  
  - **people seem to really quite like this one**, many new game-frameworks are made with this, and it makes sense, as it has the right features for it
  - people have went crazy making Rust bindings for nearly every C/C++ library out there.., maybe writing C bindings have become easier? ...Or area they completely re-writing all these libraries!?
  - Bevy game engine, also see "awesome gamdev rust" on github
  - https://discord.com/blog/why-discord-is-switching-from-go-to-rust
    - this article tells of a single example of many where Discord replaced Rust because they were hitting the limit of Go's garbage collector, and to their surprise, beyond that problem, it outperformed go in every way anyway
  - Mozilla, and as always, open-source





**C++**
  - NOTE: went through big changes from C++11 and on, updating every 3 years: the advent of "modern C++"
    - https://www.incredibuild.com/blog/modern-c-the-evolution-of-c
    - mostly C++11:
      - 'auto' (var), range-based loops and "structured binding", and lambda make it feel more like a modern dynamic language, but with better implementations
        - also had type inference far before C#/java ~2011 vs ~2017/2018! return type inference too!
      - variadic template
      - decided on a memory model leading to standard multi-threading and concurrency
    - C++20
      - modules!!!
        - no more #include!!
      - coroutines (another way of concurrency?), maybe just had threads before?
      - concepts
      - ranges
  - *you poor, poor soul, you.*
  - frameworks: ??, maybe C++ people don't rely on frameworks: they build it! :p
  - manual memory management via pointers 'n references 'n "smart" pointers 'n the const key-word
    - and therefore pass function arguments by value or pointer or reference or smart pointer too
  - adds **object-oriented design features (classes)** to C
    - also adds the idea of allocating stuff during constructor and de-allocating during deconstructor
  - adds references to C (i guess in C you just had to use pointers for everything..?)
  - smart pointers (3 kinds) that generally delete themselves once the last reference falls out of scope
    - this just makes it even more complex!! :( why worry about references and 3 kinds of smart pointers and raw pointers, when you can worry about raw pointers?
  - header files are also annoying
  - adds "standard library" including strings to C (before they were an array of "char"s!)
  - adds generics ("templates"), enums, and other now basic features..
  - loved/hated, mostly hated, i think
  - also a problem of multiple compilers, each of which only work for certain version or certain features?? (gcc vs clang)
  - this first reddit thread illustrates the terrible flaws of C++
    - https://www.reddit.com/r/rust/comments/4yz59h/cc_interop/



### C and its replacements / manual memory management

Nelua
  - lua-like in many ways: syntax, minimal design / few features that can be used to create more features via meta-programming
  - garbage collector is optional (on by default)
  - compiles to C then native code
  - compiler written in lua, and thus completely modifiable!

**Zig**
  - a C replacement
  - explicit about using the allocator to allocate the heap...
  - from the site:
  - page 1:
    - No hidden control flow
    - No hidden allocations
    - First-class support for no standard library
    - A Portable Language for Libraries
    - A Package Manager and Build System for Existing Projects
    - Simplicity
    - Tooling
  - page 2:
    - Small, simple language
    - Performance and Safety: Choose Two
    - Zig competes with C instead of depending on it
    - Order independent top level declarations
    - Optional type instead of null pointers
    - Manual memory management
      - i prefer the simplicity of this over Rust
    - A fresh take on error handling
    - Stack traces on all targets
    - Generic data structures and functions
    - Compile-time reflection and compile-time code execution
    - Integration with C libraries without FFI/bindings
    - Zig is also a C compiler
    - Export functions, variables, and types for C code to depend on
    - **Cross-compiling is a first-class use case**
    - Zig ships with libc
    - Zig Build System
    - **Concurrency via Async Functions**
      - i don't think haxe has this
    - Wide range of targets supported
    - Friendly toward package maintainers
  - great simple web-site 'n documentation
  - this looks great! no hidden bullshit. optional std lib. everything about it makes sense to me! :)
    - whereas Haxe and Rust use macros and "special" solutions in their standard library or hidden in their compiler, Zig doesnt take any shortcuts, doing everything the proper way
  - **one line C interop**
    - // build with `zig build-exe cimport.zig -lc -lraylib`
    - const ray = @cImport({ @cInclude("raylib.h"); });


Odin
  - from the hand-made network
  - like C, not object-oriented, with a belief that *data and procedures (functions) should be seperate, and that behaviors (class's functions/methods?) shouldn't even exist!* :o very rad
  - influenced by Go


V
  - C-like
  - gc optional

D
  - C-like

C
 - **a *very* simple "low-level" language used by most electronic devices**, "Currently it is pragmatically true that C is the most versatile and portable language. Any language that does not have the ability to interact with C code risks obscurity."
 - frameworks: RayLib, (todo: ??), not really the best for making frameworks, as it's not object-oriented; it'll more or less end up like RayLib: a ton of functions included in the top-level namespace, as there is no concept of namespace!
 - manual memory management via "raw" pointers (no references?) and the const key-word
 - *not* **object-oriented**
   - and interestingly, it forces you to write in a simple, top-to-bottom way, making programs, even if it's just a giant single file, rather easy to read, as opposed to being forced to create a ton of "objects", most of which don't make sense. With less freedom and more constraint, you are able to do what is needed without thinking about how to do it. There's a whole philosophy about this vocalized by Casey Muratori and his hand-made network. And indeed, it makes C libraries much easier to follow along than C++ libraries:
 - no string class!, "C-strings" are just arrays of chars
 - has header files, which is annoying, but it seems nowadays people just write everything in the header file!
 - Raylib is quite beautiful: simple, straight-forward, because there's really no other way to do it
 - OpenFrameworks also has Raylib's beauty (not sure if it's C or C++ tho..)
 - now, i'm not sure if i'd want to write a game in that style, *i loved FlashPunk!, i love my objects! ;(*, but i sorta see why straight up simple C results in very good code, dividing data from functions, ending up to be more modular, more re-usable, and most importantly, easy to follow
  


  


### functional languages
"Elixir is a functional language; its data structures are immutable. This is great for reasoning about code and supporting the massive concurrency you enjoy when you write Elixir. The double-edged sword of immutable data structures is that mutations are modeled by taking an existing data structure and an operation and creating a brand new data structure that is the result of applying that operation to the existing data structure."
    - this basically applies to most functional languages

#### the current state of things
https://www.reddit.com/r/ocaml/comments/m634t8/thoughts_onexperiences_with_f/
  - "The tiny community and obscurity of OCaml made things difficult, and it was just hard to justify F# when it's future isn't as promising as rust or typescript or even elm or elixer. These days I use the ever-advancing typescript systems to emulate what I got from OCaml while taking advantage of the much larger platform, community, and ecosystem. When something is lacking, the TS system is advanced enough to (mostly) allow you to code it in. It's got its faults, but I was able to create a variant types library I'm very happy with so it's good enough for now."


note: the following languages have very different community use cases:
Elixir for server-side concurrency/parallelism (and thus the most productive)
  - https://www.reddit.com/r/elixir/comments/ao3dp6/usecases_for_elixir/
OCaml for compilers, general-use
F# for functional .NET, general-use
Haskell for math, language


**Elixir**
  - **the most practical functional language**
  - "you must remember, that it looks like Ruby, but it’s not Ruby at all”, said the creator of the language
  - "Elixir is a dynamic, **functional** language for building scalable and maintainable applications." says it's home-page
    - proably not the most performance-oriented (for native apps), but it being new, it has much better concurrency, and the VM ensures it's much faster and safer/"fault-tolerant" than python/ruby!
  - although ruby-esque on the surface syntax, really a replacement of Erlang, of which it shares it's specific VM, thus allowing one to re-use Erlang's libraries
  - but as opposed to Ruby's focus on object-oriented paradigm, it focuses more on Ruby's concise functional style: of creating very short easy-to-read simple often single-line functions
    - **it's functional focus makes it *perfect* for web, where a billion threads are running little scripts (and where those billion threads must run side-by-side, never conflicting or sharing any bits of code with other threads)**. It's simply a much better solution than running simple interpreters, providing all the advanced features a compiled langauge and VM gives, yet doesn't require full compilation to run it. I can't think of a better use of bytecode/VM compilation.
  - limited in use cases compared to more general languages:
    - absolutely not suitable for games (through a game never crashing may be an interesting feature..??)
    - not suitable for quick 'n simple scripting either, you'd need to build a whole project and then need the VM to start-up to just to run it:
      - "The one use case where Ruby still wins for me, though, is a little one-off script. Last time I had occasion to do that, I found you couldn't use any Elixir hex packages without generating a whole mix application. In ruby you could just globally install the gem and require it right into your script."
  - multi-core (no GIL in Elixir; as opposed to python/ruby?? not sure..)
  - "BEAM/EVM barely has any JIT happening at all, but it is still very performant, however the language design combined with internal very low level async I/O allows the BEAM/EVM to outperform ‘almost’ anything on I/O (like networking, say, for webhosting) while being safer than any just about any language at all."
  - "However, .NET Core has very little ability to debug production, you mostly have to rely on your logs or hook up a debugger that often stops-the-world. Compared to the BEAM/EVM that has introspection that would make any network or server admin just drool, but it is done in a different way than you would do it on .NET Core (mostly because debugging individual instruction is as you would on .NET is hell for a concurrently real-time system)."
  - "Ruby has considerably more libraries and this is IMO at this point the only reason, other than being mandated or wanting to write ruby, that I would still use it over Elixir. The edge for everything else IMO goes to Elixir."
    - concurrency, FP scope > OO scopes, liveview and live dashboard are 🔥🤘, contexts > models, response times are in the micro vs milli seconds, Phoenix saw webpacker for the 💩 it was and quick pivoted to a sane alternative in esbuild, benchmarking, testing & code analysis (credo, dialyzer), immutability, ex doc is insanely easier to use vs rdoc et al, runs on significantly fewer resources, OTP, hex is better than bundler, deployment (releases), cross platform (ruby has come a long way on windows from what it was but...), stable API vs the OCD of ruby/rails
  - https://elixirforum.com/t/ruby-in-2023-can-and-should-elixir-replace-ruby-for-simple-scripting/58214
    - not a big enough program to make use of functional programming?
  - https://www.reddit.com/r/elixir/comments/1bo0a8o/why_did_you_switch_from_rails_to_phoenix/


**OCaml**
  - "OCaml unifies functional, imperative, and object-oriented programming under an ML-like type system."
    - in the functional to object-oriented/procedural sprectrum, OCaml is closer to functional, whereas Haxe is closer to object-oriented/procedural, giving it a very good profile and balance, making it far more practical than more functional languages
    - the "O" stands for object-oriented
  - some benefits of it's functional side:
    - immutable vars/data-structures by default (final keyword in other langs), good compiler warnings against mutable things
    - pattern matching feature ensures all control paths are complete via compiler warnings, and a great type system (strong yet inferred) that also helps with compiler warnings
      - the switch/pattern matching is amazing, as it allows function arguments to magically work with it automatically (sorta like the opposite of how all functions return stuff)
  - used to write compilers in academia, including haxe's compiler
  - has reference types, "a mutable container for a value"
    - for those two(?) reasons and more, it's not purely functional
  - based on the functional language ML (Meta Language)
  - surprisingly nice syntax with many pop syntax stuff being optional, allowing one to use white-space instead
  - either invented or first major use of static type with type-inferring compiler, and thus all dialects benefit it
  - also happens to have great, succint syntax

TODO: merge with above
  - http://roscidus.com/blog/blog/2014/02/13/ocaml-what-you-gain/
    - polymorphic variants, ADTs, cycle-free dependencies, immutable data structures...
  - https://caml.inria.fr/pub/docs/oreilly-book/html/index.html
  - https://www.reddit.com/r/ocaml/comments/12no1vq/what_makes_ocaml_good_for_programming_language/
    - having pattern matching and immutability by default makes it easier to write software that operates on tree structures (ASTs, some IRs, etc). you can just write a particular compiler pass as a function that takes in a tree and outputs a new tree.

    compared to writing it in another language like Java or CPP, there's much less boilerplate, no need to deal with things like visitor pattern, copying nodes around and worrying about mutation, etc.
    - What hasn't been said in other comments is its rich type system. If you want to represent an AST of your language in a type-safe way, that is, in such a way to write the eval function without resorting to errors or exceptions, you have the right tool for that in OCaml: Generalized Algebraic Data Types (GADTs). Haskell also has official support for GADTs via a compiler extension.

    (By the way, if the object language is more expressive than the metalanguage, this beautiful trick stops working. One example is dependent types, which are irrepresentable as an OCaml data type.)


Erlang
  - python-esque tab-delimited? no keyword or brace to signify end.


F#
  - Microsoft's OCaml in the .NET world
  - really well-regarded / much-loved, except that there isn't much use for it in the current state of language choices
  - can also generate javascript and gpu code
  - no multi-core support?
  - kinda feels abandoned
  - https://www.reddit.com/r/ocaml/comments/m634t8/thoughts_onexperiences_with_f/


Haskell
  - **magical feeling to write**
    - many people really like this one
  - *purely functional*, meaning, there is *absolutely no way to mutate data* (vars and functions)
    - this makes it very limiting in practice, and more of a theoretical interest
  - because it is purely functional, it can do things that no other non-purely-functional languages can do
  - web-site home-page is awesome (todo: make Haxe's home-page like this!)
    - intro from a great little on-line book that was listed on the main site
      - http://learnyouahaskell.com/introduction#so-whats-haskell
  - statically typed
  - lazy. "That means that unless specifically told otherwise, Haskell won't execute functions and calculate things until it's really forced to show you a result"
  - "all side effects are completely controlled and you can very easily identify functions with side effects" - CRobes
  - "there are ways of interacting with the real world, such as printing to a console, but this is done in an absolutely controlled environment" - CRobes
    - soo, i'm guessing limited to formal sciences: math, languages, etc.
  - i dig the arrows: input -> output, content <- readFile



## others, not sure about..
Raku
  - most influenced by Perl, though it doesn't FFI it
  - **"Raku can call Ruby, Python, Perl, Brainfuck, Lua, C, C++, Go, Scheme (Guile, Gambit), and Rust"**



### cool ideas!
Streem
  - "a stream based concurrent scripting language. It is based on a programming model similar to the shell, with influences from Ruby, Erlang, and other functional programming languages."
  - https://github.com/matz/streem
    - by the maker of Ruby
  - seems kinda abandonded, but rad idea! :D

Pony
  - uses actor model for concurrency (a long-term vision of swift)
    - maybe the first langauge to do this, and therefore solve a really, really big problem
    - https://www.ponylang.io/discover/why-pony/#isolated-data-is-safe
    - "“reference capabilities”. Reference capabilities allow you to label different bits of data based on how that data can be shared. The Pony compiler will then verify that you are in fact correctly using the data based on the labels you provide. Reference capabilities combined with Pony’s actor model of concurrency makes for a powerful pairing."
    - "The problem with concurrency is shared mutable data. If two different threads have access to the same piece of data then they might try to update it at the same time. At best this can lead to those two threads having different versions of the data. At worst the updates can interact badly resulting in the data being overwritten with garbage. The standard way to avoid these problems is to use locks to prevent data updates from happening at the same time. This causes big performance hits and is very difficult to get right, so it causes lots of bugs."
    - "Any data that is immutable (i.e. it cannot be changed) is safe to use concurrently. Since it is immutable it is never updated and it’s the updates that cause concurrency problems."
    - "If a block of data has only one reference to it then we call it isolated. Since there is only one reference to it, isolated data cannot be shared by multiple threads, so there are no concurrency problems. Isolated data can be passed between multiple threads. As long as only one of them has a reference to it at a time then the data is still safe from concurrency problems."
    - "The code within a single actor is never run concurrently. This means that, within a single actor, data updates cannot cause problems. It’s only when we want to share data between actors that we have problems."
    - "By sharing only immutable data and exchanging only isolated data we can have safe concurrent programs without locks. The problem is that it’s very difficult to do that correctly. If you accidentally hang on to a reference to some isolated data you’ve handed over or change something you’ve shared as immutable then everything goes wrong. What you need is for the compiler to force you to live up to your promises. Pony reference capabilities allow the compiler to do just that."






### embedded scripting:
  - embeds in to C
  - not worth the trade-off in games (hence why unreal engine stopped using it), as mentioned by jon blow

lua
  - extremely simple (only perhaps second to lisp)
  - the most performant vm/compiler of all dynamic programming languages: LuaJIT, pretty much thanks to the one guy that made it
  - powerful meta-data-structure: the table, in which you can implement any other data structure, making it extremely modular

**wren**
  - modern sytnax with object-oriented-style classes
  - go-like concurrency via "fibers"
  - meant for embedding to C so doesn't come with a std lib (lua does)
    - can add libuv (a contemporary cross-platform std C lib) to it, as in Luxe
  - not luaJIT fast, close to luaJIT -joff (luaJIT with JIT off) fast, but faster than the standard implementation of Lua, and now only marginally quicker than the more complex standard ruby and python C interpreters
    - though, it's aim is to be simple: a highly-readable 4000 lines of code vm
  - perfect for games! :)
    - use in luxe (game engine)
  - made with <3 by rubyx01 (of luxe), though started by Bob of game design patterns / crafting interpreters fame, and a similar language is used in his books

squirrel
  - was used by a few game companies as a general scripting lang for games that even ran on consoles


### magical languages
lisps:
common lisp
  - 19 loc!
  - http://www.randomhacks.net/2005/12/03/why-ruby-is-an-acceptable-lisp/
    - compares ruby to lisp
  - start with steel bank compiler
schema (lisp)
  - seems less lispy, more like a general systems lang
closure (lisp)
  - opinionated/constricted like Go
  - java impl
    - interop with java
    - leads to true parallelism?
  - dynamic and functional dialect
    - and thus leads to easier concurrency
  - community-made interpreter for scripting (babashka)





#### TODO: move elsewhere
ref:
https://madnight.github.io/githut/#/pull_requests/2023/2
https://github.com/dwyl/learn-elixir/issues/102
https://www.reddit.com/r/elixir/comments/zd9o07/comparing_phoenix_to_rails_in_december_2022/
https://www.quora.com/Is-learning-the-Phoenix-web-framework-easier-for-experienced-Ruby-on-Rails-developers
  - a great answer about thinking in the way of Elixir is *simpler*










### old / history
#### intriguing things from the past:
Logo
  - lisp without parenthesis!!
  - geared toward education
  - influenced smalltalk, scratch, etc.
  - MIT
  - https://en.wikipedia.org/wiki/Logo_(programming_language)


#### past langs:
java
  - see below under #### meh

perl
  - cryptically terse text-processer with a heavy emphasis on regex DSL turned into a general programming langauge
  - note: awk, a cli program, is similar, but never turned into a programming langauge
  - seems to have the reputation that only old veteran bearded linux hackers have ever mastered it
  - embeds/interops with C/C++?

  
PHP
  - $var, $func?, $_special_var, $everything
  - perhaps the only thing worse than javascript, and perhaps closest to the horror that is objective-c
  - suprisingly good performance, especially when compared to ruby 'n python
  - Wordpress has kept this alive for a long long time

ActionScript (3)
  - thanks to Flash and it's game engines FlashPunk and Flixel, i was able to make my first *little* games with them! :)
  - to this day, that was the best game dev experience i've ever had: pure code-only **light-weight scripting**
  - Haxe feels very close to ActionScript in both syntax and features, and really just made the perfect replacement for it, so, there's no need for this now, but good to note for history's sake
    - *update:* as it turns out, Nicholas (the maker of Haxe) wrote the compiler for ActionScript 2 :o ...now it all makes sense..!
  - my second love, leading me to Haxe


    

#### history:
simula methods vs small-talk messaging:
  - The difference between these two concepts is in how the code referenced by the method or message name is executed. In a Simula-style language, the method name is in most cases bound to a section of code in the target class by the compiler. In Smalltalk and Objective-C, the target of a message is resolved at runtime, with the receiving object itself interpreting the message...A consequence of this is that the message-passing system has no type checking. The object to which the message is directed — the receiver — is not guaranteed to respond to a message, and if it does not, it raises an exception.
    - https://en.wikipedia.org/wiki/Objective-C#Messages
    
simula
  - Simula 67 introduced objects, classes, inheritance and subclasses, virtual procedures, coroutines, and discrete event simulation, and featured garbage collection.
  - the first "object-oriented" language, leading to c++/java/object pascal/etc.
  
BASIC (well, some variant of it)
  - "the java of it's time"
    - because Bill Gates sold BASIC to nearly every platform during the 80's (Commodore, Atari, Apple, etc.)
  - https://github.com/wls/Wumpus.bci/blob/master/wumpus.bci
    - 'let' keyword for dynamic types?? :o
  - surprisingly simple and readable, almost like it was specifically made for simple game programming! :o 
  - many people cite this an their first prgramming language as a child
  
Commodore64 (c64)
  - https://github.com/lvcabral/retaliate64/blob/master/source/gameData.asm
  - everything is a "co-routine"
  - three-letter terse commands make it feel closer to asssembly

assembly
  - each platform probably has it's own assembly language and assembler
  - https://github.com/Herringway/ebsrc
    - re-creation of earthbound in SNES's assembly
  
https://github.com/flipacholas/Architecture-of-consoles/
  - console architectures




### meh, not interested


#### languages created by and for their own corporate products:
  - **avoid these** unless you must make products on their devices

Swift
  - Apple's native language, replacing Objective-C
    - they still kept the old crap: Apple Foundational Library (NSobject, etc.)
  - looks really good actually, simple yet powerful, like Rust but with less complexity, too bad it's controlled by Apple!
  - **manual memory management / no garbage collector / no run-time**
    - reference counting
    - rust-like borrow-checker
  - interops with C and more recently (v5.3) C++
    - deep interop thanks to llvm, down to inline functions
  - cross-compiler binary to everything similar to go and rust
  - macros
  - probably has extremely good interopability between C/C++/Obj-C
  - strangely open-source (obviously made for Apple's own products, yet open-source to take from the open-source world)
    - **advertises to be cross-platform... but, what's the point when all of Apple's frameworks are closed products?..**
      - https://www.reddit.com/r/rust/comments/180fsxk/swift_vs_rust/
        - Apple's strict controls prevent true open-source community development
        - "I love Swift, to me it's a nicer, friendlier version of Rust. The syntax looks better, it has more words and fewer sigils, parameter labels make some API calls look really nice, too. But I simply can't use it for anything I do, and this is true for most developers out there."
      - https://dev.to/rhymu/swift-vs-rust-an-overview-of-swift-from-a-rusty-perspective-18c7
    - "core libraries" seem to be the same as .NET core libraries, probably followed Microsoft's footsteps, but lacks the game-making and huge C#/.NET communities
    - https://www.swift.org/core-libraries/
    - https://www.swift.org/about/
      - "One of the most exciting aspects of developing Swift in the open is knowing that it is now free to be ported across a wide range of platforms, devices, and use cases.
         Our goal is to provide source compatibility for Swift across all platforms, even though the actual implementation mechanisms may differ from one platform to the next."
  - also, **like Google, Apple sucks with community / documentation / etc. A lot of power really comes from open-source popularity...**
  - it forces you to name parameters in function calls, which makes code way more readable: attack(enemy: koopa, dmg: 1)
  - Apple
    - started propietary, then turned open-source
    
  https://www.youtube.com/watch?v=tzt36EGKEZo
    - miguel de icaza (the maker of mono runtime) goes over the benefits of swift over c#
      - great compiler that prevents a lot of errors
      - mutable and immutable arrays/lists
      - long-term vision is to aim for actors
        - classes with their state completely isolated
          - data flows via "sendable" data (thread-safe)
          - only one thread can run inside actor code at a time. Other threads must wait in line. Plus, it's guaranteed by the compiler
      - azul has a pauseless garbage collector for java, sold to big enterprises
      - tried to add reference-counting to .NET, but due to "inner-pointers", by design could not implement it

#### compiles to bytecode/intermediary lang
https://www.reddit.com/r/dartlang/comments/1bbbexg/comment/ku8ct38/
  - "Dart is also a hard sell because, no matter the task, there's other languages with super interesting advantages. If you want a performant CLI, just use Go tbh. If you want a driver, just use Rust tbh. If you want a highly performant and concurrent back-end, just use Elixir tbh. If you want to tap on an existing ecosystem with lots of manpower to make your back-end, .NET Core is very popular, unfortunately. If you want to make videogames, you probably don't want to make an entirely new framework and game engine, so you'd end up with C++ or C#. GUI apps are like the only place where Dart truly shines via Flutter, and even that isn't totally figured out. Dart doesn't abuse FFI enough for its platform-dependent code to be entirely in Dart, which would be fucking amazing tbh."

https://www.reddit.com/r/webdev/comments/tisrh5/comment/kugqpis/
  - C# vs kotlin use cases
  

###### microsoft / .NET CLI world
C#
  - "Microsoft's Java": Java EE = ASP.NET, Java VM (JVM) = .NET CLR, etc. As vomit-inducing that may sound, it feels much better than the java world (partly due to eclipse ide sucking)
  - mighty mighty C#... along with it's .NET framework and Visual Studio, is really tough to beat for general-use, but boring, and limited by it's java-like bytecode\VM\GC implementation
    - **all of it's garbage collector implementations cause game to stutter when it sweeps up memory**
  - has frameworks for games (Unity, MonoGame)
  - frameworks for cross-platform apps have sucked for it since the beginning. They were limited to windows (winforms, wpf, etc.), and so newer open-source cross-platform frameworks came out (Avalonia, Uno, ASP.core). ASP.NET, the main web-app framework sucked for a long time allowing others to gain popularity until ASP.core came out, and even now, Blazor may be better
    - https://elixirforum.com/t/phoenix-vs-asp-net-core-performance/3599/8
      - describes the many reasons why even ASP.core is not the best for web
  - *solid feature-set* for the language, the standard library (System, IO, etc.), and the .NET library
    - basically C# v3 (in 2007) set the standards for high-level languages with lambda expressions, anonymous functions, and LINQ via .NET, etc. (during my first programming job!), and didn't add much until v7 (in 2017) when it added pattern matching, tuples, local functions, etc., but that's okay as they are working on all three things: a language, a library, and a tool-set. By C# v10 now, the features are *overwhelming!*. There's really nothing to complain about here.
  - in 2014, **open-source cross-platform** .NET core began, eventually becoming the main .NET framework
  - despite supporting many languages, only a few have held up: C#, F#, and some variant of C++. D lost in the language wars.
  - always had a compiled approach instead of scripting, making it less popular in the web-dev world, which made it even better, as it keeps the serious native big game/app devs away from the horrendous temporal javascript/electron/html5 web-dev world
  - Microsoft, and very much *feels* like Microsoft: *heavy*: heavy dev environment (visual studio ide until code was released), heavy libraries, clunky standard coding convention, etc., yet very easy to read/understand coming from C-like languages
  - **after using this, it feels like there's really no reason to ever use a scripting (dnyamically-typed, interpreted) language again, or one that doesn't provide ide-integrated debugging, reflection, etc.**
  - has contemporary **scripting** solutions!!?? :o :O
    - Rosylyn compiler, csscript, dotnet-script
  - https://www.nuget.org/packages/MonoGame.Framework.WpfInterop/ - LOL, amazing! WPF UI with MonoGame behind it
  - nuget package library



##### google
Kotlin
  - actually developed by JetBrains (the IDE maker), but the language eventually was chosen by Google to be the main language for Android app devs
  - interops with Java




##### Java / JVM world:
  - never was interested in this, just feels archaic.. from dev tools to syntax to frameworks.. everything!
  - java came up because of cross-platform VM and marketing
  - VM makes it less interesting for games/performance, though it's the most performant VM in history
    - Clojure is an exception, as it's just a lisp piggy-backing on the VM's tech
  
Scala
  - basically a replacement for Java, interops with Java, compiles down to Java bytecode (to go into JVM)
  - much loved by the java folks
  - just as featureful and powerful as most of the newer contemporary lanugages
  
Groovy
  - "Java-syntax-compatible object-oriented programming language for the Java platform. It is both a static and dynamic language with features similar to those of Python, Ruby, and Smalltalk. It can be used as both a programming language and a scripting language for the Java Platform"
  - "Most valid Java files are also valid Groovy files. Although the two languages are similar, Groovy code can be more compact, because it does not need all the elements that Java needs.[15] This makes it possible for Java programmers to learn Groovy gradually by starting with familiar Java syntax before acquiring more Groovy programming idioms."

Java
  - C/C++ power without memory management, a classic systems language (along with C/C++) but *much* easier to use
  - frameworks include: LibGDX... (todo: ??)
  - the vibe i get is strange... there seems to be only an old cult that like it, one that's business-class or "enterprise"-class
  - **compiles to bytecode that is then processed by VM that must be installed on the target device, whereas C/C++ directly accesses memory**
  - **adds a garbage collector, making it feel "high-level"**
    - but no pointers *at all*, **all objects are references and all objects are passed by references** (basically every high-level language after this does this)
      - thus perhaps making fine-tuning of memory impossible?
    - a good comparison between C++'s pointers and Java's magic
      - https://stackoverflow.com/questions/1750106/how-can-i-use-pointers-in-java#1750197
  - feels neat, like an early C#, but heavy too
    - although the modules/class seem like 5 folder deep??
  - no header files? :o
  - object-oriented, direct contender to C++
  - adds lambdas (maybe this was added later on..)
  - can interop with C through JNI (java native interface)
  - this is a world i've seem to have avoided, just out of taste... i think this is because when i started, it just didn't have a good IDE compared to C++'s Visual Studio; i had to use Eclipse, which was garbage that unfortunately couldn't be collected :/  
    - however, now looking at it again, it's strange that this isn't used more! It looks like a much neater version of C++, like a pre-cursor to C#.
  - like C#, it's similarly bulky, with interfaces, tons of classes, project files, and just making it feel like the opposite of the freedom of a scripting language









https://www.atatus.com/blog/rust-vs-golang/


# TODO: merge with the above
# "server-side", "scripting" languages:
usually have an interpreter so that you can run it ("in run-time") via CLI with single commands or scripts, as opposed to having to be compiled *and then* ran ...although, nowadays, this dividing line is quite blurry

see https://stackoverflow.com/questions/17253545/scripting-language-vs-programming-language

https://softwareengineering.stackexchange.com/questions/53624/can-c-be-used-as-a-server-side-web-development-language
  - ANYTHING can be used to write a webpage provide it can read the input, write interpretable output, and is executable by the webserver.
    Technically, any language can be used as a CGI script... :thinking:




    

# TODO: merge with entry above
## not really server-side, but it's possible to build web apps!
C#
  - **through ASP.NET Core, can build cross-platform apps (including web** via WebAssembly)
    - this makes it a great choice, competing with not just web apps, but Google's Flutter, and even simple game-like apps.
  - Avalonia framework
    - like Flutter, but with C#/.NET/VS :o
  - Uno framework
    - like Flutter, a little different in implementation, more mobile-oriented, including hot-reloading :o
  - for a long time this only worked with Windows servers (IIS), thus making it less popular, but since ASP.NET *Core* in around 2015, it has since then become open-source, cross-platform (along with VS Code!), making MicroSoft look much better to the dev communities than both Google and Apple!
  - the con of this is that you need a solid development environment: the current version of Visual Studio (not VS Code), probably a Windows IIS server(??), and still need to compile the code, build it, then deploy it, making the entire build process far more cumbersome compared to the common server-side langugaes, where you can just go in with a terminal, edit some code, 'n run it all via CLI
  - however, **for big, serious projects, it's worth the powerful language (C#), framework (.NET), and environment (VS), all of which are perhaps considered some of the best**
  - C# also has one of the biggest dev communities
  
  
  
# most admired
this is a great way to find good pop tech

2024:
https://survey.stackoverflow.co/2024/technology#admired-and-desired
**rust, elixir, zig**
python, typescript, go, kotlin, swift, clojure, etc. are all about the same

**postgresql**

hetzner (cloud platform)

**phoenix** > (by a wide margin) > asp.net core, svelte, htmx, astro

**rust** (for embedded) (no competition!)

docker, **godot**, vite, bun, pacman, nix

markdown, **github discussions**, **obsidian**, **linear (docs)**

**signal**, **matrix**, **discord**, slack

**chatgpt**, **github copilot**, vs studio intellisense
  




# language execution speed
just a very very very broad gut feeling, lol

note: benchmarks are usually impractical, only exacerbating very specific differences

tier 1:
  - usually manual memory management
  - compiles to native machine code
  - no difference here really, just depends on the programmer's ability
    - though, Rust's memory-management implementation does have it's caveats, at a certain point (games)
**C** (clang > gcc)
(Zig, V, etc.)
Chapel (??)
(Fortran)

C++ (clang++ > g++)
**Rust**
Swift (llvm, reference-counting or borrow-checker)

tier 1.5:
  - adds a garbage collector
  - go's portable binary is also way bigger
**common lisp (sbcl)** - great alternative to Go, perhaps even the original go!
scheme (stalin)
Go


tier 2:
  - usually garbage-collected, or otherwise memory-managed
  - AOT compiled exe binary or jvm
  - compared to manual-managed memory, the memory of programs bloat until the garbage-collector runs
    - **NOTE: can suffer from lag during garbage-collection in games**
**Crystal** (llvm) - note: extremely slow compile times even for the most trivial hello world code, but incredible C speed for such an early language-runtime

**Julia** (AOT?) - C-speeds, an incredible feat...
Nim (clang) - clang speeds!

C# (native?)
D?
**Haxe** (via transpiled c or c++)
**OCaml** - suprising for a (impure) functional lang!
(Haskell?)
Dart (dart2native)
Mojo

tier 2.5:
  - though not compiled, their VMs have had so much work and money put into it that it performs just as well as compiled languages
  - requires runtime/vm to run it
  - also requires time to startup the vm
Java (fastest vm)
  - Kotlin, Scala, etc. jvm langs
C# (CLR)
  - F#, etc. CLR langs


tier 3:
  - very complex, contemporary bytecode/vm JIT implementations written by gods
  - **NOTE: many consoles and even iOS doesn't allow JIT compilers**

**Julia** (JIT, but can AOT) - how the eff... as fast as JS??
JS (bun, node) - surely the most complex vm in terms of optimization..??
Lua (LuaJIT -j) - the interpreter that set the standard
Scheme (gambit)
Dart (JIT, also has AOT) - surprisingly fast, or maybe not, since it's google
(python/pypy and ruby/truffleruby would go here but are impractical)

**Elixir** (BEAM) - particularly bad for simele CPU tasks used in becnharks but note: the magical concurrency that occurs in BEAM puts it on top of most dynamic languages, especially when it come to real applications (not synthetic benchmarks, nor hand-written concurrency)

Ruby (YJIT > MJIT) - an alt. runtime yet practical too (unlike python's pypy)
PHP - opcode/vm-like runtime, surprisingly slow..
(Pascal?)

tier 3.5:
  - lisp just so happens to be so small 'n simple that it can be compiled on-the-fly
    - "Chez compiles all code prior to execution and does not do any dynamic code generation during runtime."
Scheme (Chez) - still as slow as ruby JIT


tier 4:
  - simpler, earlier interpreted bytecode/vm impementations
  - the differences here can be much bigger, but by 2024, they are all about the same, with python about 2x slower than the others

**Lua** (LuaJIT -joff) - still the fastest interpreter too!
Racket

**Wren** - intentionally written to have a simple vm, and performs really well too
Clojure (Babashka interpreter)
**Ruby** (3.0, CRuby/standard impl) - magical runtime by Japan. suprising for such a complex langauge. actually can use it for games now! very different from the early versions
Lua (5.4) - the LuaJIT guy isn't too happy about this..

Python3 (CPython/standard impl) - slow

Tcl
Perl - slowww

https://github.com/jabbalaci/SpeedTests?tab=readme-ov-file


https://github.com/kostya/benchmarks?tab=readme-ov-file
  - test by writing interpreter for brainfuck lang

https://muxup.com/2023q2/updating-wrens-benchmarks
  - update bnechmark of simple standard interpreters

https://benchmarksgame-team.pages.debian.net/benchmarksgame/
  - a joke, and hard to read, because it's more of a competition in which people upload crazy optimized programs that use multiple-cores/threads, but you can kinda see the limits and means using the simple implementations

https://github.com/attractivechaos/plb2
  - someone's benchmarks

https://wren.io/performance.html






# resources

## the opinions of more experienced programmers
## Jon Blow's opinion
https://www.youtube.com/watch?v=y2Wmz15aXk0
  - **the idea of using a scripting language in a game was a failed experiment**

https://www.youtube.com/watch?v=klE9bzWJbHc
  - video of some millenial streamer that tries jai, but it works
  
https://www.youtube.com/watch?v=baClkzcfxu0
  - jai > zig from the same streamer


## Robert's opinion
Robert has ported CrossCode to every popular platform, including *two generations of consoles(!)*, in addition to writing a JS AOT compiler, a super-powered low level framework (Kha), and basically the next SDL (Kinc)

Lisp, no language ever been so simple yet so powerful, contemporary languages (as of 2022) still have not caught up, and macros are easier to write

Smalltalk, most readable language, you can alter *any* part of it while it's running making a killer dev experience

Java had good marketing, otherwise, it stole from Smalltalk (VM, object-oriented) and dumbed down the object-oriented part from true objects to mere class prototypes

Basic was the Java of it's time


## Zeta's opinion
Zeta has written: a game engine on top of Robert's Kinc lib, and is now writing an ARM assembler (for Hashlink), and is tinkering with writing an OS

Java is bad
C# is like Java owned but by Microsoft, and thus doubly bad
C is good
Haxe is very good
Rust is great

## good reads
https://ziglang.org/learn/why_zig_rust_d_cpp/
  - a good little critique other systems languages (and how to learn from them)

https://floooh.github.io/2020/08/23/sokol-bindgen.html
  - creator of sokol tackles C api language binding generation


## info extraction
https://blog.back4app.com/server-side-programming-languages/
  - a pretty simple and good summary of the popular languages (although, no haxe :( )
  
https://community.haxe.org/t/how-does-haxe-hxcpp-performance-compare-to-writing-c-c/460

https://www.reddit.com/r/gamedev/comments/1edn03/lua_angelscript_haxe_c_java_and_others_which_do/
  - shares my conundrum: an indie dev trying to choose a language environment, and it seems, even 8 years ago C#/MonoGame was still the way to go
  
https://www.reddit.com/r/ruby/comments/5c1prl/ruby_vs_python/
  - always good to gather some real thought from real people
  
https://blog.discord.com/using-rust-to-scale-elixir-for-11-million-concurrent-users-c6f19fc029d3

https://news.ycombinator.com/item?id=23431941
  - crystal vs ruby
  - "Ruby's "metaprogramming" is something Java, C# and JS don't do well -- dynamically redefining things during runtime. **Everything in Ruby, including literals and operators, can be redefined during runtime, because everything is an object, and every message passed to any object can be redirected, filtered, transformed ad hoc. It's not just classes can be modified. Specific objects can be modified. Well-crafted Ruby code breaks things up into mixins that can be composed together. The closest comparison is one of Ruby's inspiration -- Smalltalk."**

https://news.ycombinator.com/item?id=14120398
  - elixer vs ruby?
    - "The one use case where Ruby still wins for me, though, is a little one-off script. Last time I had occasion to do that, I found you couldn't use any Elixir hex packages without generating a whole mix application. In ruby you could just globally install the gem and require it right into your script."
    - "I do not particularly like the usual global package installation model, though, because it means that you can only have a single version of a package available for your scripts to require. The best package management model for standalone scripts that I have seen is Groovy's: a script can include a special directive that downloads a specific version of a package just for that script. Any versions can be stored in the global (per-user) package cache so that you don't have to redownload them every time a script runs, but your import statements always give you strictly the version you asked for. This is the model I'd adopt for Elixir."
  
https://thoughtbot.com/blog/is-elixir-a-scripting-language
  - running it via command line, it seems it would only work for a single module, and i'm not sure if you can simply import other modules using this method. Its possible to add a shebang and make it an executable
  - running the script via the 'mix' command seems the way to go, as that makes it a proper project allowing you to add modules, but then you'd need to create a new project, with a project folder, with it's own directory structure ' files, snd on top of that you'd need Elixer installed, and im not even sure if it can actually execute standalone without that command...
  - compiling it to a binary is similar, or even more complicated, than haxe: you need a seperate build file, put the script into a main function, compile it, and ensure you have Erlang's VM (BEAM)
  

  
  
