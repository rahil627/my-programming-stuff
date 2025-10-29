;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a link to Doom's Module Index where all
;;      of our modules are listed, including what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).

(doom! :input
       ;;bidi              ; (tfel ot) thgir etirw uoy gnipleh
       ;;chinese
       ;;japanese
       ;;layout            ; auie,ctsrnm is the superior home row ; TODO: try other layouts!!

       :completion
       ;;company           ; the ultimate code completion backend
       (corfu +orderless)  ; complete with cap(f), cape and a flying feather!
       ;;helm              ; the *other* search engine for love and life
       ;;ido               ; the other *other* search engine...
       ;;ivy               ; a search engine for love and life
       vertico           ; the search engine of the future

       :ui
       ;;deft              ; notational velocity for Emacs
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       ;;doom-quit         ; DOOM quit-message prompts when you quit Emacs
       ;;(emoji +unicode)  ; 🙂
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW ; NOTE: doom-tokyo-night's bold colors look great!
       ;;indent-guides     ; highlighted indent columns ; NO: it's a little jarring.. i'd rather not.. much prefer the clean, un-cluttered, zen space. treemacs-indent-guides-mode is also an eye-sore, even with a beautiful theme! i'm surprised this isn't included natively..
       ;;ligatures         ; ligatures and symbols to make your code pretty again
       ;; minimap           ; show a map of the code on the side ; NOTE: spc t m, pretty neat, but i didn't see any benefit of this on a small laptop.. also, it doesn't react to org (nor code?) folding.. 
       modeline          ; snazzy, Atom-inspired modeline, plus API ; NOTE: possibly over-kill, though a mode-line has always been in emacs.. maybe even came from it..!
       nav-flash         ; blink cursor line after big motions ; NOTE: it's these small interactions that really make a difference
       ;;neotree           ; a project drawer, like NERDTree for vim
       ophints           ; highlight the region an operation acts on
       (popup +defaults)   ; tame sudden yet inevitable temporary windows
       tabs              ; a tab bar for Emacs ; NOTE: this may be over-kill, but it's pretty, and seems to be project-based TODO: test native tabs module, especially tab-line-mode
       treemacs          ; a project drawer, like neotree but cooler ; NOTE: it provides great integreation with project(tile) and workspaces, giving you a view of both, depending on what buffer you are on. otherwise, it'll still show the cwd
       ;;unicode           ; extended unicode support for various languages
       (vc-gutter +pretty) ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       ;;window-select     ; visually switch windows
       workspaces        ; tab emulation, persistence & separate workspaces ; TODO: hmmm, may be to choose between the new native tab module vs this traditional concept..?? 
       zen               ; distraction-free coding or writing

       :editor
       ;; (evil +everywhere); come to the dark side, we have cookies
       (meow +qwerty) ; seem to include a packages.el with meow in it.. ; NOTE: this package was added by me, not in doom

       file-templates    ; auto-snippets for empty files
       ;;fold              ; (nigh) universal code folding ; crucial, after using org-mode..
       (format) ; +onsave ; automated prettiness ; TODO: can try, but not +onsave!! NOTE: there's also a set of functions for lint (see GUI menu by clicking on the language in the mode-line).. what's the difference..??
       ;;god               ; run Emacs commands without modifier keys ; WARN: don't activate included within meow 
       ;;lispy             ; vim for lisp, for people who don't like vim TODO: try iy, will it bind over meow? seems like an interesting set of key-bindings.. very code-centric.. TODO: could try to generalize it..
       multiple-cursors  ; editing in many places at once ; TODO: main key-chord (c-x m) is busted by meow's keypad input (m inputs meta key)
       ;;objed             ; text object editing for the innocent TODO: very interesting new concept: object-based movement?
       parinfer          ; turn lisp into python, sort of ; TODO: try it! ..just dims parenthesis..? lmao!! that actually may be all you need.. to prevent sight paralysis
       ;;rotate-text       ; cycle region at point between text candidates
       snippets          ; my elves. They type so I don't have to ; NOTE: might include default snippets for many languages.. is this the module behind pressing [keyword] tab..??
       word-wrap         ; soft wrapping with language-aware indent

       :emacs
       dired             ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       ;;eww               ; the internet is gross ; TODO: need to (re-)compile emacs with libxml?? urgh.. sudo apt install libxml2-dev .. but i'm def not compiling emacs..!! doom already has a bunch of config flags.. see c-h v system-configuration-features to see compiler flags and linked third party libs
       ibuffer           ; interactive buffer management ; NOTE: i think this module is native to emacs, but this updates it greatly by re-organizing buffers by projects (and possibly workspaces) 
       undo              ; persistent, smarter undo for your inevitable mistakes ; TODO: vs vundo??
       vc                ; version-control and Emacs, sitting in a tree

       :term
       eshell            ; the elisp shell that works everywhere ; NOTE: can just use (async-)shell-command (m-! and m-&) and comint for interoreters instead.. then there's nothing to load.. it uses the default shell ; TODO: not sure what benefit one gets with the shell being wrriten in emacs lisp, save the consistency of being able to write all of your batch files, functions, etc. in lisp..
       ;;shell             ; simple shell REPL for Emacs
       ;;term              ; basic terminal emulator for Emacs
       ;;vterm             ; the best terminal emulation in Emacs

       :checkers
       syntax              ; tasing you for every semicolon you forget
       ;;(spell +flyspell) ; tasing you for misspelling mispelling
       ;;grammar           ; tasing grammar mistake every you make

       :tools
       ;;ansible
       ;;biblio            ; Writes a PhD for you (citation needed)
       ;;collab            ; buffers with friends ; NOTE: now what's the point of zed..??
       debugger          ; FIXME stepping through code, to help you add bugs
       ;;direnv
       ;;docker
       ;;editorconfig      ; let someone else argue about tabs vs spaces
       ;;ein               ; tame Jupyter notebooks with emacs
       (eval +overlay)     ; run code, run (also, repls)
       lookup              ; navigate your code and its documentation
       lsp               ; M-x vscode ; TODO: test vs ruby module
       magit             ; a git porcelain for Emacs
       ;;make              ; run make tasks from Emacs
       ;;pass              ; password manager for nerds
       ;;pdf               ; pdf enhancements
       ;;prodigy           ; FIXME managing external services & code builders
       ;;terraform         ; infrastructure as code
       ;;tmux              ; an API for interacting with tmux
       tree-sitter       ; syntax and parsing, sitting in a tree... ; NOTE: possibly can slow things down.. TODO: test, TODO: does it it have tree-based movements?? TODO: need to install grammars
       ;;upload            ; map local to remote projects via ssh/ftp

       :os
       (:if (featurep :system 'macos) macos)  ; improve compatibility with macOS
       tty               ; improve the terminal Emacs experience

       :lang
       ;;agda              ; types of types of types of types...
       ;;beancount         ; mind the GAAP
       (cc +lsp)         ; C > C++ == 1
       ;;clojure           ; java with a lisp
       ;;common-lisp       ; if you've seen one lisp, you've seen them all
       ;;coq               ; proofs-as-programs
       ;;crystal           ; ruby at the speed of c
       ;;csharp            ; unity, .NET, and mono shenanigans
       ;;data              ; config/data formats
       ;;(dart +flutter)   ; paint ui and not much else
       ;;dhall
       (elixir +lsp)             ; erlang done right
       ;;elm               ; care for a cup of TEA?
       emacs-lisp        ; drown in parentheses
       ;;erlang            ; an elegant language for a more civilized age
       ;;ess               ; emacs speaks statistics
       ;;factor
       ;;faust             ; dsp, but you get to keep your soul
       ;;fortran           ; in FORTRAN, GOD is REAL (unless declared INTEGER)
       ;;fsharp            ; ML stands for Microsoft's Language
       ;;fstar             ; (dependent) types and (monadic) effects and Z3
       ;;gdscript          ; the language you waited for
       ;;(go +lsp)         ; the hipster dialect
       ;;(graphql +lsp)    ; Give queries a REST
       ;;(haskell +lsp)    ; a language that's lazier than I am
       ;;hy                ; readability of scheme w/ speed of python
       ;;idris             ; a language you can depend on
       ;;json              ; At least it ain't XML
       ;;(java +lsp)       ; the poster child for carpal tunnel syndrome
       ;;javascript        ; all(hope(abandon(ye(who(enter(here))))))
       ;;julia             ; a better, faster MATLAB
       ;;kotlin            ; a better, slicker Java(Script)
       ;;latex             ; writing papers in Emacs has never been so fun
       ;;lean              ; for folks with too much to prove
       ;;ledger            ; be audit you can be
       ;;lua               ; one-based indices? one-based indices
       markdown          ; writing docs for people to ignore ; TODO: temporary, until i convert to org-mode ;)
       ;;nim               ; python + lisp at the speed of c
       ;;nix               ; I hereby declare "nix geht mehr!"
       ;;ocaml             ; an objective camel
       org               ; organize your plain life in plain text
       ;;php               ; perl's insecure younger brother
       ;;plantuml          ; diagrams for confusing people more
       ;;graphviz          ; diagrams for confusing yourself even more
       ;;purescript        ; javascript, but functional
       ;;python            ; beautiful is better than ugly
       ;;qt                ; the 'cutest' gui framework ever
       ;;racket            ; a DSL for DSLs
       ;;raku              ; the artist formerly known as perl6
       ;;rest              ; Emacs as a REST client
       ;;rst               ; ReST in peace
       (ruby);+rails)     ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"} ; NOTE: seems to include robe (connect to irb / run-time), rspec, bundler, etc.
       ;;(rust +lsp)       ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       ;;scala             ; java, but good
       ;;(scheme +guile)   ; a fully conniving family of lisps
       sh                ; she sells {ba,z,fi}sh shells on the C xor
       ;;sml
       ;;solidity          ; do you need a blockchain? No.
       ;;swift             ; who asked for emoji variables?
       ;;terra             ; Earth and Moon in alignment for performance.
       web               ; the tubes ; NOTE: html, css, etc., maybe basic js too? though the lsp impl would surely be superior..
       yaml              ; JSON, but readable
       ;;zig               ; C, but simpler

       :email
       ;;(mu4e +org +gmail) ; TODO: e-mail in org-mode?? this may be the only way i get through thousands of emails!!
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       ;;calendar
       ;;emms
       ;;everywhere        ; *leave* Emacs!? You must be joking
       ;;irc               ; how neckbeards socialize
       ;;(rss +org)        ; emacs as an RSS reader

       :config
       ;;literate
       (default +bindings +smartparens)) ; NOTE: needed for meow

