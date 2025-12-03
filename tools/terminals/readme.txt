

this folder is largely deprecated, as i've since discovered emacs, which replaces the mess of cli/shell/terminal apps, and unifies all of their functionality to a single prgram, a single set of key-bindings, a single laguage, and is far more interactive and composable than shell piping i/o

lisp/smalltalk machines(?) > ?? > display postscript (next pc) > buffers (emacs) > text i/o (shell piping) 

see my conclusions in [shell-scripting] and [cli-shells]

yet, as terminals are still useful, i'm keeping it as is for now.. just for the sake of keeping some basic notes



TODO: some funny history reading
  - https://web.mit.edu/~simsong/www/ugh.pdf
    - 'the unix-haters handbook'
    - (found in the comments of the reddit post below)



i agree with this guy
  - https://www.reddit.com/r/emacs/comments/yq8eel/shower_thoughts_on_how_emacs_follows_unix/
    - "One might argue that Emacs goes against Unix philosophy, for it can quite literally do pretty much everything. But that only violates the first rule—if you consider Emacs to be a tool forge, then Emacs is quite in line with the Unix philosophy. *Emacs provides functions that all work on the buffer or bits of text, and these can all be composed to craft a work environment to fit your needs.* I use over 100 different packages, and they all play nice together!"
      - *unix communicates via streams of text, emacs communicates via text buffers*
        - what's the next step..?
          - display postscript, apparently.. (see below)

      "I have come to view Emacs as my primary forge. It’s my layer on top of Unix, if you will. If I have Emacs customized how I like it, it doesn’t matter too much what operating system lives underneath: I can get a lot of work done"
      
    - another commenter has a far more nuanced, political view..:
      - "I would correct the title assertion: linux blends unix and emacs philosophies in an emergent way. unix is the militant capitalist in street clothes, simplicity at a price; emacs tears the tinsled halo away and plants its sandals firmly on the ground, but insists that you crash on someone else's couch. Linux rejects the pay wall, but deems it acceptable to be paid well for one's time and arcane knowledge. it's way more complicated and non-linear than what the title implies."

    - another commenter spits some history:
      - this bit clarifies the limits of cli through history, vs gui
      - "Emacs, or to be more precise classic Desktop operating systems (where systems means literally the entire ecosystem, hw included) is designed like classic Xerox PARC workstation: *a single application is the operating system, this application today would be called framework since the entire source code is there, alive, live changeable, extensible etc*
        - the xerox parc alto had smalltalk!!
        
        Unix state: it's too resource hungry, better simplify creating a "system layer" hard to change, designed for vendors/hw OEMs/serious computing stuff to the "users layer" where a simple CLI (original desktops was GUIs) + effective IPCs and scripting allow enough low-cost composition.

        *This prove to be an immediate success, since it's far simpler, cost far less. But quickly have to violate it's own principles adding GUIs because they prove to be useful. X systems violate Unix principles since while offer small programs do not offer any decent IPCs (just cut&paste) and programs can't be composed by end users. Some decide again for the cheap and worst, like IBM, back with TUIs and even more limited and limiting systems. That GUIs decide to simplify themselves again for the worst switching from flexibles PostScript and alike UI/document languages to widgets composition like a kind of dumb re-edition of Unix composition principle BUT without users control and flexibility part and still without IPCs.* After decades nowadays we call new (very old) limited and limiting Notebook UIs "advanced" (things like Mathematica or Jupyter UI, the modern web choose a new kind-of document UI using a plethora or crap instead PostScript and we still struggle to get more flexibility perhaps with less extreme complicatedness. Perhaps in another decade we will back to the classic Desktops principles having finally forgotten their original existence."
          - this is a great bit of history..
            - postscript
              - has an interesting stack-based impl..
                - "the underlying model of PS was based on a stack machine similar to the Forth programming language, which reduced the complexity of the code on the printer and the amount of memory needed to store individual graphics. The system would gather up instructions until the showpage command was issued, at which time all the instructions received since the last showpage or the start of the session were performed and the memory used by those instructions could then be released"
            - see display postscript (dps)
              - "a 2D graphics engine system for computers that uses the PostScript (PS) imaging model and language to generate on-screen graphics"
              - *has a wrapper interface to C!!*
              - NeXT computers used it
                - itself used objective-c..
          - also see https://en.wikipedia.org/wiki/NeWS
