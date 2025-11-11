;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

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


;;; some helpful bindings..
;; doom/reload to reload private config
;; c-h r r / spc q R (my alt binding)

;; doom/restart-and-restore
;;   - spc q r
;;   - not sure of another way to reset to the original run-time state..

;; backup doom config files
;;   - c-c f C
;;     - doom/copy-this-file
;;     - TODO: until i create a function for this..


;;; NOTE: this file serves as a play-ground for lisp~~!!

;; eval line/region
;; spc o r
;;   - open repl
;; spc l e / spc e
;;   - to quickly try something

;; spc l g
;;  - introspect (via search engine) through libs, functions, vars







;; use FOCUS EDITOR to FOCUS, emacs is a deep deep rabbit-hole!!
;;   - alternatively, use textbringer (emacs vanilla, but in ruby!!)

;; change file associations to focus editor





;; FIXME: WARNINGS
;; ⛔ Warning (org-element): ‘org-element-at-point’ cannot be used in non-Org buffer #<buffer _TODO-apps-to-make.org> (fundamental-mode)
;;
;; Undo-Fu-Session discarding: file length mismatch for "/home/ra/.emacs.d/lisp/doom-editor.el"
;; 
;; Could not read ‘org-id-locations’ from /home/ra/.emacs.d/.local/cache/doom-docs-org-ids, setting it to nil
;; File local-variables error: (user-error Not in a valid workspace (nil))








;;; TODO: list

;; change file associations to focus editor or textbringer

;; ra/ vs ra- for functions and vars? then re-factor
;;   - i think vanilla emacs auto-added '-' for ou when you inserted a space during m-x

;; found this tidbit elsewhere.. just check it..
;; https://www.reddit.com/r/HelixEditor/comments/1b9gpz9/three_things_that_helped_me_make_the_switch_to/
;;   - an emacs user switches to helix and mentions some good plugins

;; FIXME: kill-line kills visually, it misses word wrap.. and i like my word wrap!!

;; is '+package-name/function' standard naming convention in emacs..??


;; TODO: figure out a neat way to combine insert-mode and normal-mode bindings, without having to resort to a top-level defun
;;   - defun in defun works..
;;   - my lisp-fu failed me.. need to understand &rest...

;; load org repo on start
;;   - TODO: merge my-programming-stuff into main notes?
;;     - TODO: currently using my-programming-stuff as my temp org folder

;; re-sort key-bindings by letters first, special keys, symbols, numbers last

;; *sort m-x functions by which has been bound*
;;   - in order to make it more intuitive to learn a mode
;;   - maybe expensive to do every-time you open it..
;;   - no clue how to order them by use..
;;     - plain keys, keys with modifiers, others?

;; *compare 'n combine meow/default and doom key-chords and leader keys*
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






;; TODO: merge this, from another file..
;; todo list for doom emacs
;;   - aka make emacs my home
;; set org dir
;;   - need to do this in order to link org files
;;   - is it possible to have multiple org dirs?
;;   - otherwise, should set the org dir to the parent repos folder?
;;   - or maybe create a new folder, with all the notes repos?
;; org id?
;;   - set org-id-link-to-org-use-id
;; re-map/bind keys
;;   - NOTE: do after setting up/trying meow bindings
;;     - still prefer a lot of evil bindings, especially for things like dired, navigation in the mini-buffer, etc.
;;     - really miss the / and : vi bindings
;;       - m-x is terrible
;;       - v, (spc s s/d), c-s/r and c-m-s/r is ridiculous.. though indeed all different.. lol
;;         - maybe just need to master regex..
;;         - focus editor's search is great: toggles for match case and two other things..
;; edit the welcome screen
;;   - add spc-f-f
;;   - add spc-g
;; try to setup doom emacs on *everything*
;;   - NOTE: would require a key-board..
;;     - take an apple keyboard instead of chromebook?
;;   - chromebook
;;     - i really do like this keyboard.. and the battery life is incredible, and it costs nothing... easy to throw around, charge in public places, and not worry about..
;;       - the giant control, alt, and caps lock keys work really well, and are simple to bind via chromeos settings
;;   - ipad mini 2
;;   - android obamaphones
;;     - heard it has a very good (and free!) terminal app..
;;   - iphone 7
;;   - iphone SE
;;     - likely not enough battery


