;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; NOTE: added by me!
(defun ra/post-config ()
  ; set after doom's crap
  (setq default-directory "/home/ra/my-stuff/repos/")
    ; NOTE: running doom with sudo would make ~/ == /.root/

  (+word-wrap-mode)

  (+zen/toggle-fullscreen)
    ; NOTE: doesn't affect when run in terminal
    ; ahhhh, peace and emacs.. :3

  ;(doom/increase-font-size ())
    ; for more zen
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


(ra/post-config)
