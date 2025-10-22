;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; doom/reload to reload private config
;; c-h r r / spc q r (my alt binding)

;; doom/restart-and-restore spc q r (R in my config)
;;   - not sure of another way to reset to the original run-time state..

;; NOTE: this file serves as a play-ground for LISP~~!!

;; eval line/region
;; spc o r
;;   - open repl
;; spc e / spc l e
;;   - to quickly try something

;; search through functions
;; spc l g f

;; TODO: spc l for elisp is all fucked up :/
;; so much for a good elisp env..

;; TODO: install monofoki font (on chromebook)!!



;; some TODOs from emacs.org

;; * TODO config
;; c/fix emacs gui for chromebook
;;   - wayland display error :/
;;     - i think it worked after running it via user instead of using sudo!!??

;; set-up git
;;   - i think `gh auth setup-git` doesn't work with magit.. though, there is a gh cli package: consult-gh
;;     - TODO: setup git
;;   - sync repo
;;     - TEMP: installed github desktop, so i just don't have to worry about version control
;;       - can slowly transition to magit

;; backup doom config files
;;   - TODO: create an elisp function to do this
;;     - asks you where to save it
;;       - similar to how dired-do-copy works

;; load org repo on start
;;   - TODO: merge my-programming-stuff into main notes?
;;     - TODO: currently using my-programming-stuff as my temp org folder

;; *sort m-x functions by which has been bound*
;;   - in order to make it more intuitive to learn a mode
;;   - no clue how to order them by use..
;;     - plain keys, keys with modifiers, others?

;; *try to merge doom's evil key-bindings for many other places:*
;;   - *completion in mini-buffer*
;;     - ??
;;   - *dired*
;;     - truly garbage key-bindings: ^ for up directory?? vs h/l for up/down directory
;;       - h, help
;;       - l, refresh/relist
;;   - *c-x*
;;   - *org*
;;   - c-c?
;;     - slowly..
;;   - etc.

;; *compare 'n combine meow/default and doom key-chords*

;; update org tags: TODO, OKAY, YES, etc.











