

# a thought
(another bit: about media / i/o frameworks being in the sweet-spot between contraining (of expression) gui tools and low-level media api's (particularly, graphics, but also various device inputs)

and amir being right: incremental development of an implementation of an idea is the right way (and probably even coincides with the incremental development of the idea!)

TODO: get from notebook.. or link to the note



TODO: merge
engines that don't support various rendering pipelines, and only opengl, will limit their targets to PC and the switch. All other consoles, handhelds, etc., have their own rendering piplines.



THE TRUE WAY:
  - THIS IS HOW YOU MAKE GAMES
see jason rohrer's game and minorGems repos
  - look for his design sketch-up writing he had on the escapist
  - look at his even earlier games
  - start from Passage, the game that inspired me to make my first little game, and go up
  - straight C/C++, all the way down, all on his own
    - honestly, C/C++ is far more readable to me than most languages. it allows my mind to focus the architecture as opposed to a bunch of features.. it's the opposite of ruby, yet it's quite refreshing
  - TODO: he moved from the middle of nowhere (for simple living) to Davis!! omg.
  


VERY IMPORTANT NOTE:
**choose a game engine that ports to consoles.**

most game engines, including all open-source ones, do not easily build to consoles, though they advertise it as so. You will have to port your game to each platform's SDK ("export templates" is what Godot calls it). The process of porting is so arduous, people pay thousands of dollars to out-source it. Because of NDAs, you must register as a business entity. Then, get a license to use each console's developer tools. You must order a console made specially for developers (devkit), which isn't cheap either. You must also pass an acceptance process. Only Nintendo is more accepting of small developers. Also, you need a rating (for parents).

https://docs.godotengine.org/en/stable/tutorials/platform/consoles.html
  - read this
  
https://www.reddit.com/r/gamedev/comments/171qnt7/do_you_have_to_pay_to_port_a_game_how_much_did/
  - "**Unity and Unreal** are the main two choices, hence why they cost money."
  - "All major console manufacturers have lengthy requirements and approval process. It's all under NDA so nobody will list you any details but let's just say that the first time you see it you will probably not be happy. Since it includes A LOT of details - using right font sizes, how many MB/s are allowed through hard drive, how long can be your loading screens, how long can initial start process take, using right icons, how to handle user changing their account in the middle of the game, what kind of data can you store, and so on and on. List is long.

    This is also assuming Xbox Series X / PS5 aka platforms that are quite powerful. Switch is... a different story - for all intents and purposes you can consider it a few years old phone. So you will also need to sit down and optimize your pipeline so it actually runs at more than 5 fps."
  - "Strictly speaking - Godot is open source and Sony/Nintendo/Microsoft do provide libraries and documentation needed to make a port. But this does mean you will be going into it's source and dealing with thousands of errors that pop up just to display anything on a screen."




my choices over time:
flashpunk -> haxepunk -> ceramic or defold for a complete opinionated framework or **dragonruby** [#media-frameworks]() -> **raylib** for heaps for optimized DIY 2d+3d -> **jon blow's engine**

update3: dragonruby has limits. once you want to do advanced things such as shaders, you'd have to do it in C, (wrap it in an "extension", compile it), which just isn't as nice as an experience compared to heaps/haxe, where you really don't have any limits, and can do everything in haxe (save a few optimizations in C). Still, i much much prefer it to its alternatives, mainly due to ruby. By the time things do get advanced, i'll be ready to create my own games in heaps/haxe. :)

update2: dragonruby is by faaaaaaaaaaaaaaaaaaaaaaaaaar the best 2d engine. it's also the only one that's truly cross-platform, including consoles (see note on consoles). (m)ruby is an in-fucking-credible language for game development. it handles a lot of things in a succint, powerful manner, without all the cruft of a simple language like wren, nor advanced static languages like haxe. the dev-console is really well-developed, which makes a quick development process. this is true programming. also, the maker of it is really great, hangin' in the discord. this is the end of the search for me. it's just so damn well-designed, thought out, simple... it's a miracle really! this is a good step before jai, as it teaches you how to program in a good way: **start with nothing**

update: i gave up on heaps and jumped to luxe. Luxe just ships with an entity-component system, along with a 2d collision module, so it was a bit easier to get started, though, it took a day or two to understand the ECS. Luxe also benefits in simplicity thanks to it's embedded language, whereas haxe drags you down with it's various features. Plus, you can really help develop luxe. :)


complete 2d game engines:
**defold**
  - stable, game-editor included, 2d-focused with 3d
  - https://defold.com/2023/10/01/How-Defold-works-with-consoles/
    - console support, unlike godot
  - modular
**ceramic**
  - successor of flashpunk/haxepunk and the original luxe
  - provides a complete framework, great if you need a lot of the common game engine stuff, or just want to focus on making games and not bother with game systems
  - a more powerful langauge compared to game scripting languages
    - a good amount of powerful macros too
    - makes jumping to heaps easier

stable DIY 2d alts:
**dragonruby**
  - love2d with the power of ruby
  - START HERE
love2d
  - 20 years strong. amazing. the predecessor of dragonruby. luaJIT should be quite a bit faster..? (for desktops)

stable DIY 3d+2d:
**raylib**
  - **for really learning how to make games and game systems, in addition to C and graphics**, and **able to choose any language you want!!**
    - try C, zig, odin, jai :)
  - **by far the best performance**
  - END HERE
    - this is the end-game
**heaps**
  - i still consider this the best DIY, garbage-collected, media framework (after dragonruby for simpler 2d cases)
    - but requires making your own framework
      - can make a simple prototyping-like framework like rubydragon, which is basically what i was doing with heapspunk, building up a global object full of useful stuff
  - END HERE
    - this is the end-game for haxe
fna (+ foster?)
  - up-to-date as of 2024, with fez working in SDL3
  - all monogames switched to this to port to consoles
  - old framework that has no intention to ever change, and thus easy to maintain
  
complete 3d+2d:
luxe
unity


# how to start 
1. **the quickest way to make a game is: well.. to make one! Making a top-down 2D game such as a shoot ‘em up (shmup) is the best way that I know how to learn.** Every game engine should have a top-down 2D tutorial to get you started. Use that as the base, then go from there, adding cool projectiles, player movement, etc. I suggest starting with one of the much-loved simpler 2D-centric game engines (see *much loved first game engines*). After that

2. try the Godot tutorial and make a shmup yet again to quickly get familiar with the editor-style workflow and api, but this time, after that’s complete, make it one more time, in 3D! :O Even if you don’t like it, it’s worth trying the editor-entity-component style for a week or two, or at least a weekend game jam! Then

3. the choice between a simple 2D game engine, a complete game-making environment, or a bare-bones build-as-you-go base will become more clear, depending on the project needs.