;; only happens to one file..
;; ⛔ Warning (org-element): org-element--cache: Org parser error in _TODO-apps-to-make.org::1165. Resetting.
;; The error was: (wrong-type-argument integer-or-marker-p nil)
;; Backtrace:
;; "  backtrace-to-string(nil)
;;   org-element-at-point()
;;   org-at-item-p()
;;   org-indent-add-properties(#<marker at 1 in _TODO-apps-to-make.org> 7101 (0 2 0))
;;   org-indent-initialize-buffer(#<buffer _TODO-apps-to-make.org> (0 2 0))
;;   org-indent-initialize-agent()
;;   apply(org-indent-initialize-agent nil)
;;   timer-event-handler([t 0 0 200000 t org-indent-initialize-agent nil idle 0 nil])
;; "














    
  ;;; ERRORs and TEMPorary FIXes:

  ;; TODO: merge doom trouble-shooting notes from emacs.org

  ;; doom
  ;;   - runs help

  ;; doom-sync
  ;;   - this one is quick..

  ;; doom sync -u
  ;;   - this re-fetches all, takes longer, < 1 min

  ;; doom sync --rebuild && doom sync -u
  ;;   - re-builds all packages, 8 mins on an ancient chromebook
  ;;   - watch out!.. can break everything if it doesn't complete..

  ;; doom sync -gc
  ;;   - used to be 'doom purge'
  ;;   - can do this once in a while to clean shit up..
  ;;   - removes packages repos and "grafts" them..?
  ;;   - compacts package repos?
  ;;     - in case you're low on space..
  ;;     - but in my experience, barely any was saved.. 40mb


  ;; for common errors about packages:
  ;;   - https://github.com/doomemacs/doomemacs/issues/7482
  ;;     - "For me, usually a combination of these commands usually works. Sometimes I'll need to repeat these multiple times"
  ;; doom sync -u
  ;; rm -rf ~/.config/emacs/.local/straight/repos/[repo-with-error]


  ;; in addition to the above, other things to try:
  ;; doom env clear
  ;;   - can rebuild with doom env
  ;; (setq native-comp-jit-compilation nil) ;; just eval this while trouble-shooting, don't un-comment!
  ;;  - temporarily turn off native comp








  ;; NOTE: the following errors all fixed themselves after breaking my build via doom rebuild failing, then fixing it by running doom sync

  ;; FIXME: TODO: i accidentally renamed the git remote uri "y" for the dirvish (code-folding) package

  ;; ~doom first hook error git-commit
  ;; user-error: Error in a Doom startup hook: doom-after-init-hook, doom-run-first-hooks-if-files-open-h, (doom-hook-error doom-first-file-hook global-git-commit-mode (file-missing "Cannot open load file" "No such file or directory" "cond-let"))
  ;; Error: failed to incrementally load git-commit because: (file-missing Cannot open load file No such file or directory cond-let)

  ;; something wrong with nongnu package..
  ;; from log: fatal: ambiguous argument 'HEAD': unknown revision or path not in the working tree.

  ;; error on ws-butler-mode..??
  ;; did emacs partially update..?? :/
  ;; look for this in the ~/.doom.d/
  ;; i temporarily commented it out..
  ;; (use-package! ws-butler
  ;; TODO: ensure i un-commented this..

  ; TEMPFIX: i dunno why this began turning on..
  ;(global-whitespace-mode -1)










;;; NOTE: added by me!
(defun ra/load-config ()
  ; called after doom's defaults
  (ra/init-config)
  (ra/bind-keys)

)

(defun ra/init-config ()

  
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



  ;; my config vars
  ;;
  ;; used to copy config files (from elsewhere to local install)
  ;; NOTE: trying to edit from a repo, so that it shows up in version control
  ;; this is at the cost of having to run a copy function every-time you change the config
  ;; it could also used to sync upon (re-)start!
  ;;   - which is i what must do when i change the config anyway..
  ;;   - this is significant, considering emacs replaces linux for me, the equivalent of a dotfiles folder
  (set 'ra-my-config-dir-path "~/my-stuff/repos/my-programming-stuff/configs/doom emacs/")

  ;; (ra/copy-config-to-local-install 'ra-my-config-dir-path)
  ;;   - TODO: not sure where or how to run this while this file is being executed..


  

  ; some basic, core editor stuff

  ; can add shortcuts to spc-t key-map
  ; (as most of these already exist there)

  (setq default-directory "/home/ra/my-stuff/repos/")
    ; NOTE: running doom with sudo would make ~/ == /.root/
    ;   - i'm guessing this was to fix that..
    ;   - but i don't see much reason for this, as the dir changes automatically to wherever the current buffer is located..
    ;   - maybe from the splash screen..?


  ;; (auto-save-default t) ; d: nil?

  ;; (after! desktop
  ;; (desktop-save-mode 1))
  ;; TODO: try this when autosave and manual save are fucking up
  ;; TODO: add more autosaves
  ;; savehist-autosave-interval 300 ; d: 300
  ;; doom--shut-up-autosave-a  ;; lol, classic henrik

  
  (setq display-line-numbers-type nil) ; t, nil, relative

  ;; (toggle-frame-fullscreen) ; ahhhh, peace and emacs.. :3
                                        ; also nice to have space for the pop-up bindings menu
                                        ;   - nahhh, prefer my windows, full-screen is too much.. feel confined.. within a window, it feels like notepad! and not a massive IDE!! :D
                                        ;   - prefer a pasge-like window in the middle of the screen


  
  ;;(scroll-bar-mode)
  ;;   - TODO: would be nice, but looks hideous!! :/
  ;; (setq x-toolkit-scroll-bars nil) ;; nope, didn't work..
  ;;   - i think chromeos's "gtk" is the problem

  ; workspaces seem fine too, and already bound by doom..
  ; TODO: it's just lacking a persistent display..
  ;   - i tried to display workspace in the modeline further below to no avail..
  

  ;; (global-tab-line-mode)
  ;;   - 1 tab for each buffer
  ;;     + tiny buttons to scroll right/left
  ;;   - standard to emacs
  ;;   - tiny amount of space too..
  
  ;; (global-tab-bar-mode)
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





  

    ;; these require a package/module
    ;; make sure it's not commented out in init.el
    ;; use describe-package to check if there's a package for it
    ;;   - c-h p

  ;; NOTE: (after! package ... ) package uses the symbol-name (un-quoted)
  (after! org
  (setq org-directory "~/my-stuff/repos/my-programming-stuff")) ; It must be set before org loads!
                                        ; 


  
  ;; meow
  ;; see other vars listed in CUSTOMIZATIONS.org
  ;; meow-expand-hint-remove-delay ;; i think the number hint..
  ;; meow-use-clipboard ;; use system clipboard

  ; try to remove all pop-up delays
  (after! meow
  (setq meow-keypad-describe-delay 0))
    ; makes it feel wayyyy more snappy!! :D
    ; TODO: still a funky delay when i change buffer using the keypad as opposed to direct key-binding..

  (after! which-key
    (setq which-key-idle-delay 0.1) ; used by doom for key-binding pop-ups
    
    ;; TODO: show all keys (instead of pages)
    (setq which-key-show-remaining-keys t) ; FIXME: nope, not doing what i want..
    )

  (after! word-wrap-mode
  (+global-word-wrap-mode)) ; vs toggle? or run global-word-wrap-mode after done loading all buffers..??
    ; spc-t-w





  
  
  

  (after! doom-modeline  
  (setq doom-modeline-workspace-name t) ;; FIXME: hmm not working..??
  ;; (setq doom-modeline-project-name t) ;; no need, as the file-name expands
  ;; (setq doom-modeline-hud nil) ;; not sure..
  ;; (setq doom-modeline-icon nil) ;; TODO: a more classic ascii feel.. or maybe just get rid of nerd icons..
  ;; 
  ;; (display-time-mode t)
  ;; (setq doom-modeline-time t) ;; FIXME: though time isn't important..
  ;; Error during redisplay: (eval (doom-modeline-segment--time)) signaled (error "Invalid image type ‘svg’")
  )
  
  ;; (after! writeroom-mode
  ;; (+zen/toggle-fullscreen))
    ; NOTE: doesn't affect when run in terminal
    ;   - doesn't do much in gui either..
    ; alias for writeroom-mode?
    ; just increases font size..?? :/
    ; spc-t-z/Z

  


  (use-package! good-scroll ; actually god-send, a HUGE difference in feeling, welcome to the 1990s, emacs!
    :init
    (setq good-scroll-duration 0.15 ; the further you step, the quicker you'll want this
          good-scroll-step 200) ; d: 80 = ~3 lines, 200 = 12 lines
                                ; 
                                ; 0.15 * 200 = EXACTLY 200 lines on my tiny touch-pad, from top to bottom!!
                                ; (note: these values are for my shitty chromebook's touchpad)
    :config
    (good-scroll-mode))



  
  ;; testing centaur-tabs
  ;;  - i customized it, and now it looks like native tabs! lol
  ;;  - TODO: the icons are kinda distracting.. as with the mode-line icons..
  
  (after! centaur-tabs
    (setq
     centaur-tabs-height 11
     centaur-tabs-bar-height 15 ; default 30 maybe the smallest
    ; one of these worked! now they're tiny, like emacs's native tab plugin!
     centaur-tabs-set-bar "under" ; vs over FIXME
    
    ;; centaur-tabs-cycle-scope "groups" ;; ohh groups, not projects.. nvm
    ;; - tabs
    ;;     Navigate through visible tabs only.
    ;; - groups
    ;;     Navigate through tab groups only.
    ;; - default
    ;;     Navigate through visible tabs, then through tab groups.

    ))




  ;; if you use the "tabs" module under ui in doom
  ;;   - smells like an overkill thing.. watch out.. but beautiful with my current theme..!!
  ;; (centaur-tabs-mode t)
  ;;   - NOTE: doom turned this on for me automatically last time..
  ;; (setq centaur-tabs--buffer-show-groups t)
  ;;   - TODO: try this one out..
  ;; (centaur-tabs-enable-buffer-reordering t) ;; vs 'left
  ;;   - it's rather smart ordering..
  ;;
  ;; then bind centaur-tabs-forward/backward


;;; hl-todo
   (after! hl-todo 
    ;; tags
    ;; https://orgmode.org/manual/Setting-Tags.html
    ;; C-c C-c (org-set-tags-command)
    ;;   - when at head-line
    ;; C-c C-q (org-set-tags-command)
    ;; TODO: is this different from todo-items..??
    ;;  - org-tag-alist is empty..
    ;; NOTE: <-- i think this is a tag, head-line tags, which represent sequential states
    ;;  - no..?? WTF is this??
    ;;    - hl-todo
    ;;
    ;; i think have to update hl-todo--keywords
    ;; TODO: INCOMPLETE: set colors
    ;; FAIL: quotes trouble... :/
    ;;     (setq 
    ;;      hl-todo--keywords (append 'hl-todo--keywords '(
    ;;    ("IDEA"   . "#d0bf8f")
    ;;    ("WARN"   . "#d0bf8f")
    ;;    ("WARNING"   . "#d0bf8f")
    ;;    ("BEWARE"   . "#d0bf8f")
    ;;    ("INCOMPLETE"   . "#d0bf8f")
    ;;    ("TEMPFIX"   . "#d0bf8f")
    ;; ;;   '(("HACK"   . "#d0bf8f")
    ;;    ("ERROR"   . "#d0bf8f")
    ;;    ("FAIL"   . "#d0bf8f")
    ;;    ("HALP"   . "#d0bf8f")
    ;;    ("WTF"   . "#d0bf8f")
    ;;    ("TEMP"   . "#d0bf8f")

    ;;     ;; IDEA
    ;;     ;; WARN/ING/BEWARE
    ;;     ;; FIXME TEMPFIX/HACK
    ;;     ;; ERROR/FAIL HALP WTF
    ;;     ;; TEMP
    ;;     )))


    ;; from hl-todo.el
    ;;   - seems like doom moved a lot to org-mode..
    ;;   - makes sense as they are common words..
    ;; (defcustom hl-todo-keyword-faces
    ;;   '(("HOLD"   . "#d0bf8f")
    ;;     ("TODO"   . "#cc9393")
    ;;     ("NEXT"   . "#dca3a3")
    ;;     ("THEM"   . "#dc8cc3")
    ;;     ("PROG"   . "#7cb8bb")
    ;;     ("OKAY"   . "#7cb8bb")
    ;;     ("DONT"   . "#5f7f5f")
    ;;     ("FAIL"   . "#8c5353")
    ;;     ("DONE"   . "#afd8af")
    ;;     ("NOTE"   . "#d0bf8f")
    ;;     ("MAYBE"  . "#d0bf8f")
    ;;     ("KLUDGE" . "#d0bf8f")
    ;;     ("HACK"   . "#d0bf8f")
    ;;     ("TEMP"   . "#d0bf8f")
    ;;     ("FIXME"  . "#cc9393")
    ;;     ("XXXX*"  . "#cc9393"))
    ;;   An alist mapping keywords to colors/faces used to display them.

    ) ; hl-todo



;;; org-mode
  (after! org


    ;; TODO: update org tags: TODO, OKAY, YES, etc.
    ;;  - delete most of them
    ;;  - add: TEMPFIX, HALP, BEWARE
    ;;  - allows optional ':' in front of it

    ;; https://orgmode.org/manual/TODO-Basics.html


    ;; https://orgmode.org/manual/Workflow-states.html
    ;;  C-c C-t cycles an entry from ‘TODO’ to ... and finally to ‘DONE’ and ‘CANCELED'
    ;;  NOTE: shift
    ;;  BUG: hmmmm??
    (setq org-todo-keywords '(
          ;; (sequence "TODO" "FIXME" "ERROR" "WARNING" "HALP" "|" "DONE" "NVM")
          ;;   - TODO: this sequence doesn't make sense.. move to hl-todo

          ;; (sequence "TODO(t)" "PROJ(p)" "LOOP(r)" "STRT(s)" "WAIT(w)" "HOLD(h)" "IDEA(i)" "|" "DONE(d)" "KILL(k)")
          ;;   - doom's original sequence actually makes more sense..

            (sequence "TODO")
          ;;   - TEMP: keep it simple for now

          
            (sequence "|" "YES" "NO" "OK" "MAYBE" "IUNNO" "KILL")
          ;;   - these came with doom emacs..
          ;;     - it's a bit wordy, and in all caps.. but i believe in emacs..
          ;;     - it's also more mneunomic, in case you use shortcuts..
          ;;   - i might prefer check (or c) and x marks over YES and NO
          ;;     - "[\x2714]" "x"
          ;;     - "c" "x"

          ;;   i trashed the [ ]/[-]/[x] thing
          ;;   - these also came with doom emacs
          ;;   - flip check-mark symbol (unicode) for check, not X
          ;;     - also finally understood that X meant check..
          ;;   - BUG: not sure if you can search for this in the search engine thing..
          ))

    ;; from inspecting org-todo-keywords
    ;; 
    ;; Original Value
    ;; ((sequence "TODO" "DONE"))
    ;;   - nice 'n simple!
    ;;     - good job vanilla :)
    ;;     
    ;; Value
    ;; ((sequence "TODO(t)" "PROJ(p)" "LOOP(r)" "STRT(s)" "WAIT(w)" "HOLD(h)" "IDEA(i)" "|" "DONE(d)" "KILL(k)")
    ;;   - i was using KILL the wrong way..
    ;;  (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")
    ;;  (sequence "|" "OKAY(o)" "YES(y)" "NO(n)"))

    ;; Original Value
    ;; ((sequence "TODO" "DONE"))Value

    ;; ((sequence "TODO(t)" "PROJ(p)" "LOOP(r)" "STRT(s)" "WAIT(w)" "HOLD(h)" "IDEA(i)" "|" "DONE(d)" "KILL(k)")
    ;;   - loop? something you must keep doing? lol
    ;;  (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")
    ;;    - W for what?.. lol
    ;;  (sequence "|" "OKAY(o)" "YES(y)" "NO(n)"))

    
    (setq org-todo-keyword-faces
          '(("ERROR" . (:foreground "red" :weight bold))
            ("WARNING" . (:foreground "orange" :weight bold))
            ("FIXME" . "red")))

    ;; https://orgmode.org/manual/Global-TODO-list.html
    
    
    ) ; org-mode



  

;; TODO: move themes and fonts up, before package-related settings
;;   - could create a function if they're too big, unweildy..

;;; themes
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

;; NOTE: use consult-theme to try them all out on-the-fly



;; NOTE use solaire-mode to remove background color tinge
;; adding to (spc t s)
;;   - TODO: create functions to dim/adjust the text used for plain text, comments, and all text

;; bright: light
;; dim: outrun <-- MAIN THEME
;; late night: solarized-dark

;; light:
;; (setq doom-theme 'doom-earl-grey) ; light
;; (setq doom-theme 'doom-flatwhite) ; light, highlighter


;; purple:
(setq doom-theme 'doom-outrun-electric) ; high-contrast, hard white text
                                        ; PERFECT, similar to aura, especially with night-mode / warm colors!!
                                        ; BY FAR THE BEST THEME
                                        ;   - (of the ones provided by doom)

;; (setq doom-theme 'doom-shades-of-purple) ; childishly hideious, very bright back-light
;; (setq doom-theme 'feather-dark) ; low-contrast, slightly-visible comments, purple tinge, that lovable ugly one from helix: boo-berry! lol
                                  ; for when you want purple-tinged plain text back (from the helix days)
;; (setq doom-theme 'doom-laserwave) ; monokai with some pink in it


;; unique:
;; (setq doom-theme 'doom-manegarm) ; zelda, dark forest vibes
;;  -  TODO: need to provide alt with dim comments, though the whole theme is quite dim already..
;; (setq doom-theme 'doom-solarized-dark) ; very low-contrast, for the late night
;; (setq doom-theme 'doom-solarized-dark-high-contrast) ; brighter italicized comments, darker background, notably changes pink functions to blue

;; oldies with cool (blue'ish) colors:
;; (setq doom-theme 'doom-monokai-ristretto) ; a nice variant and revival of a classic
;; (setq doom-theme 'doom-tokyo-night) ; a classic
;; (setq doom-theme 'doom-moonlight) ; brighter comments and background
;;   - NOTE: great moonlight color for comments
;; (setq doom-theme 'doom-one) ; doom's default, too grey
;;   - doom-vibrant, just changes pink functions to teal..?



;; NOTE: can use consult-theme to try out all the themes
;; the ones prefixed with doom- are probably a bit more vetted

;; TODO: get aura, noctis, and jellyfish!

;; - TODO: port aurara
;;   - FINALLY, a text editor that will last the ages, and never have to port again!
;; - just use whatever's there..

;; a few light themes first:
;; doom-shades-of-purple
;;   - bright enough to see during the day!!
;;   - makes great use of transparency too..
;; doom-flatwhite
;;   - unique highlighter style, dim
;; doom-earl-grey
;;   - slightly modified doom-one-light which makes it cozier
;;   - italic comments, dimmer text? or less contrast?
;; doom-one-light

;; NOTE: all of these can be dimmed by "night-mode" on laptops, which make the colors "warmer", making more themes more tolerable, or even more comfortable..!

;; manegarm, dark forest green, zelda vibes!!
;;   - this one's actually legit.. someone put some love into this one!!

;; doom-outrun-electric, my favorite included theme, very high-contrast, hard, neon vibes
;;   - diff doesn't look good..

;; laserwave, neon pink, unfortunately plain text too bright
;;   - maybe not too difficult to edit it..

;;doom-solarized-dark, great! very low contrast, now with hot pink 'n purple!!
;; variants: *dark-high-contrast*, light, oksolar variants)
;;   - looks good here, very dim plain text, very comfy
;;   - dark-high-contrast version only subtley dims the background color (very good)
;;     - good on my shitty chromebook
;;   - light version is the only readable light theme i've seen.. yellow background, reminds me of a nvim theme that i liked..
;;   - also quite unique, the rest look like atom-material variants

;; feather-dark, fun, just comments are hard to see..
;;   - quite simiolar to helix's default theme.. not bad..!
;;   - suffers from different header text size in org-mode

;; snazzy, a variant of darcula?
;;  - this one was rather unique on helix, plain text too bright

;; doom-tokyo-night, my classic fall-back
;;   - between solarized-dark and outrun-electric
;; doom-moonlight, lighter background, lighter comments, a more glowy/jellyfish feeling
;; doom-palenight, bright background for lower contrast, too bright
;; doom-city-lights, a variant of tokyo night?

;; doom-shades-of-purple, a bit of an overload by the bright background and bright purple comments.. otherwise, quite fun 'n funky
;;   - text in txt/org files are still white :/
;;   - similar to adventure time
;; ephemerel, background may be too bright, lots of use of bold is interesting.. noctis vibes

;; doom-one, doom's default, based on atom/github theme, too gray, too boring
;; doom-vibrant, a blue-hue variant of doom-one
;; doom-tomorrow-night, a solid upgrade from gruvbox

;; horizon, a good monokai vaiant, except red vars and bright background











  ;;; fonts
  ;; Doom exposes five (optional) variables for controlling fonts in Doom:
  ;;
  ;; - `doom-font'
  ;;   -- NOTE: this makes a big big difference, as emacs can display alot more in the mini-buffer for auto-complete
  ;;   -- NOTE: terminals have their own appearance settings
  ;;   -- the primary font to use
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
  ;;(setq doom-font "Fira Code") ; this works too
  ;;(setq doom-font "Fira Code-14")
  ;;
  ;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
  ;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
  ;; refresh your font settings. If Emacs still can't find your font, it likely
  ;; wasn't installed correctly. Font issues are rarely Doom issues!
  ;;   - then search for 'mono', though not all monospaced fonts have 'mono' in it..
  ;;
  ;;
  ;;
  ;; exploring shit on a chromebook
  (cond ;; os defaults
   (doom--system-linux-p ;; (featurep :system 'linux) ;; ooooh yeahhh!! i'm lisp'in' baby!!
    ;; (setq doom-font "Cousine")
    ;;   - chromeos's default (google) cousine 13 is quite good.. 17 not so much..
    ;;   - there's notably no vertical line width, making it quite compact..
    (setq doom-font "DejaVu Sans Mono-9" ;; fall-back
          ;;  - not bad!.. kinda CUTE actually.. <3 farrr more spaced outtt, whoaaa.. actually quite close o Monofoki..!! <3 <3 but possibly more eye-straining..?? especially at this size.. :/
          ;;    - unfortunately, either too small or too wide at 13/20.. but beautiful!
          ;;     - need about 14 or 15
          ;;     
          doom-variable-pitch-font "Roboto-11" ;; NOTE: WOW WHAT A BIG FUCKING DIFFERENCE..!! this is beautiful!! this whole time i thought it was the chromebook being shitty..!!
          ;;  - if only it were monospaced.. it fucks up which-key, and punctuation is squashed together.. :/
          ;;  - TODO: try coding with it, def worth the beauty! also, it makes code very narrow!
          doom-big-font "Roboto" ;; FIXME: "could not resize 'doom-serif-font' for some reason"
          ;;(setq doom-font "Noto Sans Mono") ;; hmmm, seems quite space out in width.. and tall..
          ;;(setq doom-font "Nimbus Mono PS") ;; yikes.. serif mono.. nope
          doom-serif-font "Tinos" ;; from least to most seriph: Tinos / Noto Serif < Caladea < DejaVu Serif
          ;; NOTE: also an intereting experience... back when code was printed in fancy serif..
          )
    )
   ;; (doom--system-windows-p
   ;;  ())
   ;; (doom--system-macos-p
   ;;  ())
   )

  ;; (setq doom-font "Cousine") ; i think it falls-back to this.. especially if you're missing a font-size and use increase/decrease-font-size
  ;; (setq doom-font "DejaVu Sans Mono") ; d: 10; cute!, very wide at 11
  ;; does chromeos come with ubuntu mono?
  
  ;; custom fonts

  ;; battle of the cute

  ;; (setq doom-font "AnnotationMono-11") ; d: 10, eh, something's off.. feels a bit squashed (low height, long width).. though very fun! simpsons vibes
  
  ;; (setq doom-font "Agave") ; d:10 nice! very cute. though maybe too cute to read.. lol
  ;; (setq doom-font "Agave-11") ; also nice! big. funky! bolds look great!
  ;;   - can be rough reading plain text, makes me cross-eyed, otherwise got an earthbound feeling!

  ;; (setq doom-font "SeriousShanns") ; BUG: showing italics version.. though nice!


  (setq doom-font "Ubuntu Mono-11") ; d: 10
  ;; (setq doom-font "UbuntuMono-Bront-10") ; d: 10, too small (in height), though readable!
  ;; (setq doom-font "UbuntuMono-Bront-11") ; NEW CLASSIC, GREAT! FAR less noisy than agave!
  ;; (setq doom-font "UbuntuMono-Bront-12") ; a bit wider..
  ;; (setq doom-font "UbuntuMono-Bront-13") ; GREAT here too, though big (shows as 15?).. like mononoki: tall yet cute!
  ;;   - TODO: to use bront version, would need to combine bront for regular font, and the original for styles
  ;;   - also has a great big X icon use by centaur-cons for close tab..!
  
  ;; (setq doom-font "DejaVu Sans Mono-9") ; d: 9, GREAT! kinda cute too! very readable, VERY narrow, excellent for long code
  ;; (setq doom-font "DejaVu Sans Mono-10") ; feels too wide here..
  ;; (setq doom-font "DejaVu Sans Mono-11") ; big-mode, quite wide here, but still nice 'n comfy..
  ;; (setq doom-font "DejaVu Sans Mono-Bront-9") ; NOTE: lacks styles: bold/italics will be fuzzy
  ;; (setq doom-font "DejaVu Sans Mono-Bront-10")

  ;; (setq doom-font "monofoki-9") ; great terminal font too!
  ;; (setq doom-font "monofoki-10") ; PERSONAL CLASSIC, line-height fixed, taller, also a great terminal font!
  ;; (setq doom-font "monofoki-11")
  ;; (setq doom-font "monofoki-12") ; incredible 12/13/16
                              ; also great when scaled in writeroom-mode
                              ; ADVENTURE TIME!!
                              ; removes a few seriphs, makes m cuter
  ;; (setq doom-font "mononoki") ; BUG: less line height.. maybe too scrunched up.. def something wrong about it..

  ;; (setq doom-font "OfficeCodePro") ; d: 10, PERSONAL CLASSIC, kinda cute(?) yet COMFY adds a few cute seriphs to source code pro
  ;;   - could get rid of the seriph on 'i'..
  ;; (setq doom-font "OfficeCodePro-11") ; this is GREAT too


  
  ;; bitmap
  ;; NOTE: this honestly may be the way to go.. wow.. it's crisp on a shitty old chromebook!
  ;; (setq doom-font "CozetteVector-10") ; NOTE: bitmap font: limited to size 10, no styling (bold, italic)
  ;;                                     ; INCREDIBLE at tiny sizes

  ;; classics
  ;; (setq doom-font "Source Code Pro-10") ; d: 9, wayyy too wide and scrunched up!
  ;; (setq doom-font "Inconsolata") ; d: 10 CLASSIC, comforable, even at default small size

  ;; newer ones to try
  ;; (setq doom-font "CommitMono-10") ; great! round, seems like a cousin to inconsolata and source code pro.. with less line height
  ;; (setq doom-font "RedditMono-10") ; quite nice, though a bit wide, and roboty

  ;; TODO: try text-scale-mode since zen scales text really well..
  
  ;; eval testing area (<3 emacs)
  ;;   - just use set-frame-font
  ;;     - TODO: bind this
  ;; (describe-fontset)
  ;; (setq doom-font "DejaVu Serif")
  ;; (doom/reload-font)
  ;; (doom/increase-font-size 1) ; these suck :/ set font size directly with font
  ;; (doom/decrease-font-size 1)
  ;; (doom/reset-font-size)
  ;; NOTE: can use zen (spc t z) to toggle between a larger font size



  ;; variable-pitch fonts (non-monospace)
  ;;  - variable-pitch-mode..!!!
  ;;    - (doom?) emacs has everything..
  ;;    - just ensure doom-variable-pitch-font is set
  ;;    - added to toggle key-map
  ;;  - TODO: make one of these default for org-mode

  ;;
  ;; google's croscore fonts:
  ;;   - meant to be open-source alts to monotype corporation's fonts:  arial, new times roman, courier new
  ;; arimo
  ;;   - sans-serif
  ;;   - very round, a bit distracting..
  ;; tinos
  ;;   - serif
  ;; cousine
  ;;   - monospace
  ;;
  ;; google sans
  ;;   - the new chromeos default
  ;;     - (replacing arimo/tinos/cousine?)
  ;;   - default for google chrome on chromeos
  ;;   
  ;; dejavu serif
  ;;   - make org-mode a bible!
  ;;
  ;; noto serif
  ;;   - quite good! only slightly serif, and like noto sans, it's very spacious, with hefty horizontal space
  ;;   
  ;; carlito <- calibri
  ;;   - NOTE: maybe the best one..!
  ;;   - sans
  ;;   - default size has little vertical height, make it good for fitting a bunch of text
  ;; caladea <- cambria
  ;;   - serif
  ;;
  ;;   
  ;; (setq doom-font "Google Sans-11") ; d: 11, quite wide (for a variable-width font), spacey
  ;;   - 16 on google chrome..!?
  ;; (setq doom-font "Roboto-11") ; d: 12,  NOTE: in my eyes, this is the best one, spacious yet not widely-spaced, very sans
  ;; (setq doom-font "Carlito-12") ; d: 10, very good, got that ms word 2008(?) feel
  ;; (setq doom-font "Noto Sans-12")  ; d: 11? eye-pleasing! this one is quite good, in case roboto is too variable or narrow in width
  ;;   - i actually remember using this somwhere.. i think for writing on my ipad mini, using voice dream writer!

  
  ;;  - children/elderly mode
  ;;  - spc-t-b - big font mode
  ;;    - TODO: customize it! 
  ;;  - maybe can help with focus..? or maybe too big..

  

) ; init



(defun ra/bind-keys ()
  ;; finally, beginning to alter meow-doom's defaults key-bindings.. it must have been really really good, as i had to immediately alter helix's, a lot!

  ;; NOTE: don't go crazy! still learning, the defaults actually have more wisdom than i do.. all hail the emacs wizards!!


  ;; NOTE: meow assumes you don't alter the original emacs key-bindings..
  ;; if you do change and original binding, you must instead update this var:
  ;;meow--kbd-[function-name]
  ;;meow--kbd-yank-pop
  ;; see meow-var.el
  ;;   - this lists all of the key-board macros


  ;; this is what happens when you fuck with emacs config.. :/
  ;; and i thought nvim was terrible..!!


  

  ;; see notes in [emacs.org]
  ;; TODO: ALMOST DONE..: slowly compare 'n merge my helix bindings


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



    ;; originally X is meow-go-to-line, but it also bound to Q..
    ;;   - TODO: what the.. two bindings..?? un-bind both!!
    ;; later, i re-bind X to er/expand-region
    
    ;; TODO: just unbind C-=, will never find that..!
    ;;   - is it intended for use in insert-mode..??


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
    ;;
    ;; f9
    ;;   - treemacs
    ;;     - tough on a chromebook: escape + volume down key..
    ;;       - use alt: spc-o p/P




   ;;; un-bind some keys??
   ;; NOTE: nope, don't fuck with emacs' original bindings, bad things will happen
   ;;   - meow re-uses the original bindings, using key-board macros, in case any other plugin updates it
   ;;     - the mini-buffer / pop-ups / any read-only buffers may also use these bindings..
   ;;   - i think keeping this prevents the madness that evil bindings has to go through... just gotta stick with it, don't fight it
   ;;     - also, if you change the keyboard layout, it's a good thing, as it's mneumonic, as opposed to whatever's on the home-row

   ;; NOTE: can open help-with-tutorial to play with the original bindings..
    
   ;; see emacs.org

   ;; it's a bit tempting to bind hjkl, but fuck it
   ;;   - anyway, it's notably not mneumonic


    

   ;;; how to bind keys
   ;;
   ;; from the docs
   ;; (meow-define-keys
   ;;   'normal ;; 'STATE ; see list of states/keymaps above
   ;;   
   ;;   ;; bind to a command
   ;;   '(\"a\" . meow-append)
   ;;   '("U" . undo-fu-only-undo ) ;; NOTE: TODO: use capital letter, not S-u ?? yet you can do C-S-u??
   ;;   
   ;;   ;; bind to a keymap
   ;;   (cons \"x\" ctl-x-map)
   ;;   ; binds spc-x to spc-x-map
   ;;   
   ;;   ;; bind to a keybinding which holds a keymap
   ;;   '(\"c\" . \"C-c\")
   ;;   
   ;;   ;; bind to a keybinding which holds a command
   ;;   '(\"q\" . \"C-x C-q\"))"
   ;;
   ;;
   ;; more examples from keybindings_QWERTY.org
   ;;   (meow-leader-define-key ; this is an alt function to define the base leader key-map (C-c / spc)
   ;;    ;; SPC j/k will run the original command in MOTION state.
   ;;      - TODO: i actually don't know why this exists.. to quickly quit the binding menu..??
   ;;    '("j" . "H-j")
   ;;    '("k" . "H-k")
   ;;      - binded by the lsp key-map..
   ;;    '("1" . meow-digit-argument)
   ;;    '("/" . meow-keypad-describe-key)
   ;;    '("?" . meow-cheatsheet))
   ;;    ...
    ;;   (meow-motion-define-key ;; TODO: still don't know what the motion state is..
    ;; '("j" . meow-next)
    ;; '("k" . meow-prev)
    ;; '("<escape>" . ignore))
   ;;
   ;;    (meow-normal-define-key
    ;; '("Y" . meow-sync-grab)
    ;; '("z" . meow-pop-selection)
    ;; '("'" . repeat)
    ;; '("<escape>" . ignore))
   ;;
   ;;
   ;; some personal examples
   ;;'leader ; NOTE: defaults to c-c.. from var mode-specific-map
   ;;
   ;; '("q Q" . nil) ;; NOTE: undefined or nil are okay..
   ;;  - un-bind a key
   ;;
   ;;'("q r" . some-function)
   ;;  - normal key-maps work fine..
   ;;  
   ;;"c s" ; must be c-c c s / spc c s
   ;;"l r" ; must be c-c c l r / spc l r
   ;;  - i'm guessing these link to the original key-maps as well..
   ;;
   ;; TODO: NOTE: still not quite sure how c-x and c-h works..!!
   ;;   - don't know how to get to c-x ?.. :/
   ;; NOTE: there's fallback on the key sequences by meow's keypad..
   ;;'("b" . consult-buffer) ; c-c c-b -> c-c b / spc b
   ;;'("x b" . consult-buffer) ; c-c (c-x -> x) (c-b -> b) / spc-c x b
   ;;'("SPC x b" . consult-buffer) ; spc spc x b
   ;;
   ;;
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
           ; 
  ;; (defun ra/bind-common-key-bindings ()
  ;;(setq ra-common-key-bindings ( ;; TODO: hmmm, can't pass a list..??


   ;;; these abuse emacs defaults in normal-mode, can be confusing..
   ;; '("C-b" . "C-x b" ) ;; FIXME: somehow binds h too??
                          ;; TODO: damn, i really need this
   
   ;;; a few things first..

   '("C-<tab>" . "C-x b" ) ;; NECESSARY,  +[search-engine]/switch-workspace-buffer
   ;;   - this works really well, organizing/restraning buffers by workspaces


   
   '("M-u" . vundo ) ;; Braid
   ;;   - how could this not be bound..??
   ;;   this is very meta..
   ;; TODO: maybe need pop-up menu for mark/diff-vundo..


   ;; for dat old game console feel
   ;;   - mneumonic c-c (o)pen-map is really good too
   ;;     - NOTE: TODO: other-window does not go to mini-buffer??
   '("`" . +eval/open-repl-other-window ) ;; c-c o r/R
   '("~" . +eshell/toggle ) ;; c-c o e/E
   ;;   - may not need, if i use (async)-shell-command..
   ;; c-` = +popup-toggle ;; default, matches quite well with this default..
   ;; m-` = tmm-menubar ;; default
   ;;   - menubar, the emacs way, lol..

   ;; in doom's bindings
      ;; ;;; popups
      ;; (:when (modulep! :ui popup)
      ;;   "C-x p"   #'+popup/other
      ;;   "C-`"     #'+popup/toggle
      ;;   "C-~"     #'+popup/raise) ;; c-s-`
      ;;     - raises popup to current buffer, for better viewing


   


   ;;; MOVEMENT
   ;;  - keeping movement consistent across meow's normal-mode and emacs

   ;; there are three sets of movement (even on a tiny laptop keyboards)
   ;; 0/c/m-arrow keys
   ;;   - all
   ;; c/m-npfb
   ;;   - emacs
   ;; hjkl
   ;;   - vim, evil, meow

   ;; NOTE: shift is reserved for selection, in combination with these movement bindings

      
   ;; single character/line movement
   ;; arrow keys = c-npfb = hjkl (vim, meow) + c-a/e
   ;;   - these all work as expected..
   
   ;; a little personal binding
   ;; TODO: i quite miss this basic movement on c-j/k..
   ;;   - must fight.. the.. temptation..!!
   ;; NOTE: but, as these aren't mneumonic, so they wouldn't translate well to other keyboards anyway..
   ;;'("C-j" . forward-paragraph ) ;; TODO: new-line, duplicate of enter, though maybe different behavior..
   ;;'("C-k" . backward-paragraph )
   ;; FIXME: k breaks a crucial emacs key-binding..
   ;; s is running backward-paragraph
   ;;   - meow-kill seems to have changed to backward-paragraph??
   ;;     - ahh, it re-maps the function at C-k, not the key
   ;;       - meow-kill is somehow liniked to the kbd macro bound to C-k
   ;; must re-set meow--kbd-kill-line to the new binding with kill-line



   ;; word/paragraph movement
   ;; c-[arrow keys] = m-npfb (no hjkl) + m/a-e
   ;; fb seems bound correctly (char, c-word, m-symbol, c-m-exp)
   ;; NOTE: flipped word with symbol, to move and kill shit quicker by default
   ;;  - it also matches the functionality in the mini-buffer (c- moves by symbol)
   ;;'("C-f" . sp-forward-symbol ) ;; TODO: only in normal-mode..
   ;;'("C-b" . sp-backward-symbol ) ;; FIXME: breaks c-f/b meow key-board macro for forward/backward char
   ;;  - TODO: NOTE: it was a very interesting making this the default movement.. it actually works quite well for code, as often, you are moving by expression.. plus, if you make a spelling mistake, it's often better to just kill the whole word then to go back to the correct char position, and made even worse by modal bindings, enter 'n exit insert-mode
   ;;    - i think i'll put it on c-s-h/l for now..
   ;; '("M-f" . forward-word )
   ;; '("M-b" . backward-word )
   '("M-f" . sp-forward-symbol )
   '("M-b" . sp-backward-symbol )
   ;;   - FIXME: these require +smartparens module
   ;;   - it seems meow doesn't use these for any key-board macros..
   ;;     - BEWARE: don't confuse with meow-next-word/symbol (e/E), which are unique to meow
   ;;    
   ;; m-n/p were unbound by default..
   '("M-n" . forward-paragraph ) ;; vs page-down, forward-sentence (m-e), sp-next-sexp
   '("M-p" . backward-paragraph ) ;; vs page-up, backward-sentence (m-a), sp-previous-sexp
   ;;   - NOTE: this is a GREAT way to move around text in general, and is my preferred way of moving around
   ;;   - this matches down/up arrows, which are foward/backward-paragraph by default
   ;;   - it also matches org-forward/backward-paragaph
   ;;   - also excellent with shift selection
   ;;   
   '("C-<right>" . sp-forward-symbol ) ;; not even bound by default..!!
   '("C-<left>" . sp-backward-symbol )
   ;;   - FIXME: these require +smartparens module
   ;;   - TODO: there's a forward-symbol, but no backward-symbol..?? 
   ;;   - also back instead of previous is terrible, even if it's bound to b..
   ;;   
   ;;
   ;;   
   ;;   
   ;; m-e/a = forward/backward-sentence
   ;;   - is a really neat and unique way to move too, and puts the force the left hand
   ;;   - it skips to '.', but if it doesn't find one, continues to the begin/end of a paragraph


   
   ;; drag/transpose stuff around
   ;; m-[arrow-keys] (notably no mirrored bindings here)
   ;;   - NOTE: i'm keeping the default drag-stuff for now, until i find a place for it..
   ;;   - NOTE: chrome os maps these to page-down and page-up keys by default (<next>/<prior> in emacs. maybe the traditional name for page down and up keys)
   ;;   - NOTE: chrome os maps m-left/right to <home>/<end> by default
   ;;
   ;; m-[arrow keys] = drag/transpose shit by default
   ;;   - TODO: NOTE: this breaks two themes: movement and selection (when combined with shift)
   ;;     - def need to move this elsewhere.. or make it interactive..??
   ;;     - maybe some other modifier key..?? loll
   ;;       - TODO: `/~ as third modifier??
   ;;   - emacs was surely ahead of it's time with this one..
   ;; M-down/up/left/right ;; default: drag-stuff-down/up/left/right
   ;;   - this is a really cool function!!
   ;;     - NOTE: this even works with moving selections!!
   ;;       - NOTE: this prevents a TON of cut 'n pasting
   ;;   - this is an improvement over transpose functions (c-x t, c-x c-t, m-t, c-m t)
   ;;   - m-up/down in vs-code too
   ;;
   ;; '("M-<right>" . "M-f" )
   ;; '("M-<left>" . "M-b" )
   ;;   - NOTE: the defaults often trip me up.. these move by word, which is what is what i expect.. but i think i'll keep transposed right/left, as it works with selections too..



   ;; semantic-based movement
   ;; c-m-[arrow keys] = c-m-npfb + c-m-a/e
   ;;   - these are actually awesome..
   ;;   - helix had some really good tree-sitter based selecction, i think i mapped them to i/o.. not sure about movement though..
   ;;
   ;; c-m-f/b = forward/backward-sexp
   ;;   - NOTE: this is a GREAT way to move around code, it has some advanced behavior, jumping from expresions (identifiers) within a list (expression), to jumping lists (expressions) when outside a list
   ;; C-M-n/p = forward/backward-list
   ;;   - not as needed since c-m-f/b is so good..
   ;;   - TODO: maybe can create a function to use next/previous (de)function, if not fallback to page down/up
   ;;     - also can update c/m-v with it..
   ;;
   ;; C-M-<right>/<left> forward/backward-sexp
   ;;   - NOTE: once your're out of a function, it behaves like next/previous-sexp
   ;; C-M-<down>/<up> down/backward-up-list moves down and up a nested list (of functions)
   ;;  - NOTE: this is different from c-m-n/p forward/backward list, which is what'd you'd usually want
   ;;  - that's some advanced shit..
   ;;'("C-M-<up>" . "C-M-a" ) ;; defun / function definition
   ;;'("C-M-<down>" . "C-M-e" ) ;; this works for moving by function
   ;;  - this is a great alternate to moving down/up nested functions..
   ;;  - TODO: maybe sp-next/previous-sexp, since i lost this re-binding m-n/p
   ;;
   ;;
   ;; c-m-a/e = functions



   
   ;; C-M-<page-down>/<page-up> scroll-left/right ;; strange binding, but useful..
   ;;  - can instead use c-x >/<




   ;; c/m/c-m-a/e bindings
   ;;   - these are all perfect <3
   ;;     - emacs movement is actually incredible.. incredibly smart..!
   ;;   - signifies begin/end
   ;;     - possibly the same as <home>/<end> keys
   


   
   ;; c/m-v
   ;;   - for the nostalgia of some past time..

   


   ;; an extra set of movement keys added by me
   ;;   - c-s- is often more comfortable than reaching for the meta key on many laptops, but unfortunately, it's used by shift to select in combination with the movement bindings (c/m/c-m-npfb and c/m/c-m-arrow keys), thus only hjkl is open for hacking, as c-hjkl aren't movement commands (and thus there's nothing to select..)
   ;;   - these are open to be re-bound Later down this config file..
   ;;     - NOTE: c-s- sometimes doesn't work..? :/
   ;;
   ;; NOTE: put your favorite movement bindings here!!
   ;;  - these match my oft used custom helix bindings for c-hjkl
   ;;
   ;; TODO: really just need smooth scrolling with next/prev paragraph, as most gui editors do..
   ;; 
   ;;  - some possibilities:
   ;;  
   ;;  - page down/up is another GREAT and FAST way to move around text in general, especially in case a major-mode (org-mode..) is giving you trouble..
   ;;    - consider this the key-board alt to mouse scrolling (it's function is even named scroll..)
   ;;    - also, the defaults c/m-v are just.. antiquated
   ;;    - TODO: conceptually it belongs on m-down/up.. but it's used by drag functions by default..
   ;;    - TODO: could update the binding to move by function (m-a/e), if not, fall-back to move by page
   ;;    
   ;;  - forward/backward-paragraph
   ;;    - this is a much needed alt for m-n/p, which is tough to reach on some key-boards
   ;;      - however, because this binding includes shift, it's better to use page-down/up here, as you likely aren't selecting pages of text.. or are you..??
   ;;    - there's already also m-down/up for paragraph movement
   ;;    
   ;;  - M-a/e is an awesome emacs original..
   ;;    - unfortunately, it stops at '.'
   ;;      - though, even then, it's still quite interesting.. as, what other character would you stop on, within a chunk of text / paragraph?
   ;;      - TODO: need to create an alt function.. could even replace c-a/e 
   ;;
   ;;
   '("C-S-j" . "C-v")
   ;;  - NOTE: c-j is kinda open for re-binding too, but c-k isn't..
   '("C-S-k" . "M-v")
   ;;  - i think i use page movement most often, especially for org-mode, as i tend to take notes with lists (and where paragraph movement doesn't work well with list items..)
   ;;  - besides, there's enough bindings for paragraph movement!!
   ;;    - (m-n/p, c-down/up)
   ;;  - page movement is also nice as it'll return back to the same point, when you go back
   ;;    - somehow, this still doesn't replace c-l, which actually moves the cursor, so that you have the rest of the window to view..
   ;; '("C-S-h" . backward-paragraph) ; C-a vs M-a vs C-M-a
   ;; '("C-S-l" . forward-paragraph) ;  C-e vs M-e vs C-M-e
   ;;   - this one feels funny..
   '("C-S-h" . sp-backward-symbol) ;; symbol movement is GREAT. it's like expression movement, but for normal text/prose
   '("C-S-l" . sp-forward-symbol)
   ;; TODO: until i figoure out how to bind c-f/b to this in normal-mode only..
   ;;   - could try something else here..
   ;;   -> c-l works well with this..

   ;; '("C-S-j" . "C-v")
   ;; '("C-S-k" . "M-v")
   ;; '("C-S-h" . "M-a") ;; good for writings, interesting for code..
   ;; '("C-S-l" . "M-e")


   
   
   ;; END OF BASIC MOVEMENT




   
   ;; # C-S-k = "kill_to_line_start"
   ;;  - don't actually have anything for this..
   ;;    - c-s-a s

   
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







   ;;; for completeness' sake

   ;; delete
   ;;  - NOTE: i generally don't use big keyboards, so no need to worry about the delete key
   ;;  - generally deletes forward
   ;; d = meow-delete
   ;; D = meow-backward-delete
   ;; C-d = delete_char ;; forward
   ;; M-d = kill_word ;; forward
   ;;
   ;; optional: could bind this in normal-mode only, to open add delete symbol..
   ;;   - nah, it's a pain.. don't fight against emacs..
   ;;   - it's better to have consistency across both modes
   ;; '("C-d" . meow-backward-kill-word ) ;; doom/delete-backward-word, backward-kill word (affects kill-ring?) FIXME: over-rides d, it must be used by a keyboard macro..
   ;;   - meow--kbd-delete-char = C-d
   ;;'("M-d" . meow-backward-kill-word ) ;; symbol?, default: kill-word
   ;; meow-beacon-kill-delete ;; delete all selections.. not sure how it would differ from s..
   ;; 
   '("C-S-d" . meow-backward-kill-symbol) ;; to match D
   ;;   - or kill-whole-line? to match c-s-<backspace>
   ;;     - nahh, keep this, i use this quite a lot now in normal-mode.. though i still need the backspace key in insert-mode..
   ;;   - NOTE: anyway, can re-bind further down this config..
   '("M-S-d" . meow-backward-kill-word) ;; FIXME: runs M-D -> M-d -> kill-word
   '("M-D" . meow-backward-kill-word) ;; makes no difference..
   ;;   - hmmmm, maybe M-S is no good..?
   ;;     - but works fine with m-s-n/p..
   ;; c-m-d/u = sp-down/up-sexp!

   ;; backspace
   ;;   - NOTE: seems to map to <DEL> (use "DEL" when binding here..?), as it may be used in various ways.. and behave differently
   ;;     - and it's not chromeos..
   ;;   - NOTE: chrome os maps a-backspace to delete by default
   ;;   - unlike delete, backspace always goes back
   ;;   
   ;; backspace = backward-delete-char-untabify ;; default
   ;; C-backspace = backward-kill-word ;; default
   ;; '("C-DEL" . meow-backward-kill-word) ;; default: backward-kill word (affects kill-ring?), alts: doom/delete-backward-word
   ;; '("M-DEL" . meow-backward-kill-symbol) ;; default: backward-kill-word
   ;; '("M-<backspace>" . meow-backward-kill-symbol) ;; default: backward-kill-word
   ;; NOTE: i flipped these to kill shit quicker by default..
   ;;       i think the default behavior is retained in the mini-buffer anyway, where you wouldn't want to delete entire file-paths
   '("C-DEL" . meow-backward-kill-symbol)
   '("C-<backspace>" . meow-backward-kill-symbol)
   '("M-DEL" . meow-backward-kill-word)
   '("M-<backspace>" . meow-backward-kill-word)
   ;;   - just in case this changes on another os..
   ;;   - TODO: shouldn't use meow key-board macros..
   ;;     - yet, i can't find any other kill-symbol functions..??
   ;; C-S-backspace = kill-whole-line ;; interesting that this was actually bound, and quite a great default too!.. especially when in insert-mode.. can re-map to something else later down this config if needed..




   

   ;; re-bind
   ;; spc-m-x is too long
   ;; m-x is what i should be using..
   ;;   - with the right-side key
   ;;     - TODO: try using right-meta with index/pinky and press x with left thumb
   ;;       - though, i feel like c/m-space makes sense..
   ;;       - TODO: ask how people press these keys (which fingers, comfortably)
   '("M-SPC" . execute-extended-command)
   ;;  - TODO: originally cycle-spacing
   ;;    - actually an interesting command..
   ;;  - NOTE: in insert-mode, meow binds M-spc to the leader menu..
   ;;  - FIXME: used by objed plugin: objed-activate
   ;; '("SPC-SPC" . "C-x") ;; space-space is actually AWESOME(!!)
   ;;  - NOTE: this leads to c-x c-? map.. hmmm
   ;;    - TODO: no clue how to access the c-x ? map..
   ;;      - not SPC . C-x-SPC
   ;;      - not SPC . C-x
   ;;      - not SPC-SPC . C-x
   ;;
   ;; NOTE: C-SPC may have been used for completion before (doom +evil?)..
   (cons "C-SPC" ctl-x-map)
   ;;  - TODO: NOTE: this skips the key-pad and goes straight to emacs' orginal key-chord sequence input handler..
   ;;  - in meow, spc-spc dispatches c-spc
   ;;    - NOTE: but it doesn't work with this cons method of binding a key-map.. :/
   ;;  - TODO: re-bind the default set-mark-command
   ;;    - seems to have an alt binding C-@.. really obscure..
   ;;
   '("C-S-SPC" . set-mark-command) ;; or cycle-spacing
   ;;  - a temporary re-binding..
   



   
   ;; TODO: NOTE: now only c-h left, which still requires you to use the original key-chord (or spc-h-spc in meow)..






   ;;; alt display management (buffer/windows/tabs)
   ;; a lot of these are stuffed in the c-x menu, which i don't enjoy..
   ;; NOTE: can abuse c-s- modifier here via GUI and good contemporary terminal apps
   ;;   - though, c-s- could be saved for even more advanced functions.. lol
   ;; in helix, i used C-S-hjkl, but here, i use C-S-npfb, to stay consistent with emacs classic bindings
   ;; NOTE: FUCK, C-S-npfb is needed to move AND select stuff
   ;;   - reverted back to my old helix bindings (hjkl)
   ;; NOTE: can always use the mouse for tabs..
   ;; FIXME: TODO: nope, doom even uses these!! check for existing bindings!!
   ;; can check doom's +emacs-bindings.el
   ;;   - just r and s? no..??
   ;; TODO: could try capslock-[key] (<escape>-[key])
   ;; can try using the F-keys
   ;;   - doom may use this to toggle various modules (tree, mini-map, debug, etc.)
   ;;     - seems only f9 for tree..
   ;;   - next/previous buffer seems to already be bound to f2/f1
   ;; also could create a menu for all display management
   ;;   - should try to fit into the original c-x
   ;;     - the original way may be the way to go after all.. lol
   ;; TODO: c-x t/T switch tab (instead of c-x t ret)



   ;; special chromebook keys

   ;; TODO: really just need more direct bindings here.. see focus editor:
   ;;   - c-p for switch buffer
   ;;   - c-w for close-buffer
   
   ;; <- and -> (f1/f2)
   ;;  - NOTE: this binding is god-send.. even just for next/previous buffer
   ;;  - lol, i really like this binding.. a pair of keys work really well here.. and what a strange little pair i have here..
   ;;  - i actually like that it's away from the main keys... by the time i need to change buffers, i need a break!
   ;; '("<XF86forward>" . next-buffer ) ;; default, uses the buffer jump-list
   ;; '("<XF86Back>" . previous-buffer ) ;; default
   ;;   - NOTE: next/previous-buffer can jump projects
   ;;     - this an interesting experience to visually see if you have centaur-tabs enabled..
   ;;   - alts: projectile-next/previous-project-buffer
   ;; '("C-<XF86Forward>" . projectile-next-project-buffer ) ;; FIXME: NOTE: doesn't seem to always switch within the project.. ahhh i see, if it's not under a project, under the grab-all "default" project, it'll behave differently.. :/
   ;; '("C-<XF86Back>" . projectile-previous-project-buffer )
   ;;   - these are restricted to the project
   ;; '("C-<XF86Forward>" . tab-next ) ;; native impl, does it work for both tab-bar-mode and tab-line-mode..??
   ;; '("C-<XF86Back>" . tab-previous ) ;; NOTE: doesn't work for centaur-tabs.. :( though, it makes sense as centaur-tabs and a bunch of other tab plugins exited much before it.. emacs added it in v27.1 / 2020!
   '("C-<XF86Forward>" . centaur-tabs-forward ) ;; nice!
   '("C-<XF86Back>" . centaur-tabs-backward )
   ;;   - a more visual, interactive way of switching buffers..
   ;;   - by default, these go through visible tabs, and then at the end, jumps projects
   ;;     - can change behavior with centaur-tabs-cycle-scope
   ;; '("C-<XF86Forward>" . next-window-any-frame )
   ;; '("C-<XF86Back>" . previous-window-any-frame )
   '("M-<XF86Forward>" . +workspace/switch-right ) ;; perfect!
   '("M-<XF86Back>" . +workspace/switch-left )
   '("C-M-<XF86Forward>" . next-window-any-frame ) ;; just here for completion (frame), i hope i don't have to open another emacs program..!!
   '("C-M-<XF86Back>" . previous-window-any-frame )
   ;;  - i normally use c-x o / c-s-o other-window to hop windows
   

   ;; chromebook reload key (f3)
   ;; TODO: could use for switch-buffer/project/workspace/frame/window(?)..
   '("<XF86Reload>" . "C-x k" ) ;; kill-buffer NOTE: thankfully triggers mini-buffer search
   '("C-<XF86Reload>" . +workspace/close-window-or-workspace ) ;; close/quit windows, not kill (as you're not actually killing anything..)
   ;;  - quit-window
   ;;    - kills the buffer..??
   ;;'("M-<XF86Reload>" . tab-close ) ;; too confusing, just use mouse, don't want to do by accident..
   '("M-<XF86Reload>" . +workspace/kill )
   '("C-M-<XF86Reload>" . "C-c q f" ) ;; delete-frame / doom/delete-frame-with-prompt

   
   
   ;; maybe f4 for splitting..??
   ;;   - nope, chromebook's function takes over (maximize/minimize)
   ;;  - vs c-x 0/1/2/3/4



   
   ;; a few crutches i still haven't figured out..:
   ;;   - can abuse the c-s- modifier here
   ;;     - NOTE: c-s- sometimes doesn't work.. :/

   ;; q > k > w > c by feeling

   ;;'("C-S-j" . next-buffer ) ;; n
   ;;'("C-S-k" . previous-buffer ) ;; p
   ;;'("C-S-w" . kill-buffer ) ;; k NOTE: thankfully triggers mini-buffer search
   ;;  - c-x K / spc-x-K is hella annoying!!

   ;; C-S-n = ":new" # :n
   ;;   - use spc-f-f instead, and create a new file
   ;;     - it's just a buffer until you save it.. then it creates a file
   ;;   - c f x = scratch buffer
   ;;     - doesn't show up on filtered buffer list


   ;; c-x 2/3 is still weird to me.. def need to rid these old emacs bullshit!!
   ;;   - though, i am indeed running out of keys here.. so maybe it's not as bad after all..
   '("C-S-v" . split-window-right ) ;; c-x 3
   '("C-S-s" . split-window-below ) ;; c-x 2
   '("C-S-c" . +workspace/close-window-or-workspace) ;; close/quit windows, not kill (as you're not actually killing anything..)
   ;;   - FIXME: not working..
   ;; a ton of alts:
   ;; +workspace/close-window-or-workspace (c-x 0)
   ;;   - quit-window
   ;;   - delete-window (c-x 0)
   ;; meow-quit
   ;;   - "kill buffer or window"
   ;;     - seems to kill buffers and not quit window..??
   ;; delete-other-windows (c-x 1)
   ;;   - TODO: this is a nice shortcut..
   ;; kill-buffer-and-window

   '("C-S-o" . other-window ) ;; matches c-x o other-window
   ;;   - good enough for now!!
   ;;'("C-S-j" . next-window-any-frame ) ;; l, test vs next-window
   ;;'("C-S-k" . previous-window-any-frame ) ;; h
   ;;   - these weren't even bound..

   ;; NOTE: can worry about this later, once i choose workspaces vs tabs
   ;; '("C-S-h" . tab-next ) ;; f cycles tabs?
   ;; '("C-S-l" . tab-previous ) ;; b
   ;; ;;  - alts: tab-last, tab-recent, tab-switch
   ;; '("C-S-q" . tab-close ) ;; too confusing, just use mouse, don't want to do by accident..
   ;;  - NOTE: not mnuenomic
   ;;  - w matches browser ui
   ;;  - q feels too powerful, feels like it should close emacs..!!
   '("C-S-t" . tab-switch )
   ;; c-x t o/O = next/previous
   ;;   - i think this is strange.. must come from other-window..



   

  ) ;; end of ra/bind-common-key-bindings




  


  ;;; TEMP: TODO: trying some shit.. delete this later, and note lisp magicks
  ;;    - best to just ask ai.. lol
  ;;    - see why &rest deosn't accept lists..
  ;;    - and how else to do this..
  ;;
  ;; (defmacro macro-test (fun, state, binding) ;; TODO: &rest?
  ;;   (list fun state binding) ;; don't quote args..?
  ;;   ;; (list 'fun state '(list bindings)
  ;;   )

  ;; (macro-test meow-define-keys insert ("<XF86Reload>" . kill-buffer )) ;; TODO: quote here??

  ;; (setq ra-test-var '("<XF86Reload>" . writeroom-mode )) ;; NOTE: not required to define a var (defvar)
  ;; (setq ra-test-var-list '( ;; TODO: it's still a list, not a top-level list of args..
  ;;                           ;; TODO: or do you need to call 'list'..??
  ;;    '("M-n" . writeroom-mode )
  ;;    '("M-p" . writeroom-mode )))

 
  ;; (meow-define-keys
  ;;  'insert ; if you use 'meow-define-keys

  ;;  ;; ra-test-var ;; okay! a single binding works fine..
  ;;  ra-test-var-list ;; TODO: &rest doesn't seem accept lists as an input..?? ..but it's not something you evaluate either.. there must be some way to pass the inside of the list as args..
  ;;
  ;;  ;; '("<XF86Reload>" . writeroom-mode )

  ;;  ;;'ra-common-key-bindings
  ;;  ;; (macroexpand (ra/bind-common-key-bindings))
  ;;  ;; (ra/bind-common-key-bindings) ;; a function does not pass the group of expressions, it just runs it, which is meaningless
  ;;  ;; (eval (ra/bind-common-key-bindings)) ;; only returns the last expression
  ;;  ;; (eval-defun)) ;; just runs the top-level defun around this point.. :/ no args needed
  ;;  ;;   - this is probably how m-x works..
  ;; )
  
  ;; (meow-define-keys
  ;;  'normal ; if you use 'meow-define-keys
  ;;  ;; 'insert ; TODO: this doesn't work..
  ;;  ;;  - FIXME: these only get bound for normal-mode, not insert-mode..

  ;;  ;;(eval-defun 'define-normal-and-insert-keys) ;; quote or not??
  ;;  ;;(eval 'define-normal-and-insert-keys)
  ;;  ;;  - TODO: can't just eval some code..??
  ;;  ;;(defun define-normal-and-insert-keys ()

  ;;  (ra/bind-common-key-bindings)
  ;; )








  
  

  (meow-define-keys
   'normal

   ;; NOTE: only define things for meow's normal-mode here, mostly letters and s-letters
   ;;   - modified keys, special keys, etc. are all defined globally further above

   
   ;; A FEW THINGS FIRST..

   ;; i quite miss helix's return key functionality, it sorta just went to the beginning of the next line.. def worth trying out..
   ;; though, in emacs, if you are in the beginning or end of line, it will continue that way too.. it's smarter
   ;; you just have to rely on c-a/e
   ;;  - NOTE: unlike helix, you can actually insert stuff in normal-mode here.. mostly tabs 'n new-lines
   
   ;; wtf is with the redo binding
   ;; don't touch the original emacs binding on C-/
   ;; '("u" . undo-fu-only-undo ) ;; default is meow-undo NOTE: may be a problem with undo-fu-only-undo
   '("U" . undo-redo)  ;; TODO: re-bind default U = meow-undo-in-selection
   ;;   - TODO: check/add to embark-act menus instead, especially act on region
   ;; '("U" . "C-S-/") ;; hmm, binding to another key didn't work either..
   ;; '("U" . "C-?")

   ;; flip select symbol/word
   '("w" . meow-mark-symbol) ;; FIXME: can't mix-n-match?? W e/b doesn't work..
   '("e" . meow-next-symbol)
   '("b" . meow-back-symbol)
   '("W" . meow-mark-word)
   '("E" . meow-next-word)
   '("B" . meow-back-word)
   ;; C-u = command-universal-argument
   ;; C-c u = meow-universal-argument




   ;; meow-comment is un-bound
   ;; this can't be right..
   ;;   - FOUND IT!!
   ;;     - M-;
   ;;       - of course, the blessed emacs-lisp syntax
   ;;       - good key placement though.. it's just the problem of left-meta
   ;; c-x c-; = comment-line
   ;; TODO: bind to c-x ; (currently only in c-x c-;) in keypad
   ;;   - comment-set-column??
   ;;     - set to 10..??
   ;; c-; = embark-act
   ;;   - spc-a
   ;;   - ; again to comment/un-comment region
   ;;   - act on symbol/region/expression/..?
   ;;   - okay, this is kinda amazing..
   ;;     - yeah... emacs is teh shit..
   ;;     
   ;; could also use / and #, both un-bound
   ;;   - should try not to use symbols for anything though..
   ;;   - NOTE: who knows, maybe major-modes actually bind these for you!!
   ;;'("/" . meow-comment ) ; C-like langs, notably signified search in vim
                          ; NOTE: leave c-/ and c-s-/ alone: default undo/redo
   ;;'("#" . meow-comment ) ; ruby-like langs
   ;; alts: comment-dwim (M-;) /line/region
   ;; NOTE: neither moew-comment nor comment-dwim do anything without anything selected in elisp.. :/
   ;;   - c-x ; is actually fine.. and pairs well with embark-act c-; ;
   ;;     - it's also even in a more ergonomic location..




   ;;; MOVEMENT
   ;;  - NOTE: this can be quite confusing, as it's inconsistent with insert-mode
   ;;    - however, it does match my arrow key-bindings.. so maybe not..??
   ;;    - and if i use hjkl, this elimates redundant bindings
   ;;  - PROBLEM: nah, instead, just re-bind the fucking alt key, that's that problem!
   ;; ("C-n" . forward-paragraph)
   ;; ("C-p" . backward-paragraph)
   ;; ("C-f" . sp-forward-symbol)
   ;; ("C-b" . sp-backward-sybol)


   ;;; SELECTION
   ;;   - these notably belongs solely to normal-mode


   ;; i initially thought inner/bounds-of-thing's symbol meant any non-letter/number char... it turned out to mean symbol in emacs lisp (identifier) :/
   ;;   - TODO: add that to the things list (symbolic char)

   ;; though should play with default meow-block some more..
   ;;'("o" . er/expand-region ) ; meow-block
   ;;'("O" . er/contract-region) ; meow-to-block highlights to next block
   ;; C-o open-line ;; TODO: might not need with return/S-ret, though slightly different functionality..
   '("M-o" . er/expand-region ) ;; this is too hard too find :/
   '("X" . er/expand-region ) ;; interesting.. default was meow-line (goto line)
   ;;  - HACK: hacky conditional impl:
   ;;    - if arg is < 0, contract; = 0, reset; > 0 expand
   ;;      - this is why is it bound to - 0 =         
   ;;    - z doesn't do anything.. this would be the ideal binding: pop-selection
   ;;      - but this would limit it to normal-mode.
   ;;    - NOTE: it's possible to write another function but..
   ;;      eh, might not wanna fight this one, lol..
   ;;      besides it only uses one binding, not 3
   ;;      X x x esc is enough


   ;; from helix:
   ;; hmmm, this one is missing, maybe similar to er/extend and contract (C-=, =/-/0)
   ;; though, still a little different, as helix's expanded to the semantic node's beginning and end..
   ;; maybe similar to i/o?
   ;;
   ;; if tree-sitter
   ;; H = "extend_to_first_nonwhitespace" # c-s-a covers this..
   ;; L = "extend_to_line_end" # c-s-e and kill-line cover this
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


  ;; merge with above
  ;; i was playing with this in the repl..
  ;;     ;; THIS IS FUCKED
  ;;     ;; it binds fine, but fucks up everything..
  ;;     ;; TODO: just see someone else's config..!! doh
  ;;     ;; NOTE: this binds whatever function C-p is bound to the next function
  ;;     '("C-p" . meow-clipboard-yank) ;; originally previous-line, not even meow-previous!
  ;;     '("C-y" . meow-clipboard-save) ;; originally yank, not even meow-save!
  ;;   ;; C-r = "meow-clipbaord-replace" ; TODO: this function is missing..




   ;; END SENSIBLE DEFAULTS




   ;; lol.. i miss this little trick from helix..
   ;; maybe have to create a function for it..
   ;; + is un-bound
   ;; - negative-argument
   ;;   - kinda like meow-reverse..??
   ;; minus = "decrement" # only A-minus is mapped to merge_selections, 'minus' not '-', for parsing reasons
   ;; '=' = "increment" # = maps to format_selections via LSP







  ) ; define-keys 'normal and 'insert










  (meow-define-keys
      'insert


    ;; for the moment, i'm trying to keep things consistent across normal and insert modes, so they are bound together in the same place further above..

    
  )



  ;; some annoying problems first:
  ;; 
  ;;'("x ESC" . nil)
  ;;'("c ESC" . nil)
  ;;   - NOTE: these work fine in meow's key-pad, it's a problem of emacs's original key-chords.. TODO: you must fix it there
  ;;   - these bindings make it hard to <escape> emacs's key-chord input handler
  ;;     - it seems to insert a meta key into the sequence..
  ;;   - TODO: how to escape emacs's key sequence input handler?
  




  

  (meow-define-keys
      'leader ; c-c / spc

    ;; POP-UP MENU ("KEYPAD") BINDINGS GO HERE!!
    ;;   - same as doom's leader key

    ;; examples:
    ;; '("z" . consult-buffer) ; spc-z
    ;; '("C-x b" . consult-buffer) ; c-x b / spc x spc b
    ;; '("C-x C-b" . consult-buffer) ; c-x c-b / spc x b
    ;; '("q q" . "C-x C-c") ; NOTE: when binding to a key-binding, pop-up will display "unknown"



    ;; so far so good... as i just discovered i was using the wrong key-chords the whole time..!! lmao

    
    ;;'("x" . "C-x") ;; or ctl-x-map (no quotes) ;; FIXME: nope, neither solutions work
    ;;'("h" . "C-h") ;; or help-map
    ;;  - an attempt to map spc-x/h to c-x/h ? (instead of c-x/h c-?)
    ;;  - NOTE: if you do this, there's no way to access c-x x-? and c-h c-?
    ;;    - TODO: also, there's no way to see a pop-up with those bindings otherwise..
    ;;  - NOTE: this breaks the convention of how meow keypad works: c-? c-? then fall-back to c-? ?, which may make it even more confusing.. :/
    ;;    - spc-x/h-spc isn't that bad anyway.. it's a nice key-chord that alternates keys with the thumb..
    ;;
    ;; if you do figure it out.. maybe can hack in a C-x/h input?
    ;;   - at the moment, they're undefined..
    ;;'("C-x" . "C-x")
    ;;'("C-h" . "C-h")


    ;;; spc q
    ;; NOTE: i use `/~ key for repl/eshell and defaults: c/m-` for pupup/tmm-menu-bar
    '("q q" . "C-x C-c") ;; who would ever want to kill-emacs..!!?? (..without saving)
    ;;  - TODO: save-buffers-kill-emacs vs save-buffers-kill-terminal
    ;;  - Q seems to already have the right function bound to it: the same as c-x c-c..
    ;;  - use K to kill-emacs, but even that saves all buffers.. i feel it shouldn't
    ;;  - TODO: can get rid of these extra bindings.. the original binding was on c (c-x c-c) anyway..
    '("q Q" . nil)
    '("q K" . nil) ;; could bind to just kill-emacs (no save)
    
    ;; '("q r" . doom/restart-and-restore) ;; was doom/restart
    ;; '("q R" . doom/reload) ;; or c for config
    ;;  - seems to run 'doom sync -B -e', which requires the internet.. :/
    ;;  - TODO: maybe can just add the whole c-h r key-map here..
    
    ;;; spc o

    ;; TODO: '-' for dired-jump seems like a strange binding..?? move to f?
    ;;   - spc-o-f and spc-q-f are used for frames..

    (when (modulep! :term eshell)
      '("o s" . +eshell/toggle) ; s for shell
                                        ; though, doom likely chose e to support having multiple shell app bindings..

      '("o t" . +eshell/toggle) ;t for terminal
      )

    ;;; spc-t
    ;; (when (modulep! :term solaire-mode) ;; TODO: not a module..
    '("t -" . solaire-global-mode) ;; "toggle" arg?
    
    '("t p" . variable-pitch-mode) ;; variable-width font/typeface aka proportional
    ;;   - v is for visible-mode (??), f for fly-check, F for full-screen

      ;; new key-maps
      
      ;;; spc b
      ;;   - i feel this would match (spc w n/p/k/etc.), which feels quite good to press.. but i don't know if i really need a whole nother key-map for it.. as (spc x b/k) + f1/f2 are enough..
      ;;   - TODO: see evil leader map for ideas


      

      
      ;; TODO: these toggles are useful for when shit is slow, especially lsp, possibly broken tree-sitter, formatters, etc.
      ;;   - i may even prefer them off by default.. especially formatters
      ;; from helix:
      ;; [keys.normal.space.t]
      ;; # NOTE: jacked this from someone else, still haven't used..
      ;; # vs in my custom mode?..
      ;; a        = ":toggle-option auto-completion"
      ;; s        = ":toggle-option auto-save"
      ;; f        = ":toggle-option auto-format"
      ;; h        = ":toggle-option lsp.display-inlay-hints"
      ;; l        = ":toggle-option lsp.enable"

      
  ) ; meow-define-keys 'leader spc






  ;; TODO: try playing with this..
  ;; meow-keypad-start-keys

  ;;(setq meow-keypad-start-keys "((?c . ?c) (?h . ?h) (?x . ?x))")
  ;;  TODO: must learn lisp.. :/
  
  ;; Default: ='((?c . ?c) (?h . ?h) (?x . ?x))=

  ;; Alist of keys to begin keypad translation. For instance, given the default
  ;; value, pressing "c" in keypad mode will look up it's value in the alist, and
  ;; add "C-c" to the keypad.
  ;;
  ;; Alist of keys to begin keypad translation. When a key char is pressed,it's corresponding value is appended to C- and the user is prompted to finish the command.

  


  (meow-define-keys
    'keypad ;; meow-keypad, a seperate interactive program, NOTE: not a key-map!!

    ;; change inputs of the program?

    ;; '("?q" . "?q") ; TODO: is this how it works..??
    
    ;; '("x" . "C-x") ; WARN: this breaks everything..
    ;; '("x" . "x") ; inserts x..
    ;; '("x" . nil) ; "without inital keys"
    ;; '("C-x" . "C-x") ; doesn't do anything..??
    ;;  - ERROR: meow-keypad-start-with: Wrong type argument: commandp, ctl-x-map
    ;;  - hmmm, yeah, i think it's for input..
    ;;  
    ;;  - trying to map spc-x to c-x ? not c-x c-?
    ;;  - not sure how to do this for the first time only..

    ;; the real problem is that the whole c-x c-x thing is hard-coded.. would have to alter the meow keypad file..
    ;;   - and actually experience some lisp..!!
    ;;     - nahhh, this is kinda rough.. though being able to see every function tool-tip and variable value on hover is fire!!
    ;;     - TODO: ask meow maintainers if they can create an optional flag..
    ;;       - or better yet, ask ai to create it.. in a modular way, so that i can add it here in my config file..!!
    ;;       - i tried a little hack, didn't quite work..
    ;;         - and lisp is kinda rough to read.. :/
    ;;           - i much prefer ruby or haxe..
    ;;     - NOTE: meow-keypad-try-execute does have nice fallback strategy tho..
    ;;       - "This function supports a fallback behavior, where it allows to use `SPC x f' to execute `C-x C-f' or `C-x f' when `C-x C-f' is not bound."
    ;;   - see meow-keypad-mode
    ;; search meow--keypad-handle-input-event in meow-keypad.el
    ;; perhaps around these lines:
       ;; (meow--keypad-keys
       ;;  (push (cons 'control key) meow--keypad-keys))
       ;; ((alist-get input-event meow-keypad-start-keys)
       ;;  (push (cons 'control (meow--parse-input-event
       ;;                        (alist-get input-event meow-keypad-start-keys)))
       ;;        meow--keypad-keys))

  ) ; meow-define-keys 'keypad


   ;; (TODO: still going through my helix config..)
   ;; STOPPED AT THIS LINE IN HELIX CONFIG:
   ;; [keys.normal.space]




  ) ; with-eval-after-load
)





























;;; NOTE: added by DOOM

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")







;;; NOTE: added by me!
(ra/load-config)



;; some extra functions..
;; NOTE: just use ai to generate these
;;   - and ask it to make them interactive as possible
;;   - just this simple capability really does make quite a difference..
;;     - though, i guess in lesser editors you could just put it in a script and run it on a region
;;       the problem with that is the execution is done async via seperate sub-process, and so if anything happens during that time, maybe problems could occur..?


;; TODO: functions to make

;; (after discovering Roboto font is a HUGE upgrade..)
;;  TODO: create a function to toggle between regular and mono-spaced font
;;  why doesn't org-mode use this..?? >:O
;;    - TODO: use regular font for txt and org files by default


;; because pandoc requires 173mb...
;; the headers may be all i need
;; and make it interactive
;;   - actually quite cool, to make a function interactive / edit a region..!
(defun ra/convert-markdown-headers-to-org (start end)
  "'## header' -> '** header' within the region START to END"
  (interactive "r") ; Makes the function interactive, operating on the region
  (save-excursion
    (goto-char start)
    (while (search-forward-regexp "^#+\\s-+" end t)
      (let* ((match-start (match-beginning 0))
             (match-end (match-end 0))
             (num-hashes (- match-end match-start 1)) ; Number of '#' characters
             (org-stars (make-string num-hashes ?*)))
        (delete-region match-start match-end)
        (insert org-stars " ")))))


;; (defun ra/copy-config-to-local-install from-dir
;; ;;  - TODO: INCOMPLETE
;; ;;  - TODO: ask ai to generate this, and check against my bullshit lol
;;       - but my lisp-fu is def getting better!
;;     (if
;;         (and
;;          (equal '(f-dir? 'from-dir) t) ;; try = TODO: is t a special lisp object? like nil? keep them un-evaluated, as this checks lisp objects
;;          (equal '(f-empty? 'from-dir) nil));; then
;;         (copy-directory 'from-dir 'doom-user-dir))) ;; or f-copy
;; ;;        - FIXME: (wrong-type-argument stringp doom-user-dir
;; ;;          - it's set by defvar.. trid quote and unquoted..