; NOTE: added by me!
(defun ra/post-config ()
  ; called after doom's defaults


    
  ;; ERRORS and TEMPorary FIXes:

  ;; FIXME: something wrong with nongu elpa..
  ;; from log: fatal: ambiguous argument 'HEAD': unknown revision or path not in the working tree.
  ;;(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3") ;; nope, breaks everything..

  ;; FIXME: error on ws-butler-mode..??
  ;; did emacs partially update..?? :/
  ;; look for this in the ~/.doom.d/
  ;; i temporarily commented it out..
  ;; (use-package! ws-butler

  
  ; FIXME: TEMPFIX: i dunno why this began turning on..
  (global-whitespace-mode -1)




  ; turn off some shit i don't use
  ; maybe better to start a fresh config, lol..

  ; spc-h-b-i
  ;   - TODO: can check minor modes here and turn them off..
  ;   yas-snippet
  ;   outline-minor-mode

  ; TODO: turn off perspective mode? i don't even have bindings for it..
  ;   - does tab-bar rely on it..??
  ;(persp-mode)
    ; "named collection of buffers and window configs"



  ; some basic, core editor stuff

  ; can add shortcuts to spc-t key-map
  ; (as most of these already exist there)

  (setq default-directory "/home/ra/my-stuff/repos/")
    ; NOTE: running doom with sudo would make ~/ == /.root/

  ; try to remove all pop-up delays
  (setq meow-keypad-describe-delay 0)
    ; makes it feel wayyyy more snappy!! :D
    ; TODO: still a funky delay when i change buffer using the keypad as opposed to direct key-binding..
    ; TODO: still have a delay for c-x, c-c..
    ;   - i can't find this under vars.. :/

  ;; see other vars listed in CUSTOMIZATIONS.org
  ;; meow-expand-hint-remove-delay ;; i think the number hint..
  ;; meow-use-clipboard ;; use system clipboard

  (setq which-key-idle-delay 0.1)
    ; used by doom for key-binding pop-ups


  (+global-word-wrap-mode) ; vs toggle? or run global-word-wrap-mode after done loading all buffers..??
    ; spc-t-w

  ;(doom/increase-font-size ())
    ; children/elderly mode
      ; spc-t-b - big font mode
    ; maybe can help with focus..? or maybe too big..



    ; these require a module
    ; make sure it's not commented out in init.el

  (+zen/toggle-fullscreen)
    ; NOTE: doesn't affect when run in terminal
    ; ahhhh, peace and emacs.. :3
    ; also nice to have space for the pop-up bindings menu
    ; spc-t-z/Z

  (tab-bar-mode)
    ; new: still testing
    ;   - TODO: doesn't save upon exiting / quicksave
    (desktop-save-mode 1)
    ;  - my attempt to save tabs upon close
    ;  - fucks up full-screen / zen on start..
    ;  FIXME: is this toggling whitespace-mode for some reason!!??

    ; takes very little space.. nice!!
    ;
    ; might not need to do this, it may show up after you create a second tab
    ;
    ; this doesn't seem to be neither a perspective nor workspace..
    ;   - each tab represents a named persistent window config of it's frame
    ;     i.e. how that frame is partitioned into windows and which buffer is displayed in each window
    ;     - okay, this actually may be what i wanted after all!!
    ;       - one tab for emacs config, one for notes, one for work
    ;
    ; maybe there's a toggle workspace bar..??
    ; workspace/cycle seems quite useful..
    ; totally different concept: think workspaces in vs-code!!
    ;   - it's for different projects
    ;
    ; then what about projects..? good lord, lol
    ;
    ; shortcuts are fucked up in meow :(
    ; c-x t =/= meow c-x t (transpose lines)
    ;
    ; really need bind tab-next
    ;   - ah well, time to use the touch-pad for something!

  ; workspaces seem fine too, and already binded by meow..
  ; it's just lacking a persistent display..


  ; TODO: not sure what happened to treemacs.. :/
  ;   - need to run doom/reload once i have internet again
  ;   - might not have enough space..??

  ; TODO: not sure what happened to parainfer.. :/


  (ra/bind-keys)


  ; TODO: TEMP: JUST TESTING IN REPL..
  ;; (meow-normal-define-key ;meow-define-keys
  ;;     '("C-SPC" . execute-extended-command) ;;  space-space is nice too, c-s = "completion", use m-s instead?


  ;;     ;; THIS IS FUCKED
  ;;     ;; it binds fine, but fucks up everything..
  ;;     ;; TODO: just see someone else's config..!! doh
  ;;     ;; NOTE: this binds whatever function C-p is bound to the next function
  ;;     '("C-p" . meow-clipboard-yank) ;; originally previous-line, not even meow-previous!
  ;;     '("C-y" . meow-clipboard-save) ;; originally yank, not even meow-save!
  ;;   ;; C-r = "meow-clipbaord-replace" ; TODO: this function is missing..

  ;;  )

  ;; TODO: see meow-var.el
  ;; this lists all of the key-board macros, which if you change, will fuck things up..
  ;; it assumes you don't alter the original emacs key-bindings..

  ;; if you do change something here, you must instead update this var:
  ;;meow--kbd-[function-name]
  ;;meow--kbd-yank-pop


  ;; this is what happens when you fuck with emacs config.. :/
  ;; and i thought nvim was terrible..!!


)

(defun ra/bind-keys ()
  ;; finally, beginning to alter meow-doom's defaults key-bindings.. it must have been really really good, as i had to immediately alter helix's, a lot!

  ;; NOTE: don't go crazy! still learning, the defaults actually have more wisdom than i do.. all hail the emacs wizards!!


  ;; see notes in [emacs.org]
  ;; TODO: merge to key-binding notes in [emacs.org]

  ;; TODO: slowly compare 'n merge my helix bindings

  ;; could un-bind backspace..
  ;; currently maps to <DEL>, which is nice for laptop keyboards


  ;; see CUSTOMIZATIONS.org


  ;; run after executing the rest of this file
  ;; (for safety?)
  ;; how does this work?? multiple threads??
  (with-eval-after-load 'meow ;; vs after! (doom macro)


  ;; TODO: figure out how to change meow's god-mode, to map spc x to c-x ? (as opposed to c-x c) and spc h to c-h ?
  ;;
  ;; alter meow keypad to use literal prefix by default instead of c-
  ;;   - maybe a good place to try asking ai for code-assist.. lol
  ;;
  ;; in meow-keypad.el
  ;; see meow-keypad-start-keys (c, h, x)
  ;;   - though, it uses a strange data structure..
  ;;
  ;; maybe in here:
  ;;      (meow--keypad-keys
  ;;       (push (cons 'control key) meow--keypad-keys))
  ;;      ((alist-get e meow-keypad-start-keys)
  ;;       (push (cons 'control (meow--parse-input-event
  ;;                             (alist-get e meow-keypad-start-keys)))
  ;;             meow--keypad-keys))



  ;; meow-keypad-meta-prefix ;; m, this was localleader (c-c c / spc-l) in doom, non-evil
  ;; meow-keypad-ctrl-meta-prefix ;; g
  ;; meow-keypad-literal-prefix ;; spc, no-modifier (because c- is the default prefix)


    ;; the leader keymap
    ;; By default, the ~mode-specific-map~ will be used as the leader keymap.
    ;; In practice, this means that your leader keybinds get stored under
    ;; ~C-c~ and can be accessed as such. Therefore, for instance, ~C-c x~
    ;; and ~SPC x~ are identical.

    ;; This can be changed by setting ~meow-keypad-leader-dispatch~.

    ;; some examples
    ;; (setq meow-keypad-leader-dispatch "C-x") ; Dispatch to the keymap at C-x
    ;; (setq meow-keypad-leader-dispatch ctl-x-map) ; Dispatch to the ctl-x-map







  ;; first un-bind some shit..?

  ;; KEYS TO UN-BIND GO HERE!!

  ;; TODO: try it
  ;; (undefine-key! ; couldn't find a function in meow, so using this alias of general-unbind
  ;;
  ;; )



    ;; originally X is meow-go-to-line, but it also binded to Q..
    ;;   - TODO: what the.. two bindings..?? un-bind both!!

    ;; TODO: just unbind C-=, will never find that..!

    ;; TODO: might actually want to un-bind j/k, to rid the habit.. and begin using n/p
    ;;   - i have no idea what it originally was..


    ;; can un-bind nearly all f-keys, leaving f1 and possibly f10
    ;; though, other f-keys maybe will be used to toggle stuff by doom emacs..
    ;;
    ;; f1
    ;;   - help
    ;; f2
    ;;   - 2-column split..??
    ;;     - TODO: i dunno about this one..
    ;; f3
    ;;   - macro start
    ;;     - makes sense, as it can't be a normal key..
    ;;     - but with key-chords.. no need..??
    ;; f4
    ;;   - macro play?
    ;; f10
    ;;   - gui right-click menu



   ;; NOTE: nope, don't fuck with emacs' original bindings, bad things will happen

   ;; some emacs original bindings i don't use..
   ;; however, i should use them for insert mode!!
   ;;   - notably all bound to c- modifier
   ;;   - so.. kept for consistency across both modes..
   ;;   - ..and mini-buffers
   ;;   - i think keeping this prevents the madness that evil bindings has to go through... just gotta stick with it, don't fight it
   ;;     - also, if you change the keyboard layout, it's a good thing, as it's mneumonic, as opposed to whatever's on the home-row

   ;; main movement:
   ;; c-n/p = next/previous-line
   ;;   - j/k = meow-next/previous
   ;; c-f/b = forward/backward-char
   ;;   - l/h = meow-left/right

   ;; c-j is similar to ret +electric
   ;; c-k kill-line
   ;;   - already have s for meow-kill instead
   ;;   - m-k kill-sentence
   ;;     - kills up to .
   ;;     - an alt for f . s
   ;; c-l recenter-top-bottom
   ;;   - i don't use this, but maybe i should..??
   ;; c-h = help keymap
   ;;   - might be complicated to un-bind c-h, yet keep the menu.. :/

   ;;
   ;; c-w = kill region
   ;;
   ;; c-i = TAB (from <tab> key)
   ;;   - interesting.. indent, no need for a whole key, lol
   ;;     - it even feels more ergonomic!!
   ;;     - but still need tab for a bunch of other functions.. so just makes sense for insert-mode
   ;;
   ;; c-s = isearch-forward
   ;;   - i much prefer spc-s-s +default/search-buffer
   ;;   - but still very useful, just going to the next one..
   ;;     - doesn't feel very interactive..??
   ;; c-r = isearch-backward
   ;;   - TODO: now this is confusing!!
   ;;   - honestly should use shift modifier more..
   ;;     - ahhhh, but can't.. terminals..
   ;;     - m-s?
   ;;       - brings up some another search menu.. :/
   ;; c-m-s/r = regex search
   ;;   - now that's a good use of meta!
   ;;
   ;; TODO: c-o vs c-j vs <ret> ??
   ;; open-line vs electic-newline-and-maybe-indent










   ;; how to bind keys (from docs)
   ;; (meow-define-keys
   ;;   'normal ;; 'STATE ; see list of states/keymaps above

   ;;   ;; bind to a command
   ;;   '(\"a\" . meow-append)
   ;;   '("U" . undo-fu-only-undo ) ;; NOTE: TODO: use capital letter, not S-u ?? yet you can do C-S-u??

   ;;   ;; bind to a keymap
   ;;   (cons \"x\" ctl-x-map)
   ;;   ; binds spc-x to spc-x-map

   ;;   ;; bind to a keybinding which holds a keymap
   ;;   '(\"c\" . \"C-c\")

   ;;   ;; bind to a keybinding which holds a command
   ;;   '(\"q\" . \"C-x C-q\"))"

   ;; more examples from keybindings_QWERTY.org
   ;;   (meow-leader-define-key ; NOTE: this is a shortcut function to define leader state (C-c) not keymap (spc)
   ;;    ;; SPC j/k will run the original command in MOTION state.
   ;;    '("j" . "H-j")
   ;;    '("k" . "H-k")
   ;;    '("1" . meow-digit-argument)
   ;;    '("/" . meow-keypad-describe-key)
   ;;    '("?" . meow-cheatsheet))

   ;; some personal examples, quite confusing..
   ;;'leader ; NOTE: defaults to c-c.. from var mode-specific-map
   ;;   - don't know how to get to c-x ?.. :/
   ;;'("x b" . consult-buffer) ; c-c x b / spc-c x b
   ;;'("b" . consult-buffer) ; c-c b / spc b
   ;;'("SPC x b" . consult-buffer) ; spc spc x b

   ;; list of states
   ;; (defvar meow-keymap-alist
   ;;   `((insert . ,meow-insert-state-keymap)
   ;;     (normal . ,meow-normal-state-keymap)
   ;;     (keypad . ,meow-keypad-state-keymap)
   ;;     (motion . ,meow-motion-state-keymap)
   ;;     (beacon . ,meow-beacon-state-keymap)
   ;;     (leader . ,mode-specific-map))
   ;;   "Alist of symbols of state names to keymaps.")








   ;; BEGIN KEY-BINDINGS

   ;; WARNING: DO NOT FUCK WITH EMACS's MAIN ORIGINAL BINDINGS
   ;; many of meow's functions are merely macros to another function, especially the most popularly used functions / key-bindings in emacs. Changing them can break meow's key-bindings (macros).
   ;;   - i think this was done to keep compatibility with the massive amount of major and minor modes with different key-bindings, without changing everything
   ;;     - (evil's key-bindings fights this notion, thus requiring it to create a bunch bindins for each plugin)
   ;; if you do change them, you must update the associated meow--kbd-[key] (use  auto-complete to see them, or check [meow-var.el])

   ;; WARNING: from the beginning of TUTORIAL.org
   ;; Meow will find underlying commands based on keybindings. You may find abnormal behaviour if you changed some default keybindings.  For example: forward-char on ~C-f~ is used by ~meow-right~. If you changed this keybinding, you have to change variable ~meow--kbd-forward-char~ to the correct value.






  (meow-define-keys
   'normal ; if you use 'meow-define-keys
   'insert ; TODO: this doesn't work..
           ; TODO: how to replacement macro or goto in lisp?
           ; TODO: does insert-mode use m- to trigger normal-mode c- bindings??
   



   ;; a few things first..
      '("M-u" . vundo ) ;; Braid TODO: maybe need pop-up menu for mark/diff-vundo
   ;;   - how could this not be bound..??
   ;;   this is very meta..




   ;; MOVEMENT
   ;;  - keeping movement consistent across normal and insert modes for now..

   ;; TODO: i quite miss this basic movement on c-j/k..
   ;;   - must fight.. the.. temptation..!!
   ;; NOTE: but, as these aren't mneumonic, they wouldn't translate well to other keyboards anyway..
   ;;'("C-j" . forward-paragraph )
   ;;'("C-k" . backward-paragraph )
   ;; FIXME: k breaks a crucial emacs key-binding..
   ;; s is running backward-paragraph
   ;;   - meow-kill seems to have changed to backward-paragraph??
   ;;     - ahh, it re-maps the function at C-k, not the key
   ;;       - meow-kill is somehow liniked to the kbd macro bound to C-k
   ;; must re-set meow--kbd-kill-line to the new binding with kill-line



   ;; default was transpose text left/right, which is an interesting function.., but doesn't match M-down/up = page down/up, or the general theme of cursor movement (and selection with shift-modifier) for arrows
   ;; these are classic emacs bindings, so i mapped it to the key-bindings instead
   ;; M-<down>/<up> = page down/up ;; NOTE: this works really well
   ;;   - NOTE: maps to <next>/<prior> ??
   ;;     - don't fuck with it..
   ;;   - could use meow-page-down/up
   '("M-<left>" . meow-back-symbol ); C-a, doom/backward-to-bol-or-indent alts: beginning-of-line, beginning-of-line-text
   '("M-<right>" . meow-next-symbol ) ; C-e, doom/forward-to-last-non-comment-or-eol alt: end-of-line

   ;; TODO: missing a really cool drag-stuff-down/up/left/right here..
   ;;   - supposed to be on c-down/up..
   ;;   - this is an improvement over transpose functions (c-x t, c-x c-t, m-t, c-m t)
   ;;   - m-up/down in vs-code


   ;; C-M-<right>/<left> moves by sexp
   ;; C-M-<down>/<up> scroll-left/right ;; strange binding, but useful..
   ;;  - can instead use c-x >/<
   '("C-M-<up>" . begin-of-defun )
   '("C-M-<down>" . end-of-defun ) ;; c-m-end, this works for moving by function, unlike inner/outer/end/begin-thing which all get stuck
   ;;   - TODO: FAIL: FIXME: seems to be mapped to C-<next>.. which itself is mapped to a disabled function.. :/


   ;; use emacs-style insert-mode c-npfb (no selection, just move/jump cursor)
   ;; fb seems binded correctly (char, c-word, m-symbol, c-m-exp)
   ;; can choose consistentcy with insert mode:
   ;; c-n = next-line
   ;; c-p = previous-line
   '("M-n" . forward-paragraph ) ;; sp-next-sexp
   '("M-p" . backward-paragraph ) ;; sp-previous-sexp
   ;;   - NOTE: my preferred way of moving around
   ;;   - also excellent with shift selection
   ;;   - TODO: create next/previous function if not fallback to page down/up
   ;; or more options for normal mode..
   ;; '("C-n" . forward-paragraph ) ;; not bound! PERFECT!!
   ;; '("C-p" . backward-paragraph )
   ;; '("M-n" . meow-page-down ) ;; sp-next-sexp
   ;; '("M-p" . meow-page-up ) ;; sp-previous-sexp
   ;;    - i'd rather not fuck with emacs bindings for such little gain..
   ;; C-M-n/p = next/prev exp ;; NOTE: this is a GREAT way to move around, it has some advanced behavior, jumping from identifiers within an expression, to expressions, to entire functions


   ;; in helix, i (ab)used c-hjkl
   ;; TODO emacs uses these on some bullshit..
   ;; C-j = "page_down" # C-f, C-d; NOTE: goto_window_top by default
   ;; C-k = ["page_up", "goto_window_top"] # C-b, C-u
   ;; C-h = "goto_first_nonwhitespace" # gh # NOTE: does not select by default, use H/L key-maps
   ;; C-l = "goto_line_end"  # gl;


   ;; # C-S-k = "kill_to_line_start" # NOTE: currently conflicts with buffer/pane mappings
   ;; don't actually have anything for this..



   ;; TODO: jump backward/forward
   ;;   - maybe not "jump".. TODO: +vertico/jump-list is really good though..
   ;;   - ask ai
   ;;   - there's bookmarks (c-x r m)... not in spc menu
   ;; in helix (or did i bind these..??), uio for jump-list movement, to match jk # TODO: i don't use these much, can be moved to []
   ;; meow's z is pop-selection, not quite jump..
   ;; Z is free
   ;; TODO: un-bind c-z suspend-frame (minimize program instance)
   ;; default: C-, and C-M-,
   ;; hmmm, not sure where to put this..
   ;; from helix:
   ;; NOTE: M-]/[ on chrome os is used by the windows manager
   ;; emacs has mysterious bindings here..
   ;; "C-[" = "prev_paragraph"
   ;;   - mapped to "ESC" (as opposed to <escape>.. :/)
   ;; "C-]" - "next_paragraph"
   ;;   - abort-recursive-edit??
   ;; "C-S-[" = "jump_backward"
   ;; "C-}" = "jump_forward"







   ;; for completeness' sake

   ;; delete
   ;; d = meow-delete
   ;; D = meow-backward-delete
   ;; '("C-d" . meow-backward-kill-word ) ;; doom/delete-backward-word, backward-kill word (affects kill-ring?) TODO: over-rides d, it must be used by a keyboard macro..
   ;;   - meow--kbd-delete-char = C-d
   ;;   - well, maybe it's better to have consistency across normal and insert modes..
   '("M-d" . meow-backward-kill-word ) ;; symbol, default: kill-word
   ;; meow-beacon-kill-delete ;; delete all selections.. not sure how it would differ from s..

   ;; TODO: merge with above, as i want to keep the modes consistent..
   ;; C-d = "delete_char" # forward, default
   '("C-S-d" . meow-backward-delete ) ;; to match D, alts: backward-delete-char, backward-delete-char-untabify
   ;;   - TODO: no need for -untabify..?
   ;;   - NOTE: can be re-binded further down this config.

   
   ;; NOTE: leaving backspace alone, which maps to <DEL> (use "DEL"), as it may be used in various ways.. and behaves differently

   ;; backspace = backward-delete-char-untabify ;; default
   ;; C-backspace = backward-kill-word ;; default
   ;; '("C-DEL" . meow-backward-kill-word ) ;; default: backward-kill word (affects kill-ring?), alts: doom/delete-backward-word
   '("M-DEL" . meow-backward-kill-symbol ) ;; default: backward-kill-word
   ;; C-S-backspace = kill-whole-line ;; strange default.. but okay!..
   ;;   - backspace always goes back

   
   ;; some ideas from my helix config found under insert-mode
   ;;
   ;; use c/m-backspace for these..
   ;; # C-w = "delete_word_backward" # default is inverted
   ;; C-S-w = "delete_word_forward" ;; NOTE: currently close-buffer
   ;; C-b = "delete_word_backward" # an extra key that makes sense
   ;;
   ;; emacs defaults:
   ;; C-w = kill-region ;; default, meow replaces this with s (meow-kill)
   ;;   - "{Kill ("cut") text between point and mark."
   ;;   - not sure what this does when a region isn't selected..
   ;; M-w = kill-ring-save ;; default
   ;;   - NOTE: notably not mneumonic..
   ;;   - s for save used by search




   
   

   ;; ideas from my helix config



   ;; spc-m-x is too long
   ;; m-x is what i should be using..
   ;;   - with the right-side key
   ;;  - FIXME: these only get binded for normal-mode, not insert-mode..
   ;;    - though, surprisingly, i see no strange other behavior doing it this way..
   ;;  - NOTE: should update time delay between the pop-up menu..
   ;;  - TODO: set vs setq (queue? of symbols?)
   ;;  - TODO: try using right-meta with index/pinky and press x with left thumb
   ;;    - though, i feel like c/m-space makes sense..
   ;;    - TODO: ask how people press these keys (which fingers, comfortably)
   '("M-SPC" . execute-extended-command)
   ;;  - TODO: originally cycle-spacing
   ;;    - actually an interesting command..
   ;;  - NOTE: in insert-mode, meow binds M-spc to the leader menu..
   ;;  - FIXME: used by objed plugin: objed-activate
   ;;  - bound to : in vim/helix
   '("C-SPC" . "C-x") ;; space-space is actually AWESOME(!!), c-spc = "completion", use m-spc instead?
   ;;  - in meow, spc-spc dispatches c-spc
   ;;  - TODO: it's still c-x ? instead of c-x ?.. :/
   ;;  - TODO: originally set-mark-command








   ;; buffer nav sucks
   ;; c-x right/left
   ;; ooooh shit, found out it's bound to f1/f2!! that's not bad..
   ;;   - just try practicing using c-x instead of spc-x
   ;; # c-,/. for next/previous buffer?
   ;;   - meh, can't think of anything.. okay for now..
   ;; TODO: should have many of these key-pairs to cycle next/previous




   ;; display management (buffer/windows/tabs)
   ;; a lot of these are stuffed in the c-x menu, which i don't enjoy..
   ;;   - TEMP: i consider these bindings a temporary crutch..
   ;; in helix, i used C-S-hjkl, but here, i use C-S-npfb, to stay consistent with emacs classic bindings
   ;; NOTE: FUCK, C-S-npfb is need to move AND select stuff
   ;;   - reverted back to my old helix bindings (hjkl)
   ;; NOTE: can always use the mouse for tabs
   ;; NOTE: can abuse c-s modifier here via GUI and good contemporary terminal apps
   ;; FIXME: TODO: nope, doom even uses these!! check for existing bindings!!
   ;; can check doom's +emacs-bindings.el
   ;; TODO: could try capslock-[key] (<escape>-[key])
   ;; can try using the F-keys
   ;;   - doom may use this to toggle various modules (tree, mini-map, debug, etc.)
   ;;   - next/previous buffer seems to already be binded to f2/f1
   ;; also could create a menu for all display management
   ;;   - should try to fit into the original c-x
   ;;   - the original way may be the way to go after all.. lol
   ;; TODO: c-x t/T switch tab (instead of c-x t ret)

   ;; q > k > w > c by feeling

   ;; the emacs way
   '("C-S-j" . next-buffer ) ;; n
   '("C-S-k" . previous-buffer ) ;; p
   '("C-S-w" . kill-buffer ) ;; k NOTE: thankfully triggers mini-buffer search
   ;;  - c-x K / spc-x-K is hella annoying!!

   ;; C-S-n = ":new" # :n
   ;;   - use spc-f-f instead, and create a new file
   ;;     - it's just a buffer until you save it.. then it creates a file
   ;;   - c f x = scratch buffer
   ;;     - doesn't show up on filtered buffer list


   ;; c-x 2/3 is so weird.. def need to rid these old emacs bullshit!!
   ;;   - though, i am indeed running out of keys here.. so maybe it's not as bad after all..
   '("C-S-v" . split-window-right ) ;; c-x 3, maybe from helix's defaults
   '("C-S-s" . split-window-below ) ;; c-x 2
   '("C-S-c" .  +workspace/close-window-or-workspace) ;; close/quit windows, not kill (as you're not actually killing anything..)
   ;; a ton of alts:
   ;; +workspace/close-window-or-workspace (c-x 0?)
   ;;   - quit-window
   ;;   - delete-window (c-x 0)
   ;; meow-quit
   ;;   - "kill buffer or window"
   ;;     - seems to kill buffers and not quit window..??
   ;; delete-other-windows (c-x 1)
   ;;   - this one is nice too..
   ;; kill-buffer-and-window

   '("C-S-o" . other-window ) ;; matches c-x o other-window
   ;;   - good enough for now!!
   ;;'("C-S-f" . next-window-any-frame ) ;; l, test vs next-window
   ;;'("C-S-b" . previous-window-any-frame ) ;; h
   ;;   - these weren't even binded..

   ;; NOTE: can worry about this later, once i choose workspaces vs tabs
   '("C-S-h" . tab-next ) ;; f cycles tabs?
   '("C-S-l" . tab-previous ) ;; b
   ;;  - alts: tab-last, tab-recent, tab-switch
   '("C-S-q" . tab-close ) ;; too confusing, just use mouse, don't want to do by accident..
   ;;  - NOTE: not mnuenomic
   ;;  - w matches browser ui
   ;;  - q feels too powerful, feels like it should close emacs..!!
   ;; c-x t o/O = next/previous
   ;;   - i think this is strange.. must come from other-window..


   ;; special chromebook keys <- and -> in place of f1/f2
   ;; '("<XF86forward>" . next-buffer ) ;; default
   ;; '("<XF86backward>" . previous-buffer ) ;; default
   '("C-<XF86forward>" . next-window-any-frame ) ;; test vs next-window
   '("C-<XF86backward>" . previous-window-any-frame )
   '("M-<XF86forward>" . tab-next )
   '("M-<XF86backward>" . tab-previous )





  )








  (meow-define-keys
   'normal ; if you use 'meow-define-keys


   ;; A FEW THINGS FIRST..



   ;; i quite miss helix's return key functionality, it sorta just went to the beginning of the next line.. def worth trying out..
   ;; though, in emacs, if you are in the beginning or end of line, it will continue that way too.. it's smarter
   ;; you just have to rely on c-a/e


   ;; wtf is with the redo binding
   ;; don't touch the original emacs binding on C-/
   ;; '("u" . undo-fu-only-undo ) ;; default is meow-undo NOTE: may be a problem with undo-fu-only-undo
   '("U" . undo-redo )  ;; TODO: re-bind default U = meow-undo-in-selection
   ;;   - TODO: check/add to embark-act menus instead, especially act on region
   ;; '("U" . "C-S-/" ) ;; hmm, binding to another key didn't work either..
   ;; '("U" . "C-?" )

   ;; C-u = command-universal-argument
   ;; C-c u = meow-universal-argument




   ;; meow-comment is un-bound
   ;; this can't be right..
   ;; c-x ; = comment-line
   ;; TODO: bind to c-x ; (currently only in c-x c-;) in keypad
   ;; c-; = embark-act
   ;;   - spc-a
   ;;   - ; again to comment/un-comment region
   ;;   - act on symbol/region/expression/..?
   ;;   - okay, this is kinda amazing..
   ;;     - yeah... emacs is teh shit..
   ;; could also use / and #, both un-binded

   ;; just some extra bindings..
   ;;   - should try not to use symbols for anything
   ;;'("/" . meow-comment ) ; C-like langs, notably signified search in vim
                          ; NOTE: i left c-/ and c-s-/ alone: default undo/redo
   ;;'("#" . meow-comment ) ; ruby-like langs
   ;; alts: comment-dwim (M-;) /line/region
   ;; NOTE: neither moew-comment nor comment-dwim do anything without anything selected in elisp.. :/
   ;;   - c-x ; is actually fine.. and pairs well with embark-act c-; ;
   ;;     - it's also even in a more ergonomic location..







   ;; SELECTION
   ;;   - these notably belongs solely to normal-mode

   ;; i haven't gotten used to using meow-block, and am missing the tree-sitter based expand/contract selection
   ;; revert to vim?/helix bindings
   ;;
   ;; TODO: C-= is a terrible binding for something so useful..
   ;;   - it is an interactive function, only requires one key-binding
   ;;   - this is more useful than inner/outer/begin/end!!
   ;;
   ;;
   ;; some extra temporary bindings
   ;;'("=" . er/expand-region )
   '("+" . er/expand-region )

   ;; though should play with default meow-block some more..
   ;;'("o" . er/expand-region ) ; meow-block
   ;;'("O" . er/contract-region) ; meow-to-block highlights to next block
   ;; C-o open-line ;; TODO: might not need with return/S-ret, though slightly different functionality..
   '("M-o" . er/expand-region ) ;; this is too hard too find :/
   '("X" . er/expand-region ) ;; interesting.. default was meow-line (goto line)
   ;;  - TODO: - is used by default for er/contract-region and 0 for reset region, which both are inconvenient, though, may quit the function before ever using it.. so not too bad..
   ;;    - TODO: z doesn't do anything.. this would be the ideal binding: pop-selection


   ;; from helix:
   ;; hmmm, this one is missing, maybe similar to er/extend and contract (C-=, =/-)
   ;; though, still a little different, as helix's expanded to the semantic node's beginning and end..
   ;;
   ;; if tree-sitter
   ;; H = "extend_to_first_nonwhitespace" # c-s-a and m-s-left cover this..
   ;; L = "extend_to_line_end" # kill-line and c-s-e and m-s-right cover this
   ;; else
   ;; H = "extend_parent_node_start"
   ;; L = ["extend_parent_node_end", "extend_char_left"]
   ;;   could use C-S-H/L, currently mapped to next/prev pane
   ;;   C-i/o? C-u/b?







   ;; ideas from my helix bindings

   ;; clipboard yank 'n paste
   ;;   - TODO: NOTE: should be able to paste and cut line (since you can't select anything..) from insert-mode..
   ;; NOTE: with the amazing meow-yank-pop (P, m-y for original (consult-)yank-pop), no need, as copies to the system clipboard are saved to the kill-ring
   ;; strangely, meow-yank is paste, meow-save is copy
   ;;   - i wonder if that was the original meanings..??
   ;; this would bind C-p's function to meow-clipboard-yank.. or something
   ;; c-n/p is emac's next/previous line binding
   ;; must set meow--kbd-backward-line
   ;; '("C-p" . meow-clipboard-yank) ; previous-line (og emacs binding)
                                     ; no need for this thanks to interactive yank from kill-ring
   ;;'("C-y" . meow-clipboard-save) ; default was yank
                                  ; keep this to copy to system clipboard
                                  ; TODO: this breaks a keyboard macro used by p
   ;; meow-clipboard-kill ; cut, meh..
   ;; 'meow-use-clipboard ;; this var exists to use system clipboard, can try it out in the beginning of my config
   ;; TODO: can un-bind M-p for page-up?





   ;; END SENSIBLE DEFAULTS




   ;; lol.. i miss this little trick..
   ;; maybe have to create a function for it..
   ;; + is un-binded
   ;; - negative-argument
   ;;   - kinda like meow-reverse..??
   ;; minus = "decrement" # only A-minus is mapped to merge_selections, 'minus' not '-', for parsing reasons
   ;; '=' = "increment" # = maps to format_selections via LSP







  ) ; define-keys 'normal










  (meow-define-keys
      'insert


    
  )






  (meow-define-keys
      'leader ;; c-c

    ;; POP-UP MENU ("KEYPAD") BINDINGS GO HERE!!

    ;; examples:
    ;; '("z" . consult-buffer) ; spc-z
    ;; '("C-x b" . consult-buffer) ; spc-x b



    ;; so far so good... as i just discovered i was using the wrong key-chords the whole time..!! lmao



    '("q q" . "C-x C-c") ;; who would ever want to kill-emacs..!!?? (..without saving)
    ;'("q Q" . "C-x C-c") ;; Q seems to have the right function..

    '("q r" . doom/reload) ;; or c for config
    '("q R" . doom/restart-and-restore) ;; was doom/restart
    ;; doom/find-file-in-private-config ;; c-c f p/P

    '("o t" . +eshell/toggle)
    ;; - t is for terminal
    ;; though, likely chose e to support having multiple terminal app bindings..

    ;; TODO: could bind to ~ (tilde) to repl for the old dev console feel


  ) ; define-keys 'keypad



  (meow-define-keys
      'keypad ;; spc??

    ;; '("x" . "C-x") ;; lol nice try, but damn near broke everything with this one..

    ;;'("x <escape>" . nil) ;; FIXME: damn near broke everything!!
    ;;'("C <ESCAPE>" . nil) ;;  - and this was the one time i asked ai for help..
    ;; these bindings make it hard to <escape> doom's pop-up menus..
    ;; TODO: is this is how you bind non-modified keys??
    ;;   - try unspecified??
    ;; TODO: is this is also how you un-bind keys??
  )



   ;; (TODO: still going through my helix config..)
   ;; STOPPED AT THIS LINE IN HELIX CONFIG:
   ;; [keys.normal.space]




  ) ; with-eval-after-load
)





























;; NOTE: added by DOOM

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' ; Monofoki
;;   -- NOTE: this makes a big big difference, as emacs can display alot more in the mini-buffer for auto-complete
;;   -- NOTE: terminals have their own appearance settings
;;   -- TODO: fail, the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

;; NOTE: use consult-theme to try them all out on-the-fly

;(setq doom-theme 'doom-manegarm) ; zelda, dark forest vibes,
  ;; TODO: need to provide alt with dim comments
  ;; otherwise, this is my favorite theme
(setq doom-theme 'doom-outrun-electric) ; high-contrast, hard white text
;(setq doom-theme 'doom-solarized-dark) ; very low-contrast
;(setq doom-theme 'doom-solarized)
;(setq doom-theme 'tokyo-night) ; a classic alt between one and outrun-electric
;(setq doom-theme 'doom-one) ; doom's default, too grey

  ; solaire-mode?
  ; just removes background color tinge


  ; NOTE: can use consult-theme to try out all the themes
  ; the ones prefixed with doom- are probably a bit more vetted

  ; TODO: get aura, noctis, and jellyfish!

  ;; - TODO: port aurara
  ;;   - FINALLY, a text editor that will last the ages, and never have to port again!
  ;; - just use whatever's there..

  ;; manegarm, dark forest green, zelda vibes!!
  ;; this one's actually legit.. someone put some love into this one!!

  ; doom-outrun-electric, my favorite included theme, very high-contrast, hard, neon vibes

  ;; laserwave, neon pink, unfortunately plain text too bright
  ;; maybe not too difficult to edit it..

  ;;doom-solarized-dark, great! very low contrast, now with hot pink 'n purple!!
  ;; variants: *dark-high-contrast*, light, oksolar variants)
  ;;   - looks good here, very dim plain text, very comfy
  ;;   - dark-high-contrast version only subtley dims the background color (very good)
  ;;     - good on my shitty chromebook
  ;;   - light version is the only readable light theme i've seen.. yellow background, reminds me of a nvim theme that i liked..
  ;;   - also quite unique, the rest look like atom-material variants

  ; doom-tokyo-night, my classic fall-back
    ; between solarized-dark and outrun-electric
    ; doom-moonlight, lighter background, lighter comments, a more glowy/jellyfish feeling
    ; doom-palenight, bright background for lower contrast, too bright
    ; doom-city-lights, ??

  ; feather-dark, fun, just comments are hard to see..
    ; suffers from different header text size in org-mode
  ; doom-shades-of-purple, a bit of an overload by the bright background and purple comments..
    ; text in txt/org files are still white :/
    ; similar to adventure time
  ; ephemerel, background may be too bright, lots of use of bold is interesting.. noctis vibes

  ; doom-one, doom's default, based on atom/github theme
    ; too gray, too boring
    ; doom-vibrant, a blue-hue variant of doom-one
  ; doom-tomorrow-night, a solid upgrade from gruvbox

  ; horizon, a good monokai vaiant, except red vars and bright background

  ;; - snazzy
  ;;   - this one was rather unique on helix, plain text too bright



;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'nil) ; default was t (no quotes)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/my-stuff/repos/my-programming-stuff") ; TODO: should set to repo!!


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;;   - NOTE: TODO: maybe for my own functions...
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;;   - NOTE: TODO: can try loading from a config folder in my repo
;; - `map!' for binding new keys
;;   - NOTE: TODO: try binding keys here!!
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;   - spc-k-k/d in meow


;; NOTE: added by me!
(ra/post-config)