I’d suggest sticking to the modern language route, particularly C#; or, if you are like me and *need* a social community for every passion that you have, choose a small language such as Haxe. If you’re really feelin’ it, go with the more experimental engine/language combo such as: Wren/Luxe (preview/open beta), Jai (when Jon releases his engine), or Beef. You could actually be a part of something cool, rather than being just another slave for the-u-word. For a long time C# has been dominated by MonoGame/FNA/XNA (and the-u-word), but surely by now, there are some simple yet wonderful little non-XNA engines out there...??


### a quick note about the engines i listed:
much of it is merely out of personal personal taste and gut feeling, yet, there are some underlying reasons: game engines that are either written in C, or can talk (_embed_) to C (Lua, Wren), or can compile (_transpile_) down to C (Haxe, Dart?) are chosen because they enable the engine to have the potential to be cross-platform, since most hardware devices use C and the most popular open-source low-level library, SDL, is written in C. I also favored languages that are fast, performing at near-C speeds (update: as it turns out, the GPU code is probably the most important, and it doesn’t really matter what language sends the GPU instructions, because those instructions are the same). Thus, there are no engines listed that use pop programmer languages such as python (pygame), javascript (i *loathe* web dev and it’s entire trajectory), ruby (i read that it’s *extremely* slow, causing problems in even simple non-game apps), or anything like that. Also, i just don’t care about super duper engines with a complexity of Unreal, as i am but a mere mortal.




# sources
https://itch.io/game-development/engines
https://itch.io/game-development/engines/most-projects



# a list of video game engines

## the big boys
  - true or well-treaded cross-platform support
  - opinionated, complete game engines, must conform to the framework

### 3D, with 2D
  - Unity(3D)
    - C#, Mono (the FOSS C# runtime), custom UnityScript (gone..?), **3d emphasis along with solid 2D** (even with mobile devices—**it has a bajillion optimizations**), **the best cross-platform solution—truly one-click!!**, a long time standard for indies (mostly as it was the only choice), although closed-source the C# code is available for “reference” on github (the C++ code is not); although it doesn’t reek of immoral people, it has the stench of bloated-ness, advertising, and an asset store deeply trenched in capitalism (nearing Roblox level); yet, if you stay sane, you can make anything with it, likely without touching the asset store
    
  - Unreal
    - C++, commercial, Epic Games, seems like you need a very advanced team to use it?? though, you can get very far using the visual programming thing ("blueprints"). lol, *reeks* of shit “AAA” (*what does even that mean??*) games and human-labor-abusing companies. Though you can make anything with it, in my mind, it always seemed more specialized for 3D games, particularly where the player controls a single character (first/third-person shooters)
    

### 2D *only*
although these **reek** of the nasty smell of degrading immoral mobile “game” companies, god-awful Facebook “games”, and gambling companies (in shady places like Russia and China), **these engines have shipped several games cross-platform, and thus are far more stable choices than most things indie engine makers churn out**. also, all of them are open-source.

  - **Defold**
    - TODO: last one to try!
    - 2D/slight 3D, Lua, became open source rather recently (2020?), **great for mobile**, **modular building results in a tiny executable**, great tutorials, easy to get started, no-autocomplete in the provided IDE’s code editor??, **by far the best 2D solution with true cross-platform support**, originally made by the company that made candy crush
    
  - x/Solar2D (CoronaSDK)
    - NOTE: note game editor!
    - open-source (used to be commercial), C/Lua, also used to make shitty 2D mobile games for over a decade
    - https://www.reddit.com/r/lua/comments/xfbrc1/comment/ionltk9/
      - "Solar2D, on the other hand, is more complete and fleshed out, a relatively large framework you can extend (less conveniently) with plugins. Trading freedom of action for ready-made functionality and overall consistency."

  - x/Cocos2d/Cocos Creator
    - C++, open-source, used to make shitty 2D mobile games for over a decade, now comes with a complete IDE (Cocos Creator), the Obj-c version was especially popular to make iOS games back in the day, **i personally used this once for a local-networked iOS game, and after that, i stopped using a computer for a decade**, how much of that was actually causal is a philosophical problem :D
    - https://www.reddit.com/r/gamedev/comments/16p6fno/why_isnt_anyone_mentioning_cocos_creator/
      - originally made by an Argeninian person, then ported to C++ by a Chinese person, and then that took off, eventually they built Cocos Creator, it's editor, and that part is closed-source, and a lot of the documentation is now in Chinese, so it lost it's world-wide appeal
    - i'm scarred by my past experience with it in it's worst form: objective-c
    
  - FlatRedBall
    - C#, 2d-only, now using FNA, made in 2005, very much of the C#/.NET world, with an editor built using .NET
    
    
### coming up
   - Godot
    - STATUS: 10/24 no console support, false advertisement
    - **C/C++ core**, custom programming langauge: gdscript, custom visual programming langauge: visualscript, non-programming making-tool, janky community-maintained C#/Mono bindings (still jank as of 2024), **2d emphasis _along with great 3d_**, **open-source** (with all it's pros 'n cons), small 20mb standalone size, the C/C++ core makes it a really really cool way to get handle of C++, using it as leaping stone to more DIY-style modular engines, yet also retaining all of the programming power of C# through bindings, clearly the best choice among the big engines
      - https://forum.godotengine.org/t/is-godot-gradually-adopting-c-as-its-primary-programming-language/62938/12
      - https://github.com/godotengine/godot-proposals/issues/6031
      - https://www.youtube.com/watch?v=tzt36EGKEZo
        - miguel de icaza, the writer of Mono among many other things, goes over the garbage collector problem of c#, then writes swift godot
          - **multi-threaded runtimes, such as in mono/java/go, can't collect garbage without stopping everything ("stop the world")**
            - there is no .NET garbage collector that can avoid pauses, nor any solution (though many band-aids)
              - it's possible, it just requires funding but no one is willing to do it, and still, it would take years to implement
          - admits swift is better than C#
            - c# gets features from swift to keep up
          - impressed by how well Apple is running an open-source project, compared to his personal experience at Microsoft
          
  - x/Luxe
    - **STATUS: 10/24, still under HEAVY development, not near v1**
      - **ERROR: memory leaks in the game and lsp. game editor far from complete.**
        - a simple game starts at 200mb and quickly balloons to 500mb
        - on debug mode, it starts at 500mb, and adding a few sprites will slow it down to a crawl
      - unfortunately, because of this, jblow's engine will actually be done by the time this reaches v1, and very likely won't be nearly as thorough as jblow's work, nor will it have the luxuries of a game-specific language. until then, it's best to choose one of engines in the main list, some of which are 10-20 years stable.
    - 2d/3d, C/C++?/Wren, really well-designed/architected stuff by the snowkit collective’s ruby0x1 (a beautiful soul), but stuck in closed-beta for a long long time (~10 years??), just as the original one was much loved for it’s design. Unlike Haxe/FlashPunk and Haxe/Flixel, it contains an ECS system similar to Godot, which is tightly-coupled with it's optional game editor, allowing you to choose the way you want to make a game: with or without an editor Also, it's more modular. Luxe provides core classes for sprite, audio, transform, scene, etc., and a simple 2d collision system is provided through a module.
      - camera, scene, etc. are all there... overall **it's a very complete engine, on the level of Godot, but more modular, yet still quite heavy...**
    - **wren, though pretty, is simple, bare, no advanced features nor any dynamic magic. mruby and haxe are both far superior to that regard. it's a tough trade-off. things like named parameters, writing imports for every built-in class/component you want to use, and it's inability to hide the framework (maybe by design..), make it feel much heavier than dragonruby and ceramic.., though the ECS is indeed optional..** maybe i just needed to try it without the ECS, but then, i wouldn't be able to use the editor.. :/
      - **in this regard, haxe and ruby both have meta-programming that make it easier to expose values to be fine-tuned.. no ECS is needed.**
    - **it provides various common ways of game development, thus avoiding any constraints: with ECS, with ECS and game editor, and without; and then, even further, provides common modules**
    - it provides functions for 2d, though, it's still 3d, and you'd have to do things like world vs local coordinates (maybe a component level thing..?)



