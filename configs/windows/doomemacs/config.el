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
(setq doom-theme 'doom-solarized-dark) ; doom-palenight
                                      ; doom-tokyo-night, for darker/higher contrast background and comments
                                      ; doom-moonlight, for lighter background and comments
                                    ; doom-one
                                    ; ephemerel
                                    ; doom-solarized-dark, great! now with hot pink 'n purple!!
                                    ; doom-laswerwave, a synth pink, nice!
                                    ; doom-shades-of-purple, nice!
                                    ; doom-tomorrow-night, similar to gruvbox
  ; NOTE: can use consult-theme to try out all the themes
  ; the ones prefixed with doom- are probably a bit more vetted

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