## non-programming interfaces:
  - ct.js
    - has a scratch-like language that transpiles to javascript

  - GDevelop, a newer one becoming quite popular..

  - **Construct, **no programming**, back in 2013 **this thing worked like a dream, even on console!**, I have no clue how it is now...
    - now has javascript, and really just developing quite nicely..
  
  - GameMaker, **with and without programing**—this allowed people who don’t know programming to learn in a very intuitive way and most importantly by following intrinsic passion, custom scripting language, examples: Rivals of Aether (Dan had to wait for the big GM2 update before releasing it on the Switch, and even then, it took 3 years to port..?), Hyper Light Drifter
  
  - Stencyl, not sure if this one’s still alive... **made in Haxe!, and maybe can even use Haxe to actually write code!?!?** that alone makes it a top pick imo! <3



## coding-focused 2d first game engines people have fond memories of <3 <3:
these make good first engines for programmers, as the engine size is tolerable, readable, and simple, yet abstracting the low-level stuff away from youthful eyes, and providing a simple framework to work in, *batteries-included*, though slightly constraining, and slightly bulky, not bad, especially in the case of haxepunk and ceramic

  - **Ceramic**
    - conclusion: **surprisingly most similar to my own personal tastes: the natural evolution of haxepunk and the old luxe in haxe**, but unfortunately, it was developed much later than haxepunk, and now he just can't compete with the professional development of heaps engine and hashlink. It's limited to openGL and 2d, until it adds hashlink as a back-end. Though, still, **it easily wins my choice for opinionated complete frameworks (a big engine), batteries-included to begin making stuff immediately, and can potentially out-perform all of the engines using scripting languages, and it's written in haxe**
    - **2d**, Haxe, basically glued together from the original version of luxe and other haxe libs
      - has luxe's ECS
        - and it seems much simpler/neater too!
    - **a more suitable successor to haxepunk 'n flixel as it is batteries-included: including an entity system, tween system, easy integration of physics, ldtk, has it's own gui (in addition to haxe-ui)**, all of which heaps doesn't provide
      - **strangely, created it's own back-end (in addition to OpenFL/lime, NME, Kha), based on luxe's original back-end (snow)
        - **it's stuck on OpenGL (like lime), and would require hella work to support contemporary graphics renderers**, thus not intended for consoles
        - **uses hxcpp as opposed to the hashlink runtime**
          - **thus would have to use web as main dev target as opposed to hashlink's bytecode (which guarantees the same output), and you'd have to handle device-related apis for consoles 'n mobile devices yourself**, but understandably, this is the way haxe frameworks must go. hxcpp, though, is very well maintained as it's used by all haxe frameworks/engines except heaps, including kha.
          - **you also lose the built-in C functions in hashlink, and likely C-arrays and C-structs (and their macros) too**
        - export to unity via C#?? ...what?
          - haxe is amazing.. but i dunno what kinda problems that could introduce..
          - maybe will be dropped by haxe v5
      - includes integerations with ldtk and aseprite
    - https://github.com/jeremyfa/ld49/tree/main/src/ld49
      - **can easily write data-oriented style, and it's ECS is really neat. this is beautiful use of haxe.**
    - made by one person, into new media arts
    
  - **HaxePunk**
    - 2D, Haxe, OpenFL, *abandoned*, FlashPunk was **my favorite engine** but it never seemed to stay alive, though, it seems to have transcended with the users, as people made their own engines resembling FlashPunk; i think many of the original Punks initially ran to MonoGame, then further down a level to building their own C/C++ middleware between SDL and their C# engine... although abandoned, it’s probably just fine, just a few years of OpenFL/Lime updates.. cross-platform, however, would require quite a bit of work..
    - object-oriented entities, though, iirc, can architect how you want to: composition, inheritance, ECS(? ..maybe?..)
    - note: inactive since *at least* 2018, likely further back, *but* OpenFL, it’s back-end, thanks to the HaxeFlixel community is still alive ‘n well, so, it’s very likely working just fine, if not better!
    
  - HaxeFlixel
    - 2D, Haxe, OpenFL, all off the Flash programmers probably ran here, **still active as of 2022!!!**— that’s incredible really..., seems to even have kept up Switch support (one console is *more than enough* imo), though Flixel has always been **the rather fat bloated constricting big brother of HaxePunk**, there’s no doubt that it’s the most beginner-friendly, with documentation written for beginners, a great debug console, etc. etc., and who knows, maybe when it was ported to Haxe, they got rid of some bloat



## coding-focused DIY / make-from-scratch second game frameworks without constraints:
these are more programmer-oriented, **more freedom—the ability to make anything without constraints**--, but at the cost of game engine features, and i mean *features*!!! Instead, they are more _**modular**_-oriented, so, instead of providing you with a collision system, tweening system, scene system, layering system, etc., you will have to integrate (or make) these systems yourself. It’s a sort of **assemble/make your own engine approach**... Unlike the big 2D-only (and 3d!) engines and the [#first-love](#first-love) 2d game engines above, these make a better path of becoming a true game programmer and programmer in general, as you are not merely conforming to a framework. With these there really are **no constraints, as you start with _nothing_**. **You are free to write the program however you want to.** it’ll just take time. If you’ve got a big project, then these are the way to go, as these engines will allow you to **develop the idea of the game while building the engine and tools suited specifically for it at the same time**. **If you just want to quickly prototype something that uses commonly used game features, then these are not the way to go.** however, given enough experience, you will become more adept at making game systems, especially in engines with scripting languages like **Love2d and Dragonruby, which truly excel for prototyping _game systems_ (not just games)..** **if your prototype is particularly experimental, innovative, or has a design that’s just very different, then these are def the way to go.** **As a benefit, since you are making your own game systems, it should be more portable, easy to port to any media framework (FNA, heaps, foster, C++). Your game is not dependent on any particular engine.**


NOTE: [#media-frameworks](#media-frameworks) are also an interesting choice, just one slight layer lower. However, these engines do a lot of the repetitive legwork for you, so, i just don't see much point going down another layer, at the moment. Also, all of these frameworks make it simple to add a C/C++ lib.


### 2D-only, stable

  - from [#media-frameworks](#media-frameworks)
    - Foster, is an interesting exception, as it's the only media-framework that is focused on 2d

  - **DragonRuby**
    - 2D, mruby fork, very well maintained, paid/commercial
      - **up-to-date rendering, consoles, etc.**
    - (unique as it's simple enough to use as a first engine,  yet it won't constrain you)
    - **the simplicity of love2d's api's, but with the power of ruby!!**
    - **true and honest cross-platform support with the intention to be the same across all devices as first priority**
      - no other game engine does this.. not even the two that are also truly cross-platform: unity and unreal
    - uses a ruby-like language, a fork of mRuby (embedded), as it uses C heavily (and thus SDL)
      - has it's own ruby runtime, the key of the project is in it: opcodes that align with llvm's register-based (vs stack-based) structure (which is basically what Apple's M-series processors do)
      - but also because of this, most ruby libraries will not work as the standard library is different
        - not that you'd really need any for games...
    - no ECS, but apparently with ruby's features (mixins, meta-programming, inheritance) you don't need one
    - no camera, scene controller, layers, etc. but rather provides minimalist samples for everythign you'd ever need
      - can easily copy and paste things in, see it updated live
        - **this is indeed the ultimate way to learn programming, the architecting part**, without the worry of understanding heavy game engines, memory, etc.
    - no game editor, but there are samples for a few ui elements to draw in-game, providing a sort of in-game imgui
    - **lots of tough work went into it: including making cross-platform std lib for mruby, altering mruby, providing a nice dev console and workflow experience, providing console apis / good cross-platform deployment**
    - **$48** on itch.io
      - a high up-front price, wish there were a trial..
        - though, they do provide some free options for the young 'n poor
        - not bad considering the cost of a single game back in the day..
    - made by an indian (amir rajan)! that uses emacs!! yay.
      - his talks/"content" always has info gems to glean on
    - **also made by ryan gordan, a dev of of SDL, prolific game porter, essential to the game dev pipline to linux/mac, indie humble bundles, and SDL**
    - also made by a llvm god
      - https://lowlevelbits.org/
        - https://lowlevelbits.org/compiling-ruby-part-3/
      - https://www.reddit.com/r/Compilers/comments/yauime/compiling_ruby_with_mlir/

  - **Love(2D)**
    - 2D, Lua and C++, very well maintained (20 years strong!!), a small engine that many people seem to... love! Sounds like **a great start to Lua** too! Sounds like it gives an experience of freedom close to DragonRuby, without constraints
    - https://love2d.org/wiki/Game_Distribution
      - how to distribute to all platforms, **very very easy for windows and android**
    - no LuaJIT runtime for mobile devices, but should be fine..?
    - https://www.reddit.com/r/lua/comments/xfbrc1/comment/ionltk9/
      - "LÖVE, as an engine, is significantly more compact and simpler compared to Solar2D. **LÖVE is not strictly opinionated, giving you almost complete freedom to organize how your game works. It essentially provides a minimal framework of primitives you can extend with whatever library you see fit for your game, or write most of the functionality from scratch yourself"**
        - yep, sounds similar to dragonruby
      
      
  - Gideros(Mobile)
    - i dunno much about this one..
    - 2D, Lua, mobile-focused, comparable to Corona / Cocos2D / Defold, but with a tiny non-commercial-backed community, apparently the code is so stable that games made in 2012 still work, yet it is still being updated as of 2022!, also the android support and exe size are excellent
    - based on Flash, focus on mobile (with some native api for mobile features)
    - sounds like a lovely little low-key community behind it, like haxe
    

### 3D (and maybe has a 2D module), stable

  - from [#media-frameworks](#media-frameworks)
    - notably FNA
      - **FNA** has a big eco-system, and likely can build or assemble a game engine with the benefits of libs, documentation, a big community
      
  - **Jon Blow's engine**
    - STATUS: 10/24, still in closed-beta
    - Jai, likely well-designed and thoroughly thought out, down to first principles, just as the language is, and just as his nature tends towards
      
  - **Raylib**
    - **seems more oriented for learning as opposed to having a finished product..??**
    - seems great for prototyping, especially mobile devices, as it should compile easily..?
    - **i *love* the old-school cheat-sheet/reference that contains everything you need in one place, it reminds me of toys that came with a well-made manual**
      - **it's api is... special. more low-level, much more educational, closer to how graphics work.**
        - **absolutely the best way to learn C, which leads to real game engine and game programming**
    - C (C99), because it's written in C, **just about any programming langauge can be used**, and, when needed, can use C
      - really well-architected, using simple C libs (stb, etc.)
        - https://www.raylib.com/images/raylib_architecture_v5.0.png
    - gui extension: raygui (immediate-gui)
    - list of bindings:
      - https://github.com/raysan5/raylib/blob/master/BINDINGS.md
        - **includes every language ever: haxe, beef, zig, nim, crystal, etc., enabling you to choose the language you want to build your engine out of**
          - **thus, instead of dividing communities by language, they can all rejoice with one game engine :)**
    - also **includes support of every platform, renderer, etc** (also thanks to being written in C)
      - from desktop to raspberry pi to switch to html5, it's all there
      - every renderer back to opengl 1.1!
    - generally lower-level feeling, building/compiling c
    - seems a much better platform for creative-coding than many media/io frameworks like processing
    - https://www.youtube.com/watch?v=bddSPUidjAE
      - very inspiring video of someone who tried a bunch of big general engines, then finally got into the zone with raylib and finally was able to make their own engine
      - **80,000 entities at 60fps with <300mb memory**
      - **incredible, beautiful, optimized debug drawing libs**
        - "All those functions fill a batching system with vertex data and shapes are drawn in screen by gpu, processed by a fragment shader." --raysan5
      - **can easily jump/port between languages of choice**
      


  - **Heaps**
    - STATUS 2024: up-to-date, with directx/metal and vulkan soon
    -  **2D/3D complete separate modules**, **Haxe** (then to C or bytecode via HashLink), **made by the maker of the Haxe programming language**, contains a rather bare framework who’s 2D module resembles HaxePunk’s core without it’s features (no collision/“masks”, no entity, no tween lib, etc.) and without it’s extra helper functions. It however does include essential features such as scene handling and a scene tree, carefully placing it’s features-set somewhere between a media framework and a game engine. This was my own personal choice for a game engine, but, unfortunately, ***the community is tiny (less than 10 people on haxe discord), the documentation is spartan, and it seems everyone wastes time trying to understand how it all works via trial and error. It is used as an in-house engine for a game company, and it feels that way.** Having said that, it's **still an amazing framework, and you have all the power of C.** Examples: **Dead Cells, "4X" strategy games like Dune: Spice Wars**
    - made to run on the gpu, so have somewhat less control, but have gpu optimizations
      - probably makes a difference compared to other haxe frameworks..
    - hashlink
      - because the langauge and toolchain was written by a game dev, everything is simply bundled together with the runtime (hashlink):
      - **a haxe runtime containing a debugger, cpu profiler, memory profiler, graphics profiler (nvidia nsight), and bundle of game-related libs**:
        - SDL, **opengl, directx (vulkan was a pain), web-gpu soon, some basic native ui api, common stb-like libs, steam/console api, custom libs (seralization), etc**
          - **works for nintendo switch, ps4, xbox**
      - complete control over C via C functions
        - **C-related things like CArray and C structs for optimal memory usage** SoA/AoS
          - **this in particular distinguishes it from all other haxe frameworks, all of which use hxcpp (C++ transpiler) instead of hashlink**
    - **shiro tech stack**
      - **HIDE, a modular DIY game editor builder**, in which you can display to using hxml/css, using a browser/web-view for a rmgui, a very clever gui solution, better and more modular than including a whole ui framework with the engine, and more performant imgui-
        - **can edit scripts within it, and it provides access to the LSP for auto-completion**
        - **castledb, now part of HIDE, a game database gui, can also add/edit scripts which are related to game-items within it!**
        
        

    
### notable history

  - x/MonoGame
    - **STATUS: use FNA instead**
      - caused a headache among all the poor indies that used it, full of regret
      - though, finally, in 2024, it now has a foundation/sponsor and is being developed
    - 2D/3D, C#, an indie darling all the way back to Fez, to Stardew Valley, up-to Celeste, started as an open-source port of Microsoft Xbox’s XNA framework, but be warned: *it’s barely even an io framework**, still alive ‘n well, still perhaps the main alternative to the big boy engines
    - MonoGame Extended, *you’ll need this*, or something like this for the actual game-part of framework (at the least it’s entity system, scene system, and collision system)
    - i just don't like C# so much... especially their conventions..! *ugh!*
    - definitely not an easy porting process
    - surprisingly, completely written in C#! it just uses "unsafe" feature to use raw pointers
    - https://www.reddit.com/r/gamedev/comments/16vk8bl/comment/k2uc5ae/
      - "Up until recently, Monogame has had very little open progress made on it. I believe they have huge plans for the future to truly become XNA improved, but until then, it's stuck on OpenGL 2.0 and DirectX 9 if those matter to you. Meanwhile, it's console development seems to rely on Brute, a close sourced (due to console NDAs) C# to C++ transpiler, much like Unity's IL2CPP, and is stuck on a similarly ancient c# version, while FNA has proven at the very least to be able to use .Net 7.0 NativeAOT to deploy to the switch, and also has vulkan support in FNA3D."
      - "Just because no one has publicly stated to have ported a modern c# application to consoles using monogame doesnt mean it isn't possible with NativeAOT as well. But if you wish to have my take, use FNA for consoles and PC development right now, monogame for the future if it gets better, and monogame right now for mobile development which iirc FNA can't do at all."
    - https://www.reddit.com/r/monogame/comments/1ax6p5s/comment/krlxwv5/
      - "The content pipeline sucks big time in general. The problem is that working around not using it takes time (specially with fonts)."
      - "The MonoGame team doesn't give a shit about releasing updates regularly. Sorry if this sounds harsh, but it's the darn truth and you know that many people feel the same way. You also know how to fix it. FNA have a smaller team and they release monthly, so people can benefit from bugfixes and other improvements monthly, not yearly."
      - "The MonoGame team are focused on consoles, where they can make the money. I don't blame them for this at all (I've got to feed my family too), but the "MonoGame on desktop will be what the community makes of it" is rather concerning. There are bugs that no one is looking into. MonoGame is stable but not bug free, so this "we are moving on" really concerns me. Looks like the founding they got recently is going to be used to pay contributors for things such as Vulkan, Metal, DX support. Hopefully, this will take MonoGame into the 202x decade."
      - "The shader compilation thing (as I understand it) is due to reliance on Direct3D via MojoShader for cross platform builds. Basically all shader code must be transpiled if your computer isn’t running windows. "
      - "C# is great, but bloated"
    
    

    

## newer, more experimental indie game frameworks, built using smaller contemporary C libs, often maintained by a single unpaid person, therefore making it likely to be abandoned
most of these aim for minimalism, portability, independency 
many rely on pop C/C++ libs such as: SDL, GLFW (for OpenGL and Vulkan?), bgfx(?), openAL, etc.
all of these are kinda experimental, but they are written so simply and so well, i personally feel i can jump into any. :)


### newer indie-made engines:

  - bevy
    - 2024: still going
      - https://www.reddit.com/r/bevy/comments/1cuq7uu/current_state_of_bevy_for_professional_game/
        - an update in the first comment
        - iOS and andriod uneven
    - A refreshingly simple data-driven game engine built in **Rust**
    - amongst the most popular and long-lived rust game engines, in a languages where they build and abandon things very frequently
    - https://github.com/bevyengine/bevy/blob/latest/examples/games/breakout.rs
      - example of breakout
      - seems to works well with DoD style programming.. especially the derive macros
    - **has the the great power of a huge rust community**, whereas most other engines are made by a single person, with a few helpers

    
  - Foster
    - NOTE: not a game engine, it's a media/io framework, but, specifically for 2d..
    - **2d**, super clean modern C#, up-to-date as of 2022, basically just a giant interface for different backends (SDL, GLFW, Vulkan, etc.): **a modern io framework**, similar to MonoGame but written much more simply and **far more flexible / future-proof**, **no game features whatsoever making it even more bare than the already skeletal MonoGame**, by Noel of Celeste and Ikenfall(?)
    - the core uses C/C99, very simple, minimal, beautiful
      - https://github.com/FosterFramework/Samples
        - C# is blessed by having community-maintained libs 'n bindings such as that for imgui
    - a media framework limited to 2d is... interesting. maybe requires less work on the renderer side..? not quite sure why one wouldn't use FNA..
    
  - blah
    - C++, very minimal, perhaps helps in the decisions of making Foster, up-to-date as of 2023, by Noel of Celeste

  - orx
    - 2024: up-to-date
    - "2.5D, data-driven, portable game engine focused primarily on ease of use and powerful features."
    - https://github.com/orx/orx
      - this looks really, really impressive...
      - very featureful
      - cross-platform, continuously tested (except consoles)
    - C++
      - **the examples on drawing lines looks painful, however, it's probably the fault of C++, not the engine**
        - https://wiki.orx-project.org/en/guides/beginners/main
    
  - dome engine
    - STATUS: still ok as of 2023..
    - a very cool simple game engine in wren! :) but also, seems like a small personal project..
    - https://github.com/domeengine/dome
    - **domepunk**, the punks never die! :p
      - https://github.com/NinjasCL/domepunk#project-explanation



##### abandoned
  - x/Rise
    - by the FlashPunk man himself Chevy Ray, looks like a C#/SDL successor to FlashPunk, or a pre-cursor to Foster
    - abandoned in ~2018, or maybe went closed-source during the dev of ikenfall..
  - x/StrawberryBF
    - **Beef programming language**, abandonded in ~2021, also seems quite experimental, made by Maddy of Celeste, an absolutely disgusting name tho, ew :/
    - the old tool-set: https://celestegame.tumblr.com/tools
      - their sound tool, FMOD, became a tutorial!
        - https://www.fmod.com/resources/documentation-studio?version=2.02&page=appendix-a-celeste.html


#### everything else
  - trial
    - **common lisp*
    - made while making Kandria, a Celeste-like metroidvania
    - https://github.com/Shirakumo/trial
  - Beef2D
    - beef (basically C# with manual-memory-management), 2d, included in the main Beef language repo
  - Pile
    - beef, more like Foster: modular renderer
  - Dinghy
    - C#, in development, very new as of 2021, built on top of Kinc (which makes it a little different from Foster, as Kinc does the job of handling and supporting io stuff)
    - https://dinghy.xyz/
    - he also made this JSON editing tool similar to Nicholas’s (of Haxe ‘n Heaps) CastleDB
      - https://github.com/afterschoolstudio/Depot



### 3D
i have no clue about these
  - Urho3d, C++, inspired by Ogre3d (and sounds like an ogre’s name too!)
  - Panda3d, ?
  - Armory(3d?), a game engine inside the industrial animation software Blender??, sounds very specific... like for making Ghibli level games?



## specialized:

### genre-specific stuff:
despite that limitation, these are quite popular in game jams, where content > programming-needed design
  - M.U.G.E.N., fighting games!!!, but likely old and limiting :(
  - RPG game maker, make JRPGs!!
  - twine, "An open-source tool for telling interactive, nonlinear stories"
  - tyranobuilder, "​A cross platform visual novel studio"
  - adventure game studio
  - etc.

### constrained
  - **Pico-8**, a “fantasy console”, just from [this page about the development of voxatron](https://www.lexaloffle.com/voxatron.php?page=dev), full of little GIFs that display truly awesome little features, what’s there not to love?—well, for one, i’m not a pixel, and definitely not a voxel (_vomit_) lover :(. Beyond that though, this is truly a charming little world, possibly even a model for any game-maker community project
  
  - bitsy, another fantasy console..?
  
  - gb studio, "A free and easy to use retro adventure game creator for your favourite handheld video game system"







TODO: merge below somewhere..
experimental technical stuff
these just seem too technical for me, toward the modern C++ independency header-only trend. Have to be careful of these, as it gets easier to make game engines, programmer-personality people just seem to make them naturally, without much reason, and often lack any sort of vision or long-term mentality, often becoming abandoned school projects. It’s better to stick with indie game devs whom have a serious life-long passion motivating their works, or at-least some games they plan to keep forever.
  - EntTT, C++, just an entity system??, used in Minecraft and the Diablo II remake
  - nCine, Lua, more along the level of i/o engines like SFML *i think*
  - nimGL, Nim, graphics layer?
  - ?, Crystal, *i think there was one in written in Crystal...*
  - Halley, C++, inspired Foster





# io-related software frameworks and libraries
these can be used or combined to help you make your own game engine

## media frameworks, media layers, foundational frameworks, io frameworks, back-ends, etc.
these provide access to the platform’s input and output (graphics, “contexts”, etc.), windowing, and often including audio and font rendering too
not ordered

https://www.reddit.com/r/gameenginedevs/comments/1do1wcj/comment/la7gey5/
  - post by a person going through the process of patching up an engine, dinghy
  - noteably, at this point see the **handmade discord**

### classics:
  - **SDL(2)**, C, **_the_ de facto library**, usually used as a core library, then accessed through a higher-level language, *serves as the base of most game engines**, written in straight C that can be difficult to understand, has a history of porting games to Linux (and therefore the beginning of games for Linux, often open-source), supported by Valve, there’s really no competition
  - SFML, C++, more accessible for creative / DIY people who want to tinker really low-level stuff, but it seems no one likes it..., maybe harder to interface than C?
  - GLFW, only handles input and graphical output and windowing, no audio/font/etc., low-level people seem to really like this one
  - Allegro, **C**, "Allegro is a cross-platform library mainly aimed at video game and multimedia programming"
    - "Allegro, IIRC was a more complete gaming library by itself and had sound mixing routines, MIDI, more loading routines for various file types, a simple gaming filesystem, fonts, various types of sprites (compiled, RLE, etc)."
  - x/GLUT, "horror of horrors", toy, abandoned in the 90s
    
https://www.reddit.com/r/programming/comments/8wwwu/which_is_better_sdl_or_allegro_or_plain_opengl/


### the new old:
  - **Sokol**, C, "minimal cross-platform standalone C headers", supports all graphics, integrates with everything, new stuff
  - **Kinc**, C, “low-level game library and hardware abstraction”, used as the base of Kha
    - Linc, C/haxe?, used by the original luxe
  - LWJGL, Java, maybe the new LibGDX?, OpenGL/OpenAL/OpenCL


### high-level io frameworks:
NOTE: see [#game frameworks], overlaps greatly with it
probably could also be used like a “creative” framework to make just about anything, but providing a more familiar game engine feel to it, making integrations of common game-related features much easier / common

  - FNA, Mono (or now .NET Core?), an actively maintained copy of XNA 4.0 api which enables **rock-stable longevity** and easy mainteanance, far better maintained than MonoGame
    - STATUS: 2024, up-to-date, with fez working in SDL3
    - most games in monogame eventually ported to this
      - **most indie games on consoles use this**, otherwise a custom C++ engine
      - far far better maintainer story than MonoGame
    - rids MonoGame's garbage content pipeline
    - filibitjijo, noel (of Celeste) is usually on the discord
  - MonoGame, Mono, open-source copy of Microsoft XNA’s api, a solid foundation ruined by a bad content pipeline and slow maintanence

  - LibGDX, Java, Java’s answer to SFML?, and just as old and solid too, this one is *much loved*, sorta has a cult fan community like OpenFrameworks, perhaps with a similar new media artist users
  
 - Beef’s corelib folder, just a wrapper over SDL?

  - haxe:
    - this needs it’s own section because this part of the Haxe world, unfortunately, is hella confusing and probably the main cause of deflecting people away from Haxe
    
    - Clay, Haxe, hxcpp, back-end for Ceramic, patched up from scrapes of the old luxe (snow), relatively newer than the other frameworks but still many years old, seems the cleanest, using contemporary C libs
      - not really used by anything other than the Ceramic engine tho..
      
    - **NME**, Haxe, hxcpp, seems to be a more fit solution closer to it's problem compared to OpenFL, which has the baggage of being flash-compatible, but because it doesn't have the flash user-base, it's far less popular, **unlike Lime this library doesn’t separate the graphics side from the i/o side**, notably **an extremely consistent maintainer, who also maintains hxcpp transpiler**
    
    - Kha, Haxe, hxcpp, provides various levels of graphics api and requires some graphics programming, "Ultra-portable, high performance, open source multimedia framework."
      - definitely the most optimized solution
      - criminally unpopular because of it's inaccessibility to inexperienced graphics prrogrammers
        - though, it does provide both low and high level apis
      - uses as **the base of Armory game engine**, **very stable**
      - this one is kinda esoteric, a very quirky man is behind it, lol
      
    - x/OpenFL/Lime, Haxe, uses Lime as it’s back-end, forked from NME, of these io frameworks this might provide the highest level api, flash-like api, mainly for HaxeFlixel and FNF (a DDR game)
      - Lime, low-level, no renderer / only various renderer contexts are provided, a core component of OpenFL
        - compiles via hxcpp and hl, thus has the most options for deployment
      

 
 

### “creative” frameworks:
often uses in new media art, installations, hardware devices, etc.
  - **OpenFrameworks**, C++, SFML, still up-to-date as of 2024, "openFrameworks is a community-developed cross platform toolkit for creative coding in C++.", a far more diverse new media arts community, also has a New York base and community, used by Zack Gage to make iOS games back in the day, including helping Vlambeer make Ridiculous Fishing
  - **Cinder**, C++, still up-to-date as of 2024, "Cinder is a community-developed, free and open source library for professional-quality creative coding in C++.", more C++ style, a smaller but more skilled community


## graphics back-ends
these provide abstractions to access various graphics apis (i have no clue what’s going on at the level)
  - GLFW, C?, OpenGL api, the standard for OpenGL renderer
  - BGFX, C?, modular? (OpenGL, Vulkan, DirectX, etc.)
  - Veldrid, C#, graphics-agnostic renderer, *solely uses C#/.NET5, no dependencies*?
  - Diligent Engine, C++14
    - * “Diligent Engine Direct3D12, Vulkan and Metal, while supporting older platforms via Direct3D11, OpenGL and OpenGLES...uses HLSL as universal shading language on all platforms and rendering back-ends. Platform-specific shader representations (GLSL, DX bytecode or SPIRV) can be used with corresponding back-ends...”
  - GLAD, this just generates bindings of various OpenGL or Vulkan for you, to several languages

## an example of a bunch of independent libs used to make a simple game engine
from TidyEngine, a tiny engine made by college kid
  - https://github.com/AntiSC2/TidyEngine
* CMake, used for building the project
* assimp, used for 3D mesh loading
* GLFW, used for handling windows and the input
* glad, used for OpenGL rendering. (glad is already included in this repository)
* glm, used for vectors and matrixes
* stb_image.h, used for bitmap loading
* OpenAL, used for audio
* libogg & libvorbis, used for loading sound samples
* LuaJIT, used for Lua scripting
* Freetype2, used for font loading and rendering

todo: Dome Engine also makes a good example of a minimal game engine



## game engine “front-end” / building your own engine
this is the part you make!

### top-down approach of learning: dive into the deep end, make some stuff, and then *you just know*
though you make this part yourself by simply adding what you need, it can help to look at other simple open-source engines to get an idea. I’d suggest looking at the following engines, ordered from simplest to most complex:

  - haxe:
    - FlashPunk/HaxePunk, 2d, simple flash-like api combined with a 2d engine: 2d scene graph, layers, entities, simple 2d collision, collision helper functions, math helper functions, camera, composition (minimal single-level inheritance, but no components)
    - a bit outdated now due to it's OOP style, see Ceramic instead:
  - **Ceramic**, 2d, ecs, tween, scene (state-machine), easy-to-integrate other libs (physics, collision), neater lower-level C libs
    - Luxe, 2d>3d, ecs, written really well, the original version was abandoned, but that doesn’t mean you can’t learn from it!
    
  - c#:
    - Nez, 2d, a 2d framework on top of MonoGame, provides you with everything you need: ecs, collision, optional physics system, etc.
    - Monocle Engine, 2d, made for Celesete, there seems to be components for: graphics, collision, physics, etc.
    
  - c++:
    - luxe, new
    
So, start with a stable media framework in your favorite language, then build-up as you need from there.


### bottom-up approach of learning; making from “scratch”
okay, well, not scratch scratch, but *assembling a game engine* is actually less crazy than i had first thought. Now with so many good, simple, open-source libraries, you can just throw a bunch together in your own favorite language and make an engine. This way, you aren’t burdened by a massive framework you didn’t write. Everything in it exists because you yourself wrote it, and you yourself can always change it. Hopefully you wrote it out of a specific need for it. It’s specific (to your needs) as opposed to general.
  - SDL
    - although the main file is like 6000+ lines, it’s much simpler than it seems; just glance at the api docs, and you’ll be like, “oh yeah, right on right on..”
  - Zach Barth’s “minimalist game framework” is barely more than a SDL wrapper for C#, which gives off a rather powerful feeling of *freedom*
    - https://github.com/zachbarth/minimalist-game-framework
  - Beef’s corelib module/folder, contains a wrapper for SDL, and the SDL functions are used directly in the sample “Space Game” provided, which makes for a really cool **“low-level” api through high-level language way of making**
    - Beef’s Beef2D module/folder is the natural next step
    - **Pile**, inspired by Noel Berry’s Foster and Microsoft’s XNA framework, uses SDL for “system” stuff (i/o, window, etc.), contains a packager ‘n resource/asset loading and batching ‘n buffers like XNA, and built in a way to support multiple renderers like Foster (although, at the moment, only supports OpenGL)
      - https://github.com/EinScott/Pile
  - **Foster**, by Noel Berry, is like SDL for C#, with the OpenGL renderer portion being optional / modular, and the goal being to maximize the use of C#/.NET as opposed to relying on SDL/C


# languages
personally, languages don’t bother me *too* much. As long as it can at least do ActionScript3 did, I’m alright. Just not... objective-c. 😨 Otherwise, some features or traits i much prefer: static typing, general-purpose (so that you can use it to make anything, beyond games!), references by default but ability to use C-arrays and C-structs to sorta be in control of memory allocations, game-oriented garbage collection, easy interop with C, native compilation or transpile to C. See [Beef’s design foreward](https://www.beeflang.org/docs/foreward/)

the C/C++ world is a stable one, as **the most crucial low-level cross-platform libraries SDL (and SFML) are written in C or C++**, but, the engines made in purely C/C++ are often more geared toward code-only non-editor skilled game programmers that want to assemble or build their own engine

the C# world is supported by the big boys (Unity, Godot through bindings) and indies alike (MonoGame/FNA), and it’s quite easy to write “interop” code for C/C++, in case you do need to use a C++ library or just a few functions, making it rather ideal for indies, hobbyists, and game-designers; also, .NET is just a super powerful language with a fuck-ton of features...

the Haxe world is a really cool alt to Microsoft’s massive C#, involving a rad little community of loner hobbyist hackers ‘n makers. With a community, and unlike C#, you can feel like you make a differences, as many of the things made in this world are made by people like yourself: an artist. Like C#, it’s very easy to write bindings for C/C++ or even just rewrite libraries completely, yet, it’s libraries (via package manager haxelibs) are rather lacking, so you might just have to DIY. Thankfully, it’s a very game-oriented world, thanks to the mass migration of people from the Flash world to OpenFl, the open-source cross-platform version of Flash, which is written in Haxe. Though a small community, there’s certainly nothing wrong with the code. It works. It works quite well too. The language itself is maintained fantastically by the Haxe foundation; OpenFl is maintained by another group; And Heaps is maintained by the maker of Haxe, who himself runs a game company, using his own engine, Heaps, with Haxe. The language magically transpiles into anything, has its own super optimized VM, and so on, much before Google’s Dart, and somehow far more performant than both Dart and C#. Whereas C# becomes a massive monster supporting everything, along the same path as Unity, Haxe is generally *minimal, modular, dependency-free, written squeaky clean*. Everything is written this way because we are humans, and we can only handle so much, therefore, the code must be simple enough for a hobbyist to understand. Having said that, the Haxe world is great for game programmers, but can be intimidating for people that rely on big game engines complete with an editor and all tools and libs that come together—with the exception of HaxeFlixel.

I don’t know much about the Java world. LibGDX seems to be exceptional though, loved by many. Where SDL may be daunting, LibGDX may be a more creative alternative. Similar to Haxe it uses a VM, JVM, to transform the high-level code into hardware-level byte-code, making it cross-platform.

Newer things like Nim, or even game-specific Beef, Jai, are all in their infancy. But, given how modular common libraries have become, there’s no reason to be scared, as long as they are using SDL or something similar at it’s core, then it’s just as stable as any other engine! You just have to trust their makers. For example, I have extremely high faith in in Ruby0x1 and Bob for their development of Wren, and Jon Blow for his development of Jai (i don’t know who made Nim or Beef... yet?). I trust these individuals over any open-source project.

Scripting languages, such as lua and wren, just seem meh. More geared toward attracting a beginner-friendly user-base. Not really suitable for game engine programming, and pretty boring for even gameplay programming.



## game-specific
these are worth looking at for long-term game-makers, as it’s quite an investment in time. Game-specific languages probably have these features: a memory management system that’s good for game-making, ways to express game-specific things, and debugging features for game-specific problems.
- **jai**, Jonathan Blow’s baby, built alongside it’s IDE and even alongside his next game, the IDE itself might be written in Jai(?), closed-source (while in dev at least..)
- **beef**, built with it’s IDE to provide debug features (at the cost of being less supportive of other pop IDEs?), the maker of it has habit of using horrible code conventions: mVariable for member variables and gVariable for global variables 🤮, open-source

see [programming-languages]







# resources:
wandering around github

people that make games

people in various game-making-related discord servers

games from scratch (youtube series and web-site)

[itch.io game engines used list sorted by popularity](https://itch.io/game-development/engines/most-projects)
  - a _current_ list of game engines used by itch.io game jammers sorted by most used / popular. This is also a very good place to see source code of various simple games, before they become too large or too abstracted (often unnecessary refactoring of code); this is probably **the quickest way to _understand_ how a game is made**. But _beware_, game jammers aren’t the best programmers, and so they’re going to focus on tools specifically made for jamming, such as genre-specific tools which require no programming at all!

https://thomasgervraud.com/best-2d-game-engine/
  - a good starting point on making a list

https://www.slant.co/topics/341/~best-2d-game-engines
https://www.slant.co/topics/1495/~best-3d-game-engines
  - pretty generic no life site, but it’s a list! and the pros and cons work!

https://notes.underscorediscovery.com/
  - the blog of the maker of Luxe engine

https://blog.kylekukshtel.com/csharp-game-engine-dotnet-5-kinc-monogame-xna-dinghy/
  - talks about making an engine on top of Kinc, slightly different from Foster
  - https://dinghy.xyz/posts/experts-and-beginners/
    - talks about the design of a simple framework, something very particular, yet, really pinpoints the differences between frameworks people love and people don’t

https://www.bayustudio.com/en/finding-the-perfect-2d-game-engine/
  - more on the big 2d engines (godot, defold, cocos, corona/solar2d)
https://www.bayustudio.com/en/godot-vs-defold-which-one-is-better-for-me/
  - godot vs defold (very close ‘n comparable!)

https://love2d.org/forums/viewtopic.php?t=92556&p=246175

awesome cpp
  - https://github.com/fffaraz/awesome-cpp#frameworks
  - https://github.com/fffaraz/awesome-cpp#game-engine
  - this is a pretty good place to keep track of “modern” C/C++ game engines, which is all the craze now
  - otherwise, it’s just through searching github..

https://www.reddit.com/r/haxe/comments/4ojgtc/haxe_vs_c_syntax/
  - the GPU is the fastest way to render objects, so an "objects per second" test is really more of a test of the GPU installed in the test machine. For the record, **both C++ code and C# code run on the CPU, and they have the same options available for passing instructions to the GPU. This reduces the advantage of C++ code.**

    But that isn't the whole story either. It's possible to use the GPU efficiently or inefficiently. A good library might be able to render many more objects than a bad one, so it depends how well-optimized Kha, OpenFL, and Monogame are.

http://forum.giderosmobile.com/discussion/7977/what-are-the-core-benefits-you-feel-gideros-delivers-better-than-other-development-systems
  - just checking the forums...
